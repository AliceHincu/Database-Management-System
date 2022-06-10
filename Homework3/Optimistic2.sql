--transaction 2
Use dbms
go
SET TRANSACTION ISOLATION LEVEL SNAPSHOT
-- solution ALTER DATABASE DBMS_Lab3 SET ALLOW_SNAPSHOT_ISOLATION OFF
BEGIN TRAN
Select * from Books where id=33
-- Bambi – French – the value from the beginning of the transaction
Waitfor delay '00:00:10'
select * from Books where id=4
-- the value from the beginning of the transaction – Panda-English
Update Books set language='Portugues' where id=33
-- process will block
-- Process will receive Error 3960.
COMMIT TRAN