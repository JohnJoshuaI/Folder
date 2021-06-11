--Customer Profile PK
ALTER TABLE [Customer_Profile] Add
Constraint [PK_Customer_Profile] PRIMARY KEY ([CustomerProfile_ID]);
Go

--Food Truck Sales PK
ALTER TABLE [Food_Truck_Sales] Add
Constraint [PK_Food_Truck_Sales] PRIMARY KEY ([FoodTruck_Date], [Brewery_ID]);
Go

--Redemption History PK
ALTER TABLE [Redemption_History] Add
Constraint [PK_Redemption_History] PRIMARY KEY ([Redemption_ID]);
Go

--Rewards PK
ALTER TABLE [Rewards] Add
Constraint [PK_Rewards] PRIMARY KEY ([Reward_ID]);