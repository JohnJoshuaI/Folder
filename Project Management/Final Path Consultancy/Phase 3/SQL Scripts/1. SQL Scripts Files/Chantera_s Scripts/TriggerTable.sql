CREATE OR ALTER TRIGGER SoftDelete_Coupon ON [Coupon]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Coupon]
	SET [IsDeleted] = 1
	WHERE [Coupon_Code] IN (SELECT [Coupon_Code] FROM DELETED);
END
GO

CREATE OR ALTER TRIGGER SoftDelete_EmployeeUser ON [Employee_User]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Employee_User]
	SET [Is_Deleted] = 1
	WHERE [EmployeeUser_ID] IN (SELECT [EmployeeUser_ID] FROM DELETED);
END
GO


