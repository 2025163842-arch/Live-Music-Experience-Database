-- Stored Procedure 1 - Add Show With Artist
CREATE PROCEDURE AddShowWithArtist(
    p_ShowName VARCHAR,
    p_StartDate DATE,
    p_EndDate DATE,
    p_Price NUMERIC,
    p_Description VARCHAR,
    p_VenueName VARCHAR,
    p_ArtistName VARCHAR  
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_VenueID INT;
    v_ArtistID INT;
    v_ShowID INT;
BEGIN
    SELECT VenueID INTO v_VenueID FROM VENUE WHERE VenueName = p_VenueName;
 
    SELECT ArtistID INTO v_ArtistID FROM ARTIST WHERE ArtistName = p_ArtistName;

    IF v_VenueID IS NULL OR v_ArtistID IS NULL THEN
        RAISE EXCEPTION 'Venue or Artist name not found. Check your spelling.';
    END IF;

    INSERT INTO "SHOW" (ShowName, StartDate, EndDate, Price, Description, VenueID)
    VALUES (p_ShowName, p_StartDate, p_EndDate, p_Price, p_Description, v_VenueID)
    RETURNING ShowID INTO v_ShowID;

    INSERT INTO SHOW_ARTISTS (ShowID, ArtistID)
    VALUES (v_ShowID, v_ArtistID);
END;
$$;

-- Stored Procedure 2 - Update Venue Contact
CREATE PROCEDURE UpdateVenueContact(
    p_VenueName VARCHAR,
    p_NewPhone VARCHAR,
    p_NewAddress VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    
    UPDATE VENUE
    SET Phone = p_NewPhone,
        Address = p_NewAddress
    WHERE VenueName = p_VenueName;

    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Venue with name "%" not found.', p_VenueName;
    END IF;
END;
$$;



-- Function 1 - Total Shows By Venue
CREATE OR REPLACE FUNCTION TotalShowsByVenue(
    p_VenueName VARCHAR
)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_TotalShows INT;
BEGIN
    SELECT COUNT(s.ShowID)
    INTO v_TotalShows
    FROM VENUE v
    LEFT JOIN "SHOW" s
        ON v.VenueID = s.VenueID
    WHERE v.VenueName = p_VenueName;

    IF NOT EXISTS (
        SELECT 1
        FROM VENUE
        WHERE VenueName = p_VenueName
    ) THEN
        RAISE EXCEPTION 'Venue "%" not found.', p_VenueName;
    END IF;

    RETURN v_TotalShows;
END;
$$;

-- Function 2 - Venue Revenue Estimate
CREATE OR REPLACE FUNCTION VenueRevenueEstimate(
    p_VenueName VARCHAR
)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    v_TotalRevenue NUMERIC;
BEGIN
    SELECT COALESCE(SUM(s.Price), 0)
    INTO v_TotalRevenue
    FROM VENUE v
    LEFT JOIN "SHOW" s
        ON v.VenueID = s.VenueID
    WHERE v.VenueName = p_VenueName;

    IF NOT EXISTS (
        SELECT 1
        FROM VENUE
        WHERE VenueName = p_VenueName
    ) THEN
        RAISE EXCEPTION 'Venue "%" not found.', p_VenueName;
    END IF;

    RETURN v_TotalRevenue;
END;
$$;



-- Trigger - Prevent Duplicate Artists
CREATE OR REPLACE FUNCTION prevent_duplicate_artists()
RETURNS TRIGGER AS $$
DECLARE
	trg_artist_name VARCHAR(50);
    trg_show_name VARCHAR(50);	
BEGIN

	IF EXISTS (
		SELECT 1
		FROM SHOW_ARTISTS
		WHERE ArtistID = NEW.ArtistID AND
			  ShowID = NEW.ShowID
	)
		THEN

		
	SELECT a.ArtistName, s.ShowName
	INTO trg_artist_name, trg_show_name
	FROM ARTIST a
	INNER JOIN SHOW_ARTISTS sa ON a.ArtistID = sa.ArtistID
	INNER JOIN "SHOW" s ON sa.ShowID = s.ShowID
	WHERE a.ArtistID = NEW.ArtistID AND
		  s.ShowID = NEW.ShowID;
	

		RAISE EXCEPTION 
			'Artist % already exists within show %.',
			trg_artist_name, trg_show_name;
			

	END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER tgr_prevent_duplicate_artists
BEFORE INSERT
ON SHOW_ARTISTS
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_artists();



-- Query 1 - Highest number of shows for the Venue
SELECT VenueName, ShowCount
FROM (
    SELECT v.VenueName,
           COUNT(s.ShowID) AS ShowCount
    FROM Venue v
    LEFT JOIN "SHOW" s ON v.VenueID = s.VenueID
    GROUP BY v.VenueID, v.VenueName
) AS VenueShows
ORDER BY ShowCount DESC
LIMIT 1;

-- Query 2 - All artists who performed in a district
SELECT DISTINCT a.ArtistName,
       v.VenueName,
       v.District
FROM Artist a
INNER JOIN Show_Artists sa ON a.ArtistID = sa.ArtistID
INNER JOIN "SHOW" s ON sa.ShowID = s.ShowID
INNER JOIN Venue v ON s.VenueID = v.VenueID
WHERE v.District = 'Belize'
ORDER BY a.ArtistName;
