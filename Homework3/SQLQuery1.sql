-- GRADE 3;
-- create a stored procedure that inserts data in tables that are in a m:n relationship; 
-- if one insert fails, all the operations performed by the procedure must be rolled back

CREATE DATABASE dbms;
use dbms;

CREATE TABLE Books (
    id int,
    title varchar(255),
    language varchar(255)
	PRIMARY KEY (id),
);

CREATE TABLE Authors (
    id int,
    name varchar(255),
	PRIMARY KEY (id)
);

CREATE TABLE BooksAuthors (
    author_id int,
    book_id int,
	PRIMARY KEY (author_id, book_id),
	FOREIGN KEY (author_id) REFERENCES Authors(id),
	FOREIGN KEY (book_id) REFERENCES Books(id)
);
GO

CREATE TABLE LogTable (
	info varchar(100),
	error varchar(1000),
	logTime DATETIME
)
GO

CREATE OR ALTER PROCEDURE addLog (@info VARCHAR(100), @error VARCHAR(100)) AS
	INSERT INTO LogTable VALUES (@info, @error, GETDATE())
GO


CREATE OR ALTER PROCEDURE AddAuthor(@AuthorName varchar(255))
AS
	DECLARE @maxId INT
	-- coalesce = Return the first non-null value in a list
	SET @maxId = (SELECT COALESCE(MAX(A.id), 0) + 1 FROM Authors A)

	IF (@AuthorName is null)
	BEGIN
		RAISERROR('Author name must not be null', 16, 1);
	END

	INSERT INTO Authors(id, name) VALUES (@maxId, @AuthorName)
GO


CREATE OR ALTER PROCEDURE AddBook(@Title varchar(255), @Language varchar(255))
AS
	DECLARE @maxId INT
	-- coalesce = Return the first non-null value in a list
	SET @maxId = (SELECT COALESCE(MAX(B.id), 0) + 1 FROM Books B)

	IF (@Title is null)
	BEGIN
		RAISERROR('Title of book must not be null', 16, 1);
	END

	IF @Language NOT IN ('English','Romanian','French')
	BEGIN
		RAISERROR('Language of book must be either english, romanian or french', 16, 1);
	END

	INSERT INTO Books(id, title, language) VALUES (@maxId, @Title, @Language)
GO


CREATE OR ALTER PROCEDURE AddBooksAuthors(@AuthorName varchar(255) , @BookTitle varchar(255))
AS
	DECLARE @authorId INT
	SET @authorId = (SELECT A.id FROM Authors A WHERE A.name = @AuthorName)
	DECLARE @bookId INT
	SET @bookId = (SELECT B.id FROM Books B WHERE B.title = @BookTitle)

	IF (@authorId is null)
	BEGIN
		RAISERROR('Author does not exist', 16, 1);
	END
	IF (@bookId is null)
	BEGIN
		RAISERROR('Book does not exist', 16, 1);
	END

	INSERT INTO BooksAuthors(author_id, book_id) VALUES (@authorId, @bookId);
GO

-- here we have the rollback
CREATE OR ALTER PROCEDURE addRollbackScenario
AS
	BEGIN TRAN
	BEGIN TRY
		-- incorrect example
		/*EXEC AddAuthor 'Shakespeare'
		EXEC AddBook 'Ham', 'English'
		EXEC AddBooksAuthors 'Shakespeare','Hamlet'*/

		-- good example
		EXEC AddAuthor 'Shakespeare'
		EXEC AddBook 'Hamlet', 'English'
		EXEC AddBooksAuthors 'Shakespeare','Hamlet'
	END TRY
	BEGIN CATCH
		EXEC addLog 'Transaction rollback', 'something went wrong'
		ROLLBACK TRAN
		RETURN
	END CATCH
	COMMIT TRAN
GO

EXEC addRollbackScenario
GO
SELECT * FROM LogTable
GO

SELECT * FROM Authors
SELECT * FROM Books
SELECT * FROM BooksAuthors

DELETE Authors 
DELETE Books 
DELETE BooksAuthors 
GO


-- GRADE 5
-- create a stored procedure that inserts data in tables that are in a m:n relationship; 
-- if an insert fails, try to recover as much as possible from the entire operation: 
-- for example, if the user wants to add a book and its authors, succeeds creating the authors, 
-- but fails with the book, the authors should remain in the database

CREATE OR ALTER PROCEDURE addRecoverPossible (@AuthorName VARCHAR(50), @Title VARCHAR(255), @Language varchar(255))
AS
	BEGIN TRAN

	DECLARE @error VARCHAR(100)

	BEGIN TRY
		EXEC AddAuthor @AuthorName
		EXEC addLog 'Author Added', '-'
	END TRY
	BEGIN CATCH
		SELECT @error = ERROR_MESSAGE()
		EXEC addLog 'Author not added', @error
		COMMIT TRAN
		RETURN
	END CATCH

	BEGIN TRY
		EXEC AddBook @Title, @Language
		EXEC addLog 'Title Added', ''
	END TRY
	BEGIN CATCH
		SELECT @error = ERROR_MESSAGE()
		EXEC addLog 'Title not added', @error
		COMMIT TRAN
		RETURN
	END CATCH

	BEGIN TRY
		EXEC AddBooksAuthors @AuthorName, @Title
		EXEC addLog 'AuthorBook Added', ''
	END TRY
	BEGIN CATCH
		SELECT @error = ERROR_MESSAGE()
		EXEC addLog 'AuthorBook not added', @error
		COMMIT TRAN
		RETURN
	END CATCH
	EXEC addLog 'Everything was added', ''

	COMMIT TRAN
GO


EXEC addRecoverPossible 'Dan Brown', 'Inferno', 'English'
EXEC addRecoverPossible 'Dan Brown', null, null
EXEC addRecoverPossible null, 'Codul lui daVinci', 'English'

SELECT * FROM Authors
SELECT * FROM Books
SELECT * FROM BooksAuthors

DELETE Authors 
DELETE Books 
DELETE BooksAuthors 
GO

SELECT * FROM LogTable