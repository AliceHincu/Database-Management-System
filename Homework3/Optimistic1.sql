ALTER DATABASE dbms SET ALLOW_SNAPSHOT_ISOLATION ON

SELECT * FROM Books
INSERT INTO Books VALUES(33, 'vd', 'Israel')
DELETE FROM Books WHERE id=33

waitfor delay '00:00:10'
BEGIN TRAN
UPDATE Books SET language = 'Israel' WHERE id=33;
-- language is now Israel
waitfor delay '00:00:10'
COMMIT TRAN