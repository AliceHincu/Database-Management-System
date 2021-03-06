use dbms
--Dirty Reads: transaction 1 start this one FIRST
--A dirty read occurs when a transaction reads data that has not yet been committed.
SELECT * FROM Books 
-- make sure to have this in table
INSERT INTO Books VALUES(7, 'DirtyRead', 'English')
DELETE FROM Books WHERE id = 7
GO


-- select everything from here until the delete
DECLARE @tempTable TABLE (
	currentTime DATETIME,
	info VARCHAR(100),
	resource_type VARCHAR(100),
	request_mode  VARCHAR(100), 
	request_type  VARCHAR(100), 
	request_status  VARCHAR(100),
	request_session_id INT 
)

BEGIN TRANSACTION

	INSERT INTO @tempTable(currentTime, info, resource_type, request_mode, request_type, request_status, request_session_id)
	SELECT GETDATE(), 'dirty read - before update', resource_type, request_mode, request_type, request_status, request_session_id 
	FROM sys.dm_tran_locks
	WHERE request_owner_type='TRANSACTION'

	UPDATE Books SET language='Romanian'
	WHERE id = 7

	INSERT INTO @tempTable(currentTime, info, resource_type, request_mode, request_type, request_status, request_session_id)
	SELECT GETDATE(), 'dirty read - after update', resource_type, request_mode, request_type, request_status, request_session_id 
	FROM sys.dm_tran_locks
	WHERE request_owner_type='TRANSACTION'

	WAITFOR DELAY '00:00:10'
ROLLBACK TRANSACTION

SELECT * FROM @tempTable INSERT INTO LogConcurrencyIssues
SELECT * FROM LogConcurrencyIssues

-- until here
DELETE LogConcurrencyIssues