-- T1: update on table A + delay + update on table B
-- T2: update on table B + delay + update on table A

SET DEADLOCK_PRIORITY NORMAL
begin tran
update Category set CategoryName='Name1' where CategoryId=13
-- this transaction has exclusively lock on table Category
waitfor delay '00:00:10'
update Users set UserName='User1' where UserId=2
-- this transaction will be blocked because transaction 2 has already blocked our lock on table Authors
commit tran