--Reference: Klaus Brewing Location -> Food Truck Sales PK
ALTER TABLE [Food_Truck_Sales] Add Constraint [FK_Food_Truck_Sales]
	FOREIGN KEY ([Brewery_ID])
	REFERENCES [Klaus_Brewing_Location] ([Brewery_ID]);
Go

--Reference: Customer Profile -> Redemption History
--Reference: Rewards -> Redemption History
ALTER TABLE [Redemption_History] Add Constraint [FK_Redemption_History] 
	FOREIGN KEY ([CustomerProfile_ID])
	REFERENCES [Customer_Profile] ([CustomerProfile_ID]),
	Constraint [FK_Redemption_History2]
	FOREIGN KEY ([Reward_ID])
	REFERENCES [Rewards] ([Reward_ID]);
