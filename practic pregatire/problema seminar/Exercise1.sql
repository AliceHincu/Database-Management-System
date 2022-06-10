create database MiniFacebook
go

use MiniFacebook
go

/* Create a database for a MiniFacebook system. The entities
of the problem domain are: Users, Pages, Likes, Categories,
Posts, and Comments. Each user has a name, current city 
and DOB. A user can like multiple pages. The system
stores the data of each like. A page has a name and a category.
(ex sports, movies, music, etc). A category also has a 
cateogry description. Users write posts and comment
on existing posts. A user's post has a date, text, and
number of shares. A comment is anonymous, has a text,
a date, and a flag indicating whether it's a top comment
for the corresponding post. */

CREATE TABLE Users(
	UserId INT PRIMARY KEY IDENTITY(1,1),
	UserName varchar(100),
	UserCity varchar(100),
	DateOfBirth date
)

--many to many between user and pages (add like attribute)

CREATE TABLE Category(
	CategoryId INT PRIMARY KEY IDENTITY(1,1),
	CategoryName varchar(100),
	CategoryDescr varchar(100)
)

CREATE TABLE Page(
	PageId INT PRIMARY KEY IDENTITY(1,1),
	PageName varchar(100),
	CategoryId INT FOREIGN KEY REFERENCES Category(CategoryId)
		ON DELETE CASCADE
)

CREATE TABLE Likes(
	LikeDate date,
	PageId INT FOREIGN KEY REFERENCES Page(PageId)
		ON DELETE CASCADE,
	UserId INT FOREIGN KEY REFERENCES Users(UserId)
		ON DELETE CASCADE,
	CONSTRAINT LikePK PRIMARY KEY(PageId, UserId)
)

CREATE TABLE Posts(
	PostId INT PRIMARY KEY IDENTITY(1,1),
	PostDate date,
	PostText text,
	NrShares int,
	UserId INT FOREIGN KEY REFERENCES Users(UserId)
		ON DELETE CASCADE
)

CREATE TABLE Comments(
	CommentId INT PRIMARY KEY IDENTITY(1,1),
	CommentText varchar(100),
	CommentDate DATE,
	TopComment BIT,
	PostId INT FOREIGN KEY REFERENCES Posts(PostId)
)

INSERT INTO Users VALUES('User1', 'City1', '2002-01-19');
SELECT * FROM Posts