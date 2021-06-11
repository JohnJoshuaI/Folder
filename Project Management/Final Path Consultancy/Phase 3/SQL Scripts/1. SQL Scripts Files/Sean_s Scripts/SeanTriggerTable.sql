CREATE OR ALTER TRIGGER SoftDelete_FoodTruckSales ON [Food_Truck_Sales]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Food_Truck_Sales]
	SET [Is_Deleted] = 1
	WHERE [FoodTruck_Date] IN (SELECT [FoodTruck_Date] FROM DELETED);
END
GO

CREATE OR ALTER TRIGGER SoftDelete_Rewards ON [Rewards]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Rewards]
	SET [Is_Deleted] = 1
	WHERE [Reward_ID] IN (SELECT [Reward_ID] FROM DELETED);
END
