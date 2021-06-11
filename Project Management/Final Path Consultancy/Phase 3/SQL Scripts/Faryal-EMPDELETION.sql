--hATCOLOR Soft Delete Trigger

CREATE OR ALTER TRIGGER SoftDelete_HATCO ON [Hat_Color]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Hat_Color]
	SET [IsDeleted] = 1
	WHERE [Hat_ColorID] IN (SELECT [Hat_ColorID] FROM DELETED);
END
GO

--Emp Delete

DELETE FROM [Hat_Color] WHERE [Hat_ColorID] = 6932;

SELECT * FROM [Hat_Color]
