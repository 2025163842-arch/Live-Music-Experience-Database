--Create Table Statements
CREATE TABLE VENUE(
	
	VenueID    	SERIAL 			NOT NULL,
	VenueName 	VARCHAR(50) 	NOT NULL,
	Address 	VARCHAR(255) 	NOT NULL,
	Phone 		VARCHAR(25) 	NOT NULL,
	District 	VARCHAR(15) 	NOT NULL,
	CONSTRAINT VenuePK PRIMARY KEY (VenueID)
	
);

CREATE TABLE ARTIST(

	ArtistID	SERIAL			NOT NULL,
	ArtistName	VARCHAR(50)		NOT NULL,
	Genre  		VARCHAR(25)		NOT NULL,
	Address 	VARCHAR(255)	NOT NULL,
	Phone		VARCHAR(25)		NOT NULL,
	Email		VARCHAR(255)	NOT NULL,
	District	VARCHAR(15)		NOT NULL,
	CONSTRAINT ArtistPK PRIMARY KEY (ArtistID)

);

CREATE TABLE "SHOW"(

	ShowID		SERIAL			NOT NULL,
	ShowName	VARCHAR(50)		NOT NULL,
	StartDate	DATE			NOT NULL,
	EndDate		DATE			NOT NULL,
	Price		NUMERIC(6,2)	NOT NULL,
	Description	VARCHAR(255)	NOT NULL,
	VenueID		INTEGER			NOT NULL,
	CONSTRAINT ShowPK PRIMARY KEY (ShowID),
	CONSTRAINT ShowVenueFK FOREIGN KEY (VenueID)
		REFERENCES VENUE (VenueID)

);

CREATE TABLE SHOW_ARTISTS(

	ShowID 		INTEGER 		NOT NULL
		REFERENCES "SHOW" (ShowID)
			ON DELETE CASCADE,
			
	ArtistID	INTEGER			NOT NULL
		REFERENCES ARTIST (ArtistID)
			ON DELETE CASCADE,
			
	CONSTRAINT ShowArtistPK PRIMARY KEY (ShowID, ArtistID)
	
);

--Insertion to Table Statements
INSERT INTO VENUE (VenueName, Address, Phone, District) VALUES
('Belize Civic Center','Central American Boulevard, Belize City','222-5237','Belize'),
('FFB Stadium','1820 Hummingbird Hwy, Belmopan','822-3410','Cayo'),
('Belmopan Civic Center Parking Lot','Bliss Parade, Belmopan, Cayo District','822-2271','Cayo'),
('Cork Street Whiskey Bar','19 Cork Street, Belize City','621-6313','Belize'),
('Mangos Bar','Lot 32 Sittee Point, Hopkins','663-5638','Stann Creek'),
('Ramada by Wyndham Princess','Newton Barracks Rd, Belize City','223-2670','Belize'),
('Governor General Field','North Ring Road, Belmopan, Cayo District','344-7787','Cayo'),
('Orange Walk Central Park', 'Queen Victoria Ave, Orange Walk', '670-2053', 'Orange Walk'),
('University of Belize Gymnasium', '64 St John, Belmopan', '822-3680', 'Cayo'),
('Bliss Centre for Performing Arts', 'Southern Foreshore, Belize City', '227-2110', 'Belize');

INSERT INTO ARTIST (ArtistName, Genre, Address, Phone, Email, District) VALUES
('Kes the Band','Soca','Bay Street, Belize City','623-3456','kb@gmail.com','Belize'),
('DJ Puffy','Caribbean-EDM','Coral Road, Belize City','620-3885','djpffy@gmail.com','Belize'),
('Anika Berry','Soca','Palm Ave, San Ignacio','672-9899','anikab@gmail.com','Cayo'),
('Ras Indio','Roots Reggae','Mango Street, Belmopan','613-8761','Rindio@gmail.com','Cayo'),
('Rob Willford','Country','Ocean Drive, Dangriga','614-7787','RobWilliford@gmail.com','Stann Creek'),
('JD Wood','Gospel','King Street, Belize City','601-4563','JDW@gmail.com','Belize'),
('Loreto Pelayo','Jazz','Coconut Lane, Punta Gorda','600-3456','Lpelayo@gmail.com','Toledo'),
('Lord Rhaburn','Calypso','Sibun Lane, Belmopan','678-9756','Lraburn@gmail.com','Cayo'),
('Skinny Fabulous','Soca','Peach Street, Belize City','611-1112','Sfabulous@gmail.com','Belize'),
('Brithney Starr','Reggae','Almond street, Punta Gorda','624-0101','BrthneyS@gmail.com','Toledo'),
('501 Genesis', 'Reggae', 'Hummingbird Ave, Belmopan', '601-4860', '502genesis@gmail.com', 'Cayo');

INSERT INTO "SHOW" (ShowName, StartDate, EndDate, Price, Description, VenueID) VALUES
('Belize Soca and Culture Festival','2025-09-20','2025-09-20',75.00,'Annual festival celebrating soca music and Caribbean culture with live performances.',1),
('Live Concert','2025-10-19','2025-10-19',50.00,'High-energy DJ set featuring soca, dancehall, and Caribbean music.',4),
('Agric Benefit Concert','2025-05-31','2025-05-31',60.00,'Local benefit concert showcasing Belizean artists to support community agriculture programs.',2),
('Toast to 2026 Concert','2025-12-31','2025-12-31',40.00,'New Year’s Eve festival with multiple Belizean performers celebrating the countdown to 2026.',3),
('Belize Songwriter Festival','2025-05-23','2025-05-24',150.00,'Multi-day festival highlighting international and local songwriters with live performances.',6),
('Belize International Jazz Festival','2025-10-11','2025-10-11',80.00,'Jazz-focused festival featuring Belizean and international musicians in live jazz nights.',5),
('A Toast to the New 2026','2025-12-31','2026-01-01',20.00,'Saying Goodbye to 2025.',7),
('Valentines Heart Festival', '2026-02-13', '2026-02-15', 25.00, 'Feel the love over the weekend!', 9),
('Weekend Gospel', '2026-03-07', '2026-03-08', 20.00, 'Blessing to the ears', 10),
('Belize Artist Bash', '2025-06-20', '2025-06-21', 40.00, 'Tell the world about Belize and come out to support Belizean artists.', 1);

INSERT INTO SHOW_ARTISTS (ShowID, ArtistID) VALUES
(1,1),
(2,2),
(3,10),
(3,9),
(3,3),
(4,4),
(5,5),
(5,6),
(6,7),
(7,8),
(8,11),
(9,11),
(10,8);