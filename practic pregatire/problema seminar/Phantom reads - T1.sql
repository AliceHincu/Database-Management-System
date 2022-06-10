-- The phantom read problem occurs when a transaction reads a variable once but when it tries to read that same 
-- variable again, an error occurs saying that the variable does not exist.

-- T1: delay + insert + commit, 
-- T2: select + delay + select

--DELETE FROM Category

BEGIN TRAN
	WAITFOR DELAY '00:00:06'
	INSERT INTO Category(CategoryName, CategoryDescr) VALUES ('Sports', 'S1'), ('Drama', 'D1'), ('Romance', 'R1')
COMMIT TRAN