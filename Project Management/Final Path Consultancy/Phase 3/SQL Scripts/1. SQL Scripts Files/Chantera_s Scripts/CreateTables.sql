--create tables
Use [Klaus Loyalty Program];


DROP TABLE IF EXISTS [Flight];
Go

DROP TABLE IF EXISTS [Item];
Go

DROP TABLE IF EXISTS [Roles];
Go

DROP TABLE IF EXISTS [Login];
Go

DROP TABLE IF EXISTS [Gift];
Go

DROP TABLE IF EXISTS [Gift_Set_Item];
Go

--Table:Products
DROP TABLE IF EXISTS [Products]
CREATE TABLE [Products] (
	[Product_ID] int NOT NULL,
	[Brewery_ID] int NOT NULL,
	[Product_Description] varchar(256),
	[Product_Price] smallmoney,
	[Is_Deleted] bit
);
Go

--Misc_Item
DROP TABLE IF EXISTS [Misc_Item]
CREATE TABLE [Misc_Item] (
	[MiscItem_ID] int IDENTITY(1,1) NOT NULL,
	[Product_ID] int NOT NULL,
	[ItemType_ID] int NOT NULL,
	[Item_Name] varchar(128)
);
Go

--Item_Type
DROP TABLE IF EXISTS [Item_Type]
CREATE TABLE [Item_Type] (
	[ItemType_ID] int IDENTITY(1,1) NOT NULL,
	[Item_Type] varchar(128) NOT NULL
);
Go

--Table Coupon
DROP TABLE IF EXISTS [Coupon]
CREATE TABLE [Coupon] (
	[Coupon_Code] varchar(50) NOT NULL,
	[Coupon_Value] float NOT NULL,
	[Coupon_Unit] varchar(50) NOT NULL,
	[Groupon] bit,
	[Issue_Date] date,
	[Expiration_Date] date,
	[Description] varchar(255),
	[IsDeleted] bit NOT NULL DEFAULT 0
);
Go

--Table Employee User
DROP TABLE IF EXISTS [Employee_User]
CREATE TABLE [Employee_User] (
	[EmployeeUser_ID] int IDENTITY(1,1) NOT NULL,
	[Employee_ID] int,
	[User_ID] int,
	[Is_Deleted] bit NOT NULL DEFAULT 0
);
Go

--Table Role
DROP TABLE IF EXISTS [Role]
CREATE TABLE [Role] (
	[Role_ID] int IDENTITY (0001,1) NOT NULL,
	[Role_Name] varchar(128) NOT NULL,
	[Role_Description] varchar(256) NOT NULL
);
Go

--Table Permission
DROP TABLE IF EXISTS [Permission]
CREATE TABLE [Permission] (
	[Permission_ID] int IDENTITY(1,1) NOT NULL,
	[Role_ID] int NOT NULL, 
	[Permission_Name] varchar(128) NOT NULL
);
Go

Use [Klaus Loyalty Program]
--Table User
DROP TABLE IF EXISTS [User]
CREATE TABLE [User] (
	[User_ID] int IDENTITY(0001,1) NOT NULL,
	[Role_ID] int NOT NULL,
	[Username] varchar(50) NOT NULL,
	[Password] varchar(50) NOT NULL,
	[Created] datetime, 
	[Modified] datetime,
);
Go

--Table Customer User
DROP TABLE IF EXISTS [Customer_User]
CREATE TABLE [Customer_User] (
	[CustomerUser_ID] int IDENTITY(1000,1) NOT NULL,
	[Customer_ID] int,
	[User_ID] int,
	[CustomerProfile_ID] int
);