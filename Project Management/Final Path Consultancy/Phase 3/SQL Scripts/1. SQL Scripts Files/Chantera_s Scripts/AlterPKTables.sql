--primary keys
Use [Klaus Loyalty Program]

--Products PK
ALTER TABLE [Products] Add
Constraint [PK_Products] PRIMARY KEY ([Product_ID]);

--Misc Items PK
ALTER TABLE [Misc_Item] Add 
Constraint [PK_Misc_Item] PRIMARY KEY ([MiscItem_ID]);

--Item_Type
ALTER TABLE [Item_Type] Add
Constraint [PK_Item_Type] PRIMARY KEY ([ItemType_ID]);

--Coupon PK
ALTER TABLE [Coupon] Add
Constraint [PK_Coupon] PRIMARY KEY ([Coupon_Code]);

--Employee User PK
ALTER TABLE [Employee_User] Add
Constraint [PK_Employee_User] PRIMARY KEY ([EmployeeUser_ID]);

--Roles PK
ALTER TABLE [Role] Add
Constraint [PK_Role] PRIMARY KEY ([Role_ID]);

--Permission PK
ALTER TABLE [Permission] Add
Constraint [PK_Permission] PRIMARY KEY ([Permission_ID]);

--User PK
ALTER TABLE [User] Add
Constraint [PK_User] PRIMARY KEY ([User_ID]);

--Customer User PK
ALTER TABLE [Customer_User] Add
Constraint [PK_Customer_User] PRIMARY KEY ([CustomerUser_ID]);

