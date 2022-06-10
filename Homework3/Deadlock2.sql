begin tran
update Authors set name='Petre Ispirescu transaction 2' where id=6
-- this transaction has exclusively lock on table Authors
waitfor delay '00:00:10'
update Books set title='La cirese transaction 2' where id=20
-- this transaction will be blocked because transaction 1 has exclusively lock on table Books, so, both of the transactions are blocked
commit tran
-- after some seconds transaction 2 will be chosen as a deadlock victim and terminates with an error
-- in tables Books and Authors will be the values from transaction 1