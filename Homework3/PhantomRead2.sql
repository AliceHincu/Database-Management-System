-- Serializable (solution)
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN

EXEC addLogConcurrencyIssue 'phantom read - before select'
SELECT * FROM Books

EXEC addLogConcurrencyIssue ' phantom read - between select'

WAITFOR DELAY '00:00:07'
SELECT * FROM Books

EXEC addLogConcurrencyIssue 'phantom read - after select'
COMMIT TRAN