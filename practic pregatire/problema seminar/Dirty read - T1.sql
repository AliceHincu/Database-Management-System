--A dirty read occurs when a transaction reads data that has not yet been committed.

-- T1: 1 update + delay + rollback 
-- T2: select + delay + select -> we see the
-- update in the first select (T1 – finish first), even if it is rollback then
-- Isolation level: Read Uncommitted / Read Committed (solution)

SELECT * FROM Category

BEGIN TRANSACTION
	UPDATE Category SET CategoryName='Updated' WHERE CategoryId = 1
	WAITFOR DELAY '00:00:10'
ROLLBACK TRANSACTION