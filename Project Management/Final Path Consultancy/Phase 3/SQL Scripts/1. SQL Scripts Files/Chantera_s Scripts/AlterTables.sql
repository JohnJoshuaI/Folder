--foreign keys
Use [Klaus Loyalty Program]

--Reference: Klaus Brewing Location -> Products
ALTER TABLE [Products] Add Constraint [FK_Products]
	FOREIGN KEY ([Brewery_ID])
	REFERENCES [Klaus_Brewing_Locaton] ([Brewery_ID]);
Go

--Reference: Products  -> Misc Item
--Reference: Item Type -> Misc Item
ALTER TABLE [Misc_Item] Add Constraint [FK_Misc_Item]
	FOREIGN KEY ([Product_ID])
	REFERENCES [Products] ([Product_ID]),
	Constraint [FK_Misc_Items2] 
	FOREIGN KEY ([ItemType_ID])
	REFERENCES [Item_Type] ([ItemType_ID]);
Go

--Reference: Employee -> Employee User
--Reference: User -> Employee User
ALTER TABLE [Employee_User] Add Constraint [FK_Employee_User]
	FOREIGN KEY ([Employee_ID])
	REFERENCES [Employee] ([Employee_ID]),
	Constraint [FK_Employee_User2]
	FOREIGN KEY ([User_ID])
	REFERENCES [User] ([User_ID]);
Go

--Reference: Roles -> Users
ALTER TABLE [User] Add Constraint [FK_User]
	FOREIGN KEY ([Role_ID])
	REFERENCES [Role] ([Role_ID]);
Go

--Reference:Roles -> Permission
ALTER TABLE [Permission] Add Constraint [FK_Permission]
	FOREIGN KEY ([Role_ID])
	REFERENCES [Role] ([Role_ID]);
Go

--Reference:Customer Profile -> Customer User
--Reference:User -> Customer User
ALTER TABLE [Customer_User] Add Constraint [FK_Customer_User]
	FOREIGN KEY ([CustomerProfile_ID])
	REFERENCES [Customer_Profile] ([CustomerProfile_ID]),
	Constraint [FK_Customer_User2]
	FOREIGN KEY ([User_ID])
	REFERENCES [User] ([User_ID]);
