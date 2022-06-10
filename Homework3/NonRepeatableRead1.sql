-- transaction 1 - start this FIRST
-- A non-repeatable read is one in which data read twice inside the same transaction cannot be guaranteed 
-- to contain the same value.

use dbms
DELETE FROM Books WHERE id = 8 
INSERT INTO Books(id,title, language) VALUES (8,'Subdom','Spanish')
SELECT * FROM Books

BEGIN TRAN
	EXEC addLogConcurrencyIssue 'non-repeatable read - before update'

	WAITFOR DELAY '00:00:05'
	UPDATE Books SET language='English' WHERE id = 8

	EXEC addLogConcurrencyIssue 'non-repeatable read - after update'
COMMIT TRANSELECT * FROM LogConcurrencyIssues