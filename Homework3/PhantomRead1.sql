-- The phantom read problem occurs when a transaction reads a variable once but when it tries to read that same 
-- variable again, an error occurs saying that the variable does not exist.

-- transaction 1
--Phantom Reads Part 1

-- make sure to not have id = 10
DELETE FROM Books WHERE id = 10
SELECT * FROM Books


BEGIN TRAN

EXEC addLogConcurrencyIssue 'phantom read - before insert'

WAITFOR DELAY '00:00:06'
INSERT INTO Books(id,title,language) VALUES(10,'Morometii','Romanian')

EXEC addLogConcurrencyIssue 'phantom read - after insert'

COMMIT TRAN