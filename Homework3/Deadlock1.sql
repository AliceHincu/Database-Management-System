INSERT INTO BOOKS VALUES (20, 'titlu', 'Romanian')
INSERT INTO Authors VALUES (6, 'Petre Ispirescu')
DELETE FROM Books WHERE id=20
DELETE FROM Books WHERE id=6
SELECT * FROM Books

-- transaction 1
begin tran
update Books set title='La cirese transaction 1' where id=20
-- this transaction has exclusively lock on table Books
waitfor delay '00:00:10'
update Authors set name='Petre Ispirescu transaction 1' where id=6
-- this transaction will be blocked because transaction 2 has already blocked our lock on table Authors
commit tran