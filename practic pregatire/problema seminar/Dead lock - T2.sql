SET DEADLOCK_PRIORITY HIGH
--SET DEADLOCK_PRIORITY HIGH

begin tran
update Users set UserName='User2' where UserId=2
-- this transaction has exclusively lock on table Category
waitfor delay '00:00:10'
update Category set CategoryName='Name2' where CategoryId=13
-- this transaction will be blocked because transaction 2 has already blocked our lock on table Authors
commit tran