use HowlOfADog

drop table Cages;
drop table Breeds;
drop table Animals;

drop table People;
drop table Volunteers;
drop table Blacklist;
drop table Donations;

drop table Employees;
drop table ShelterClinic;

drop table Adopters;
drop table Adoptions;

/* RELATIONS:
Cages-Animals => 1:n -> One cage can contain multiple animals, one animal can be contained in only one cage
Breeds-Animals => 1:n -> One animal can have one breed, but a breed can be had my multiple animals

Animals-Adopters => m:n -> An animal can be adopted by multiple adopters, one adopter can adopt multiple animals
* Animals-Adoptions => n:1 -> An animal can be shown in multiple adoptions, but an adoption can only show one animal
* Adoptions-Adopters => 1:n -> An adopter can have multiple adoptions, but an adoption can be owned by only one adopter 

Animals-Employees => m:n -> An animal can be treated by multiple employees, an employee can treat multiple animals
* Animals-ShelterClinic => n:1 -> An animal can be treated multuple times at a clinic, but a clinic can treat only one animal at a time
* ShelterClinic-Employees => 1:n -> An employee can only work at a clinic, but the clinic can have multiple employees

People-Adopters => 1:1 -> An adopter is a person and a person can be an adopter
People-Employees => 1:1 -> An employee is a person and a person can be an employee
People-Blacklist => 1:1 -> A person can on the blacklist and the blacklist contains a person
People-Volunteers => 1:1 -> A volunteer is a person and a person can be a volunteer
People-Donations => 1:n -> A person can donate multiple times, but a donation is made only by a person
*/

CREATE TABLE Cages
(
	CagesID int NOT NULL IDENTITY(1,1),
	ThemeColor varchar(255),
	CONSTRAINT PK_Cages PRIMARY KEY(CagesID)
);

CREATE TABLE Breeds
(
	BreedsID int NOT NULL IDENTITY(1,1),
	SpeciesName varchar(255) NOT NULL, -- dog/cat/fox
	BreedName varchar(255) NOT NULL,

	CONSTRAINT PK_Breeds PRIMARY KEY(BreedsID)
);

CREATE TABLE Animals
(
	AnimalsID int NOT NULL IDENTITY(1,1),  -- The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.
	CagesID int,
	BreedsID int,
	AnimalName varchar(255),
	DateOfBirth date,
	WeightKg int NOT NULL,  -- weight in kg
	Condition varchar(255) NOT NULL, -- healthy/sick
	DateOfArrival date NOT NULL,

	CONSTRAINT PK_Animals PRIMARY KEY(AnimalsID),
	CONSTRAINT FK_Animals_Cages FOREIGN KEY(CagesID) REFERENCES Cages(CagesID),
	CONSTRAINT FK_Animals_Breeds FOREIGN KEY(BreedsID) REFERENCES Breeds(BreedsID)
);

CREATE TABLE People
(
	PeopleID varchar(13) NOT NULL, -- cnp
	FirstName varchar(255) NOT NULL,
	LastName varchar(255) NOT NULL,
	Country varchar(255) NOT NULL,
	City varchar(255) NOT NULL,
	StreetAdress varchar(255) NOT NULL,
	PhoneNumber varchar(255) NOT NULL,
	Email varchar(255),
	DateOfBirth date NOT NULL,

	CONSTRAINT PK_People PRIMARY KEY(PeopleID)
);

CREATE TABLE Volunteers
(
	VolunteersID varchar(13) NOT NULL,
	JobDescription text,

	CONSTRAINT PK_Volunteers PRIMARY KEY(VolunteersID),
	CONSTRAINT FK_Volunteers_People FOREIGN KEY(VolunteersID) REFERENCES People(PeopleID),
);

CREATE TABLE Blacklist
(
	PeopleID varchar(13) NOT NULL,
	Reason text NOT NULL,
	BlacklistDate date NOT NULL,

	CONSTRAINT PK_Blacklist PRIMARY KEY(PeopleID),
	CONSTRAINT FK_Blacklist_People FOREIGN KEY(PeopleID) REFERENCES People(PeopleID),
);

CREATE TABLE Donations
(
	DonationsID int NOT NULL IDENTITY(1,1),
	PeopleID varchar(13) NOT NULL,
	DonationType varchar(255) NOT NULL, -- cash/supplies
	DonationAmount int NOT NULL,  -- ex: 2000dolari/5jucarii
	DonationDate date NOT NULL,

	CONSTRAINT PK_Donations PRIMARY KEY(DonationsID),
	CONSTRAINT FK_Donations_People FOREIGN KEY(PeopleID) REFERENCES People(PeopleID)
);

CREATE TABLE Employees
(
	EmployeesID varchar(13) NOT NULL,
	Job varchar(255),
	Salary int,

	CONSTRAINT PK_Employees PRIMARY KEY(EmployeesID),
	CONSTRAINT FK_Employees_People FOREIGN KEY(EmployeesID) REFERENCES People(PeopleID) 
);

CREATE TABLE Treatments
(
	TreatmentsID int NOT NULL IDENTITY(1,1),
	AnimalsID int NOT NULL,
	EmployeesID varchar(13) NOT NULL, -- doctor
	TreatmentType varchar(255) NOT NULL, -- (vaccinations / prescriptions / procedures / other)
	TreatmentDate date NOT NULL,
	TreatmentCost int NOT NULL,
	TreatmentDescription text,

	CONSTRAINT PK_Treatments PRIMARY KEY(TreatmentsID),
	CONSTRAINT FK_Treatments_Animals FOREIGN KEY(AnimalsID) REFERENCES Animals(AnimalsID),
	CONSTRAINT FK_Treatments_Employees FOREIGN KEY(EmployeesID) REFERENCES Employees(EmployeesID),
);

CREATE TABLE Adopters
(
	AdoptersID varchar(13) NOT NULL,
	PrefferedBreed varchar(255),
	PrefferedAge int,

	CONSTRAINT PK_Adopters PRIMARY KEY(AdoptersID),
	CONSTRAINT FK_Adopters_People FOREIGN KEY(AdoptersID) REFERENCES People(PeopleID),
);

CREATE TABLE Adoptions
(
	AdoptionsID int NOT NULL IDENTITY(1,1),
	AnimalsID int NOT NULL,
	AdoptersID varchar(13) NOT NULL,
	DateOfAdoption date NOT NULL,

	CONSTRAINT PK_Adoptions PRIMARY KEY(AdoptionsID),
	CONSTRAINT FK_Adoptions_Animals FOREIGN KEY(AnimalsID) REFERENCES Animals(AnimalsID),
	CONSTRAINT FK_Adoptions_Adopters FOREIGN KEY(AdoptersID) REFERENCES Adopters(AdoptersID)
);