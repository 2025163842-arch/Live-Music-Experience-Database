-- 1. Venues and the Number of Shows
SELECT 
    v.VenueName,
    COUNT(s.ShowID) AS NumberOfShows
FROM venue v
LEFT JOIN "SHOW" s ON v.VenueID = s.VenueID
GROUP BY v.VenueName
ORDER BY NumberOfShows DESC;

-- 2. Venue That Hosted the Most Shows
SELECT 
    v.VenueName,
    COUNT(s.ShowID) AS TotalShows
FROM venue v
LEFT JOIN "SHOW" s ON v.VenueID = s.VenueID
GROUP BY v.VenueName
ORDER BY TotalShows DESC
LIMIT 1;

-- 3. Artists Who Performed at Each Venue
SELECT 
    v.VenueName,
    a.ArtistName,
    s.ShowName
FROM venue v
JOIN "SHOW" s ON v.VenueID = s.VenueID
JOIN show_artists sa ON s.ShowID = sa.ShowID
JOIN artist a ON sa.ArtistID = a.ArtistID
ORDER BY v.VenueName, a.ArtistName;

-- 4. District With the Highest Total Revenue
SELECT 
    v.District,
    SUM(s.Price) AS TotalRevenue
FROM venue v
JOIN "SHOW" s ON v.VenueID = s.VenueID
GROUP BY v.District
ORDER BY TotalRevenue DESC
LIMIT 1;

-- 5. Most Frequently Performing Artist
SELECT 
    a.ArtistName,
    COUNT(sa.ShowID) AS NumberOfPerformances
FROM artist a
JOIN show_artists sa ON a.ArtistID = sa.ArtistID
GROUP BY a.ArtistName
ORDER BY NumberOfPerformances DESC
LIMIT 1;