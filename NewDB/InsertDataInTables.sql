use HowlOfADog


INSERT INTO Cages(ThemeColor)
VALUES ('blue'),
	   ('blue'),
	   ('blue'),
	   ('pink'),
	   ('pink'),
	   ('yellow'),
	   ('red'),
	   ('purple'),
	   ('green'),
	   ('cyan'),
	   ('yellow'),
	   ('white'),
	   ('black'),
	   ('brown'),
	   ('yellow'),
	   ('pink')
GO

DELETE FROM Cages
SELECT * FROM Cages
GO


INSERT INTO Breeds(SpeciesName, BreedName)
VALUES ('Fox', 'Corsac Fox'),
	   ('Fox', 'Swift Fox'),
	   ('Fox', 'Tibetan Sand Fox'),
	   ('Dog', 'Labrador'),
	   ('Dog', 'Irish Terrier'),
	   ('Dog', 'Shiba Inu'), 
	   ('Dog', 'Stray'),
	   ('Cat', 'Stray'),
	   ('Cat', 'Bengal cat')
GO

DELETE FROM Breeds
SELECT * FROM Breeds
GO


INSERT INTO Animals(CagesID, BreedsID, AnimalName, DateOfBirth, WeightKg, Condition, DateOfArrival)
VALUES (1, 1, 'Finnegan Fox', '2017-05-17', 3, 'healthy', '2020-04-18'),
	   (1, 7, 'Pufi', '2015-06-19', 6, 'sick', '2015-06-19'),
	   (2, 7, 'Lili', '2011-06-02', 1, 'sick', '2013-03-29'),   
	   (3, 4, 'Phinneas', '2020-09-22', 10, 'healthy', '2021-03-07'),
	   (3, 6, 'Hardy', '2014-08-12', 3, 'healthy', '2021-01-01'),
	   (4, 7, 'Bojangles', '2019-08-10', 7, 'healthy', '2019-08-10'),
	   (5, 8, 'Grady', '2020-05-06', 2, 'sick', '2020-05-06'),
	   (6, 8, 'Nino', '2020-05-06', 1, 'sick', '2020-05-06'),
	   (7, 2, 'Riddle', '2018-04-23', 3, 'healthy', '2019-08-13'),
	   (7, 2, 'Dazzle', '2017-05-20', 2, 'sick' , '2017-06-30'),
	   (8, 5, 'Maggie', '2015-11-19', 8, 'healthy', '2016-03-22'),
	   (9, 7, 'Sigma', '2021-02-20', 5, 'healthy', '2021-03-05'),
	   (10, 7, 'Peanut', '2014-05-20', 4, 'sick', '2015-06-18'),
	   (11, 8, 'Penny', '2020-09-22', 1, 'healthy', '2021-09-22'),
	   (12, 8, 'Tux', '2016-03-18', 1, 'healthy', '2019-11-03'),
	   (13, 3, 'Congo', '2016-01-09', 4, 'healthy', '2016-12-19'),
	   (14, 3, 'Aspen', '2019-12-23', 4, 'sick', '2020-02-11'),
	   (15, 9, 'Cookie', '2020-05-23', 3, 'healthy', '2021-04-03'),
	   (2, 8, 'Frankenstein', '2010-10-10', 4, 'healthy', '2011-10-09'),
	   (7, 1, 'Kona', '2014-06-15', 5, 'healthy', '2015-07-16'),
	   (15, 8, 'Clover', '2015-07-16', 4, 'healthy', '2016-08-13'),
	   (16, 7, 'Lola', '2018-12-04', 9, 'healthy', '2018-12-04'),
	   (16, 7, 'Lala', '2018-12-04', 9, 'sick', '2018-12-04'),
	   (16, 7, 'Lulu', '2018-12-04', 9, 'healthy', '2018-12-04')
GO

DELETE FROM Animals
SELECT * FROM Animals
GO


INSERT INTO People(PeopleID, FirstName, LastName, Country, City, StreetAdress, PhoneNumber, Email, DateOfBirth)
VALUES ('8620127017386', 'Maria', 'Banner', 'USA', 'New York', '13th Street', '320-234-4262', 'MariaCBanner@armyspy.com', '1962-01-27'),  --Employee
	   ('7561110036197', 'Robert', 'Peck', 'USA' , 'Orlando', '3058 Stoneybrook Road', '595-28-9999', 'RobertJPeck@armyspy.com', '1956-11-10'),  --Employee
	   ('8800508409959', 'Yessenia', 'Jackson', 'USA' , 'Oklahoma City', '4589 Ottis Street', '443-50-5839', 'YesseniaEJackson@rhyta.com', '1980-05-08'),  --Employee
	   ('7490306405939', 'Grant', 'Rivera', 'USA', 'Portland', '3271 Hope Street', '540-19-3642', 'GrantDRivera@dayrep.com', '1949-03-06'),  --Employee
	   ('8541110406594', 'Aline', 'Witt', 'USA', 'Milwaukee', '2187 Highland Drive', '920-657-8832', 'AlineJWitt@jourrapide.com', '1954-11-10'),  --Employee
	   ('8140418407293', 'Juliette', 'Alvarado', 'USA', 'Hood River', '364 Sycamore Road', '541-386-6065', 'JulietteKAlvarado@dayrep.com', '1914-04-18'),  --Employee
	   ('7750417427003', 'Christopher', 'Hunter', 'USA', 'Gainesville', '4977 Rhapsody Street', '352-313-3101', 'ChristopherNHunter@dayrep.com', '1975-04-17'),  --Employee
	   ('7740205429983', 'Kenny', 'Gonzalez', 'USA', 'Philadelphia', '4747 Glen Falls Road', '215-866-5226', 'KennyKGonzalez@dayrep.com', '1974-02-05'),  --Employee
	   ('8580919525220', 'Roberta', 'Prather', 'USA', 'Los Angeles', '3312 Brannon Street', '213-307-3887', 'RobertaCPrather@armyspy.com', '1958-09-19'),  --Employee
	   ('7800711525856', 'John', 'Potts', 'USA', 'Everett', '3702 Ryder Avenue', '425-327-2983', 'JohnBPotts@jourrapide.com', '1980-07-11'),  -- Employee
	   ('7671112526328', 'George', 'Porterfield', 'USA', 'Heflin', '2577 Beeghley Street', '256-201-6124', 'GeorgeAPorterfield@dayrep.com', '1967-11-12'),  -- Volunteer
	   ('7400226128293', 'Hollis', 'Hopkins', 'USA', 'Worthington', '3444 Palmer Road', '614-673-0378', 'HollisNHopkins@jourrapide.com', '1945-06-19'),  -- Volunteer
	   ('7830410129514', 'Christopher', 'Sullivan', 'USA', 'Bay City', '2686 Ripple Street', '989-709-5536', 'ChristopherMSullivan@jourrapide.com', '1983-04-10'),  -- Volunteer
	   ('7400226129578', 'Joseph', 'Piazza', 'USA', 'Eagleville', '387 Quincy Street', '267-393-7460', 'JosephLPiazza@rhyta.com', '1940-02-26'),  -- Volunteer
	   ('7550102109794', 'Owen', 'Nathaniel', 'USA', 'Gainesville', '3103 Bagwell Avenue', '352-658-1748', 'OwenBNathaniel@armyspy.com', '1955-01-02'),  -- Volunteer
	   ('8571101105005', 'Adalgisa', 'Siciliano', 'Italy', 'Napoli', '71030-Casalvecchio Di Puglia FG', '0390 2857446', 'AdalgisaSiciliano@jourrapide.com', '1957-11-01'),
	   ('7770217106555', 'Leonardo', 'Zito', 'Italy', 'Napoli', '34078-Sagrado GO', '0354 1540363', 'LeonardoZito@jourrapide.com', '1977-02-17'),  -- foster adopter
	   ('7710619107072', 'Gaspare', 'Piazza', 'Italy', 'Napoli', '89025-Bosco RC', '0349 1779751', 'GasparePiazza@rhyta.com', '1971-06-19'),  -- donations, Volunteer
	   ('8880821107634', 'Claudia', 'Fanucci', 'Italy', 'Napoli', '32036-Sedico BL', '0353 2191997', 'ClaudiaFanucci@jourrapide.com', '1988-08-21'),  -- donations
	   ('7730612269831', 'Verrill', 'Lamontagne', 'France', 'Paris', '15, rue Jean Vilar', '05.47.86.21.07', 'VerrillLamontagne@dayrep.com', '1973-06-12'),  --adopter, foster adopter
	   ('8730425107617', 'Brigitte', 'Lamontagne', 'France', 'Paris', '15, rue Jean Vilar', '01.40.67.37.88', 'BrigitteLamontagne@dayrep.com', '1973-04-25'), --adopter
	   ('8000515105719', 'Olympia', 'Racicot', 'France', 'Paris', '27, Place Charles de Gaulle', '03.51.19.26.35', 'OlympiaRacicot@dayrep.com', '2000-05-15'),
	   ('7990912198661', 'Sennet', 'Racicot', 'France', 'Paris', '27, Place Charles de Gaulle', '01.39.98.67.71', 'SennetRacicot@armyspy.com', '1999-09-12'),
	   ('8940308266909', 'Birgit', 'Adler', 'Germany', 'Berlin', 'Sömmeringstr. 90', '07271 11 20 47', 'BirgitAdler@rhyta.com', '1994-03-08'),  -- adopter
	   ('7800118197518', 'Erik', 'Adler', 'Germany', 'Berlin', 'Sömmeringstr. 90', '07271 57 70 82', 'ErikFuerst@rhyta.com', '1980-01-18'),  -- adopter
	   ('7500811196572', 'Jens', 'Lowe', 'Germany', 'Berlin', 'Spresstrasse 1', '0461 21 61 68', 'JensLowe@rhyta.com', '1950-08-11'), -- foster adopetr
	   ('8851213267194', 'Martina', 'Eiffel', 'Germany', 'Berlin', 'Kastanienallee 62', '04885 55 75 32', 'MartinaEiffel@jourrapide.com', '1985-12-13'),  -- donations
	   ('7950327195255', 'Sakari', 'Käyhkö', 'Finland', 'Helsinki', 'Hakulintie 77', '050 363 8631', 'SakariKayhko@armyspy.com', '1995-03-27'),  -- foster
	   ('8020110265942', 'Pia', 'Monto', 'Finland', 'Helsinki', 'Puruntie 96', '046 083 4788', 'PiaMonto@teleworm.us', '2002-01-10'),  -- foster
	   ('7040715198929', 'Emppu', 'Haapoja', 'Finland', 'Helsinki', 'Rengaskuja 62', '050 295 3389', 'EmppuHaapoja@teleworm.us', '2004-07-15')  -- blacklist
GO

DELETE FROM People
SELECT * FROM People
GO


INSERT INTO Volunteers(VolunteersID, JobDescription)
VALUES ('7671112526328', 'emotional support for animals in need'),
	   ('7400226128293', 'helps with cleaning'),
	   ('7830410129514', 'promotes on social media the shelter'),
	   ('7400226129578', 'plays with animals'),
	   ('7550102109794', 'takes animals on walks'),
	   ('7710619107072', 'playing with animals')
GO

DELETE FROM Volunteers
SELECT * FROM Volunteers
GO


INSERT INTO Blacklist(PeopleID, Reason, BlacklistDate)
VALUES ('7040715198929', 'returned dog after Christmas', '2020-12-28')
GO

DELETE FROM Blacklist
SELECT * FROM Blacklist
GO


INSERT INTO Donations(PeopleID, DonationType, DonationAmount, DonationDate)
VALUES  ('8851213267194', 'toys', 5, '2020-05-07'),
		('7710619107072', 'money', 5000, '2021-05-06'),
		('7710619107072', 'food', 20, '2021-05-06'),
		('7710619107072', 'toys', 30, '2021-05-06'),
		('8880821107634', 'money', 3000, '2020-05-06'),
		('7710619107072', 'money', 10000, '2021-05-07')
GO

DELETE FROM Donations
SELECT * FROM Donations
GO


INSERT INTO Employees(EmployeesID, Job, Salary)
VALUES ('8620127017386', 'vet', 102333),
	   ('7561110036197', 'vet', 102333),
	   ('8800508409959', 'animal caretaker', 29142),
	   ('7490306405939', 'animal caretaker', 30000),
	   ('8541110406594', 'animal caretaker', 35000),
	   ('8140418407293', 'manager of volunteer services', 34240),
	   ('7750417427003', 'veterinary receptionist', 40544),
	   ('7740205429983', 'adoption manager', 84849),
	   ('8580919525220', 'shelter manager', 67806),
	   ('7800711525856', 'animal trainer', 41378)
GO

DELETE FROM Employees
SELECT * FROM Employees
GO


INSERT INTO Treatments(AnimalsID, EmployeesID, TreatmentType, TreatmentDate, TreatmentCost, TreatmentDescription)
VALUES  (8, '8620127017386', 'procedure', '2020-04-18', 2000, 'no complications'),  -- same date as arrival
		(9, '8620127017386' , 'procedure', '2018-05-06', 1000, 'removed first tumour'),
		(9, '8620127017386' , 'procedure', '2019-05-06', 1000, 'removed second tumour'),
		(11, '7561110036197', 'vaccination', '2021-04-07', 25, 'no complications'),
		(10, '7561110036197', 'pills', '2014-03-30', 20, 'vomiting'),
		(10, '7561110036197', 'pills', '2016-03-30', 20, 'no complications'),
		(10, '8620127017386', 'pills', '2014-03-30', 20, 'vomiting')
GO

DELETE FROM Treatments
SELECT * FROM ShelterClinic
GO


INSERT INTO Adopters(AdoptersID, PrefferedBreed, PrefferedAge)
VALUES ('7730612269831', 'Cat', 2),
	   ('8730425107617', 'Dog', 5),
	   ('8940308266909', 'Fox', 7),
	   ('7800118197518', 'Dog', 1)
GO

DELETE FROM Adopters
SELECT * FROM Adopters
GO

INSERT INTO Adoptions(AnimalsID, AdoptersID, DateOfAdoption)
VALUES	(7, '7730612269831', '2018-09-10'),
		(7, '8730425107617', '2018-09-10'),
		(1, '8940308266909', '2020-08-08'),
		(9, '8940308266909', '2020-08-08'),
		(16, '8940308266909', '2020-08-08'),
		(22, '7800118197518', '2020-08-08'),
		(23, '7800118197518', '2020-08-08'),
		(24, '7800118197518', '2020-08-08')
GO

DELETE FROM Adoptions
SELECT * FROM Adoptions
GO