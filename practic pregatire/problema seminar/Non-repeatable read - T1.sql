-- TRANZACTION 1 - start this FIRST
-- create a scenario that reproduces the non-repeatable reads concurrency issue

-- non-repeatable read -> OCCUR IN READ UNCOMMITTED and READ COMMITTED isolation levels
-- T1: select - delay - select
-- T2: delay - update - commit

-- A non-repeatable read is one in which data read twice inside the same transaction cannot be guaranteed 
-- to contain the same value.
-- non-repeatable read -> OCCUR IN READ UNCOMMITTED and READ COMMITTED isolation levels

use MiniFacebook
INSERT INTO Category(CategoryName, CategoryDescr) VALUES ('Sports', 'S1'), ('Drama', 'D1'), ('Romance', 'R1')

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
-- SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRAN
	SELECT * FROM Category
	WAITFOR DELAY '00:00:15'
	SELECT * FROM Category
COMMIT TRAN

-- Solution: SET TRANSACTION ISOLATION LEVEL REPEATABLE READ