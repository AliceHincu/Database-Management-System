SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
-- SOLUTION -> set to commited
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	SELECT * FROM Category
	WAITFOR DELAY '00:00:15'
	SELECT * FROM Category
COMMIT TRAN