use MiniFacebook
go

BEGIN TRAN
	WAITFOR DELAY '00:00:10'
	UPDATE Category SET CategoryDescr = 'R'
		WHERE CategoryId = 1
COMMIT TRAN