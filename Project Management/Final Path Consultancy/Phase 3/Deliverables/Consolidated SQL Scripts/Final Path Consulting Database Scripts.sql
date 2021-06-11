Use [Klaus Loyalty Program]

--Foreign Key Drop Scripts

--***Adekunle's FK Drops***--
ALTER TABLE [Beer]
DROP CONSTRAINT IF EXISTS [FK_Beer];
ALTER TABLE [Beer]
DROP CONSTRAINT IF EXISTS [FK_Beer2];
ALTER TABLE [Beer]
DROP CONSTRAINT IF EXISTS [FK_Beer3];
ALTER TABLE [Beer]
DROP CONSTRAINT IF EXISTS [FK_Beer4];
ALTER TABLE [Merchandise]
DROP CONSTRAINT IF EXISTS [FK_Merchandise];
ALTER TABLE [Merchandise]
DROP CONSTRAINT IF EXISTS [FK_Merchandise2];
ALTER TABLE [Glassware]
DROP CONSTRAINT IF EXISTS [FK_Glassware];

--***Chantera's FK Drops***--
ALTER TABLE [Product]
DROP CONSTRAINT IF EXISTS [FK_Product];
ALTER TABLE [Misc_Item] 
DROP CONSTRAINT IF EXISTS [FK_Misc_Item];
ALTER TABLE [Misc_Item]
DROP CONSTRAINT IF EXISTS [FK_Misc_Item2];
ALTER TABLE [Employee_User]
DROP CONSTRAINT IF EXISTS [FK_Employee_User];
ALTER TABLE [Employee_User]
DROP CONSTRAINT IF EXISTS [FK_Employee_User2];
ALTER TABLE [User]
DROP CONSTRAINT IF EXISTS [FK_User];
ALTER TABLE [Permission]
DROP CONSTRAINT IF EXISTS [FK_Permission];
ALTER TABLE [Customer_User]
DROP CONSTRAINT IF EXISTS [FK_Customer_User];
ALTER TABLE [Customer_User]
DROP CONSTRAINT IF EXISTS [FK_Customer_User2];
ALTER TABLE [Customer_User]
DROP CONSTRAINT IF EXISTS [FK_Customer_User3];
ALTER TABLE [User_Revision]
DROP CONSTRAINT IF EXISTS [FK_User_Revision];
ALTER TABLE [User_Revision]
DROP CONSTRAINT IF EXISTS [FK_User_Revision2];
ALTER TABLE [Department_Title]
DROP CONSTRAINT IF EXISTS [FK_Department_Title];

--***Faryal's FK Drops***--
ALTER TABLE [Employee_Title]
DROP CONSTRAINT IF EXISTS [FK_Employee_Title];
ALTER TABLE [Employee_Title]
DROP CONSTRAINT IF EXISTS [FK_Employee_Title2];
ALTER TABLE [Employee_Information]
DROP CONSTRAINT IF EXISTS [FK_Employee_Information];
ALTER TABLE [Employee_Information]
DROP CONSTRAINT IF EXISTS [FK_Employee_Information2];
ALTER TABLE [Employee_Information]
DROP CONSTRAINT IF EXISTS [FK_Employee_Information3];
ALTER TABLE [Employee_Information]
DROP CONSTRAINT IF EXISTS [FK_Employee_Information4];
ALTER TABLE [Hat]
DROP CONSTRAINT IF EXISTS [FK_Hat];
ALTER TABLE [Hat]
DROP CONSTRAINT IF EXISTS [FK_Hat2];
ALTER TABLE [Employee_Location]
DROP CONSTRAINT IF EXISTS [FK_Employee_Location];
ALTER TABLE [Employee_Location]
DROP CONSTRAINT IF EXISTS [FK_Employee_Location2];

--***John's FK Drops***--
ALTER TABLE [City]
DROP CONSTRAINT IF EXISTS [FK_City];
ALTER TABLE [State]
DROP CONSTRAINT IF EXISTS [FK_State];
ALTER TABLE [Zip_Code]
DROP CONSTRAINT IF EXISTS [FK_Zip_Code];
ALTER TABLE [Klaus_Brewing_Location]
DROP CONSTRAINT IF EXISTS [FK_Klaus_Brewing_Location];
ALTER TABLE [Klaus_Brewing_Location]
DROP CONSTRAINT IF EXISTS [FK_Klaus_Brewing_Location2];
ALTER TABLE [Klaus_Brewing_Location]
DROP CONSTRAINT IF EXISTS [FK_Klaus_Brewing_Location3];
ALTER TABLE [Klaus_Brewing_Location]
DROP CONSTRAINT IF EXISTS [FK_Klaus_Brewing_Location4];

--***Pratik's FK Drops***--
ALTER TABLE [Order_Detail]
DROP CONSTRAINT IF EXISTS [FK_Order_Detail];
ALTER TABLE [Order_Detail]
DROP CONSTRAINT IF EXISTS [FK_Order_Detail2];
ALTER TABLE [Order]
DROP CONSTRAINT IF EXISTS [FK_Order];
ALTER TABLE [Order]
DROP CONSTRAINT IF EXISTS [FK_Order2];
ALTER TABLE [Order]
DROP CONSTRAINT IF EXISTS [FK_Order3];
ALTER TABLE [Customer_Information]
DROP CONSTRAINT IF EXISTS [FK_Customer_Information];
ALTER TABLE [Customer_Information]
DROP CONSTRAINT IF EXISTS [FK_Customer_Information2];
ALTER TABLE [Customer_Information]
DROP CONSTRAINT IF EXISTS [FK_Customer_Information3];
ALTER TABLE [Customer_Information]
DROP CONSTRAINT IF EXISTS [FK_Customer_Information4];

--***Sean's FK Drops***---
ALTER TABLE [Food_Truck_Sales]
DROP CONSTRAINT IF EXISTS [FK_Food_Truck_Sales];
ALTER TABLE [Redemption_History]
DROP CONSTRAINT IF EXISTS [FK_Redemption_History];
ALTER TABLE [Redemption_History]
DROP CONSTRAINT IF EXISTS [FK_Redemption_History2];

--***Sem's FK Drops***---
ALTER TABLE [TShirt]
DROP CONSTRAINT IF EXISTS [FK_TShirt];
ALTER TABLE [TShirt]
DROP CONSTRAINT IF EXISTS [FK_TShirt2];
ALTER TABLE [TShirt_Type]
DROP CONSTRAINT IF EXISTS [FK_TShirt_Type];

--Create Table Scripts
--***Adekunle's Create Tables***--

--Table: Beer
DROP TABLE IF EXISTS [Beer]
CREATE TABLE [Beer] (
	[Beer_ID] int IDENTITY (1,1) NOT NULL,
	[Product_ID] int UNIQUE NOT NULL,
	[Beer_Name] varchar(128) NOT NULL,
	[BeerType_ID] int NOT NULL,
	[BeerContainerSize_ID] int NOT NULL
)
Go

--Table: Beer Type
DROP TABLE IF EXISTS [Beer_Type]
CREATE TABLE [Beer_Type] (
	[BeerType_ID] int IDENTITY (20,1) NOT NULL,
	[Beer_Type] varchar(128) UNIQUE NOT NULL
)
Go

--Table: Beer Container Size
DROP TABLE IF EXISTS [Beer_Container_Size]
CREATE TABLE [Beer_Container_Size] (
	[BeerContainerSize_ID] int IDENTITY (1,1) NOT NULL,
	[Container_Name] varchar(50) NOT NULL,
	[Size] varchar(30) NOT NULL
)
Go

--Table: Beer List
DROP TABLE IF EXISTS [Beer_List]
CREATE TABLE [Beer_List] (
	[Beer_Name] varchar(128) NOT NULL,
	[ABV] decimal(5,1),
	CONSTRAINT CK_Beer_List_ABV CHECK (ABV >0 and ABV<=100),
	[IBU] decimal(5,1)
)
Go

--Table: Merchandise
DROP TABLE IF EXISTS [Merchandise]
CREATE TABLE [Merchandise] (
	[Merchandise_ID] int IDENTITY (2000,1) NOT NULL,
	[Product_ID] int UNIQUE NOT NULL,
	[MerchandiseType_ID] int NOT NULL
);
Go

--Table: Merchandise Type
DROP TABLE IF EXISTS [Merchandise_Type]
CREATE TABLE [Merchandise_Type] (
	[MerchandiseType_ID] int IDENTITY (1,1) NOT NULL,
	[Merchandise_Type] varchar(128) NOT NULL,
	
);
Go

--Table: Glassware
DROP TABLE IF EXISTS [Glassware]
CREATE TABLE [Glassware] (
	[Glassware_ID] int IDENTITY (1,1) NOT NULL,
	[Merchandise_ID] int NOT NULL,
	[Glassware_Description] varchar (128)
);

--***Chantera's Create Tables***--

--Table: Product
DROP TABLE IF EXISTS [Product]
CREATE TABLE [Product] (
	[Product_ID] int NOT NULL,
	[Brewery_ID] int NOT NULL,
	[Product_Description] varchar(255),
	[Product_Price] smallmoney
);
Go

--Table: Misc_Item
DROP TABLE IF EXISTS [Misc_Item]
CREATE TABLE [Misc_Item] (
	[MiscItem_ID] int IDENTITY(1,1) NOT NULL,
	[Product_ID] int UNIQUE NOT NULL,
	[ItemType_ID] int NOT NULL,
	[Item_Name] varchar(128)
);
Go

--Table: Item_Type
DROP TABLE IF EXISTS [Item_Type]
CREATE TABLE [Item_Type] (
	[ItemType_ID] int IDENTITY(1,1) NOT NULL,
	[Item_Type] varchar(128) NOT NULL
);
Go

--Table: Coupon
DROP TABLE IF EXISTS [Coupon]
CREATE TABLE [Coupon] (
	[Coupon_Code] varchar(50) NOT NULL,
	[Coupon_Value] float NOT NULL,
	[Coupon_Unit] varchar(50) NOT NULL,
	[Groupon] bit,
	[Issue_Date] date,
	[Expiration_Date] date,
	[Description] varchar(255),
	[IsDeleted] bit DEFAULT 0 NOT NULL
);
Go

--Table: Employee User
DROP TABLE IF EXISTS [Employee_User]
CREATE TABLE [Employee_User] (
	[EmployeeUser_ID] int IDENTITY(1,1) NOT NULL,
	[EmployeeTitle_ID] int NOT NULL,
	[User_ID] int NOT NULL
);
Go

--Table: Role
DROP TABLE IF EXISTS [Role]
CREATE TABLE [Role] (
	[Role_ID] int IDENTITY (1,1) NOT NULL,
	[Role_Name] varchar(128) UNIQUE NOT NULL,
	[Role_Description] varchar(255)
);
Go

--Table: Permission
DROP TABLE IF EXISTS [Permission]
CREATE TABLE [Permission] (
	[Permission_ID] int IDENTITY(1,1) NOT NULL,
	[Role_ID] int NOT NULL, 
	[Permission_Name] varchar(128) NOT NULL
);
Go

--Table: User
DROP TABLE IF EXISTS [User]
CREATE TABLE [User] (
	[User_ID] int IDENTITY(1000,1) NOT NULL,
	[Role_ID] int NOT NULL,
	[Username] varchar(50) NOT NULL,
	[Password] varchar(50) NOT NULL,
	[Created] datetime
);
Go

--Table: Customer User
DROP TABLE IF EXISTS [Customer_User]
CREATE TABLE [Customer_User] (
	[CustomerUser_ID] int IDENTITY (1,1) NOT NULL,
	[Customer_ID] int NOT NULL,
	[User_ID] int NOT NULL,
	[CustomerProfile_ID] int NOT NULL
);
Go

--Table: User Revision
DROP TABLE IF EXISTS [User_Revision]
CREATE TABLE [User_Revision] (
	[UserRevision_ID] int IDENTITY (1,1) NOT NULL,
	[Revision_ID] int NOT NULL,
	[User_ID] int NOT NULL,
	[Date] timestamp NOT NULL
);
Go

--Table: Revision
DROP TABLE IF EXISTS [Revision]
CREATE TABLE [Revision] (
	[Revision_ID] int IDENTITY (1,1) NOT NULL,
	[Revision_Name] varchar(128) NOT NULL,
	[Revision_Description] varchar(255)
);
Go

--Table: Department_Title
DROP TABLE IF EXISTS [Department_Title]
CREATE TABLE [Department_Title] (
	[DepartmentTitle_ID] int IDENTITY (1,1) NOT NULL,
	[Department_ID] int NOT NULL,
	[Title_Name] varchar(128) NOT NULL,
	[Title_Description] varchar(255)
);
Go

--***Faryal's Create Tables***--

--Table: Employee_Title
DROP TABLE IF EXISTS [Employee_Title]
CREATE TABLE [Employee_Title] (
	[EmployeeTitle_ID] int IDENTITY (1,1) NOT NULL,
	[Employee_ID] int NOT NULL,
	[DepartmentTitle_ID] int NOT NULL,
	[From_Date] Date NOT NULL,
	[To_Date] Date
);
Go

--Table: Department
DROP TABLE IF EXISTS [Department]
CREATE TABLE [Department] (
	[Department_ID] int IDENTITY (1,1) NOT NULL,
	[Department_Name] varchar(128) UNIQUE NOT NULL,
	[Department_Description] varchar(255)
);
Go

--Table: Employee Information
DROP TABLE IF EXISTS [Employee_Information]
CREATE TABLE [Employee_Information] (
	[Employee_ID] int NOT NULL,
	[First_Name] varchar(128) NOT NULL,
	[Middle_Initial] varchar(5),
	[Last_Name] varchar(128) NOT NULL,
	[Last_4_of_SSN] int NOT NULL,
	[DOB] DATE NOT NULL,
	[Employee_Address] varchar(256) NOT NULL,
	[City_ID] int,
	[State_ID] int,
	[ZipCode_ID] int,
	[Country_ID] int NOT NULL,
	[IsActive] bit NOT NULL DEFAULT 1	
);
Go

--Table: Hat
DROP TABLE IF EXISTS [Hat]
CREATE TABLE [Hat] (
	[Hat_ID] int IDENTITY (1,1) NOT NULL,
	[Merchandise_ID] int NOT NULL,
	[HatColor_ID] int NOT NULL,
	[Hat_Description] varchar(128)
);
Go

--Table: Hat Color
DROP TABLE IF EXISTS [Hat_Color]
CREATE TABLE [Hat_Color] (
	[HatColor_ID] int IDENTITY (1,1) NOT NULL,
	[Color] varchar(50) UNIQUE NOT NULL
);
Go

--Table: Employee Location
DROP TABLE IF EXISTS [Employee_Location]
CREATE TABLE [Employee_Location] (
  [EmployeeLocation_ID] int IDENTITY(1,1) NOT NULL,
  [Employee_ID] int NOT NULL,
  [Brewery_ID] int NOT NULL 
);
Go

--***John's Create Tables ***--

--Table: City
DROP TABLE IF EXISTS [City]
CREATE TABLE [City] (
	[City_ID] int IDENTITY (1,1) NOT NULL,
	[State_ID] int,
	[City_Name] varchar(128) NOT NULL	
);
Go

--Table: State
DROP TABLE IF EXISTS [State]
CREATE TABLE [State]
(
	[State_ID] int IDENTITY (1,1) NOT NULL,
	[Country_ID] int NOT NULL,
	[State_Name] varchar(256) NOT NULL,
	[State_Code] varchar(10) NOT NULL
);
Go

--Table: Country
DROP TABLE IF EXISTS [Country]
CREATE TABLE [Country]
(
	[Country_ID] int IDENTITY (1,1) NOT NULL,
	[Country_Name] varchar(128) UNIQUE NOT NULL,
	[Recognized_UN] bit NOT NULL DEFAULT 1
);
Go

--Table: Zip Code
DROP TABLE IF EXISTS [Zip_Code]
CREATE TABLE [Zip_Code]
(
	[ZipCode_ID] int IDENTITY (1,1) NOT NULL,
	[City_ID]	Int NOT NULL,
	[Zip_Code] int NOT NULL
);
Go

--Table: Klaus Brewing Location
DROP TABLE IF EXISTS [Klaus_Brewing_Location]
CREATE TABLE [Klaus_Brewing_Location] (
	[Brewery_ID] int NOT NULL,
	[Brewery_Address] varchar(255) NOT NULL,
	[City_ID] int,
	[State_ID] int,
	[ZipCode_ID] int,
	[Country_ID] int NOT NULL,
	[IsDeleted] bit NOT NULL DEFAULT 0
);
Go

--***Pratik's Create Tables***--

--Table: Order Detail
DROP TABLE IF EXISTS [Order_Detail]
CREATE TABLE [Order_Detail] (
	[OrderDetail_ID] int IDENTITY (1,1) NOT NULL,
	[Order_ID] int NOT NULL,
	[Product_ID] int NOT NULL,
	[Discount] bit DEFAULT 0,
	[Discount_Value] int, 
	[Discount_Type] varchar(50)
);
Go

--Table: Order
DROP TABLE IF EXISTS [Order]
CREATE TABLE [Order] (
	[Order_ID] int NOT NULL,
	[Customer_ID] int,
	[EmployeeTitle_ID] int NOT NULL,
	[Order_Date] date NOT NULL,
	[Is_Member] bit NOT NULL DEFAULT 0,
	[Coupon_Code] varchar(50),
	[Subtotal] int NOT NULL,
	[Total_Price] smallmoney NOT NULL,
	[Payment_Type] varchar(50) NOT NULL,
	[Status] varchar(50) NOT NULL,
	[Loyalty_Points_Earned] int,
	[Total_Points] int
);
Go

--Table: Customer Information
DROP TABLE IF EXISTS [Customer_Information]
Create table [Customer_Information] (
	[Customer_ID] int IDENTITY (1111,1111) NOT NULL,
	[Customer_First] varchar(128) NOT NULL,
	[Customer_Last] varchar(128) NOT NULL,
	[Customer_DOB] date NOT NULL,
	[Customer_Email] varchar(128) NOT NULL,
	[Customer_Phone] varchar(15) NOT NULL,
	[Customer_Address] varchar(128),
	[City_ID] int,
	[State_ID] int,
	[ZipCode_ID] int,
	[Country_ID] int NOT NULL
);
Go

--***Sean's Create Tables***--

--Table: Customer Profile
DROP TABLE IF EXISTS [Customer_Profile]
CREATE TABLE [Customer_Profile] (
	[CustomerProfile_ID] int IDENTITY(1,1) NOT NULL,
	[Total_Orders] int,
	[Amount_Spent] money,
	[Average_Amount] money,
	[Last_Visit] date,
	[Total_Available_Points] int,
	[Lifetime_Points] int,
	[Redeemed_Points] int,
	[Lifetime_Redemptions] int,
	[Last_Redemption] date,
	[Available_Rewards] int
);
Go

--Table: Food Truck Sales
DROP TABLE IF EXISTS [Food_Truck_Sales]
CREATE TABLE [Food_Truck_Sales] (
	[FoodTruck_Date] date NOT NULL,
	[Brewery_ID] int NOT NULL,
	[FoodTruck_Sales] smallmoney NOT NULL
);
Go

--Table: Redemption History
DROP TABLE IF EXISTS [Redemption_History]
CREATE TABLE [Redemption_History] (
	[Redemption_ID] int IDENTITY(1,1) NOT NULL,
	[CustomerProfile_ID] int NOT NULL,
	[Reward_ID] int NOT NULL	
);
Go

--Table: Reward
DROP TABLE IF EXISTS [Reward]
CREATE TABLE [Reward] (
	[Reward_ID] int IDENTITY (1,1) NOT NULL,
	[Reward_Description] varchar(256) NOT NULL,
	[Redemption_Cost] int NOT NULL	
);
Go

--***Sem's Create Tables***--

--Table: TShirt
DROP TABLE IF EXISTS [TShirt]
CREATE TABLE [TShirt] (
	[TShirt_ID] int IDENTITY(1,1) NOT NULL,
	[TShirtType_ID]  int NOT NULL,
	[Merchandise_ID] int NOT NULL	
);
Go

--Table: TShirt Type
DROP TABLE IF EXISTS [TShirt_Type]
CREATE TABLE [TShirt_Type] (
	[TShirtType_ID] int IDENTITY (1,1) NOT NULL,
	[TShirt_Classification] varchar(128) NOT NULL,
	[TShirt_Size] varchar(50) NOT NULL,
	[TShirt_Design] varchar(128) NOT NULL,
	[Color_ID] int NOT NULL	
);
Go

--Table: TShirt Color
DROP TABLE IF EXISTS [TShirt_Color]
CREATE TABLE [TShirt_Color] (
	[Color_ID] int  IDENTITY (1,1) NOT NULL,
	[TShirt_Color] varchar(50) UNIQUE NOT NULL	
);
Go

--Bulk Insert Scripts
--***Adekunle's Bulk Inserts***--

--Bulk Insert: Beer
TRUNCATE TABLE [Beer]
BULK INSERT [Beer]
FROM 'C:\Final Path Consulting\Data\Adekunle\Beer_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Beer]

--Bulk Insert: Beer Type
TRUNCATE TABLE [Beer_Type]
BULK INSERT [Beer_Type]
FROM 'C:\Final Path Consulting\Data\Adekunle\BeerType_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Beer_Type]

--Bulk Insert: Beer Container Size
TRUNCATE TABLE [Beer_Container_Size]
BULK INSERT [Beer_Container_Size]
FROM 'C:\Final Path Consulting\Data\Adekunle\BeerContainerSize_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Beer_Container_Size]

--Bulk Insert: Beer List
TRUNCATE TABLE [Beer_List]
BULK INSERT [Beer_List]
FROM 'C:\Final Path Consulting\Data\Adekunle\BeerList_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Beer_List]

--Bulk Insert: Merchandise
TRUNCATE TABLE [Merchandise]
BULK INSERT [Merchandise]
FROM 'C:\Final Path Consulting\Data\Adekunle\Merchandise_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Merchandise]

--Bulk Insert: Merchandise Type
TRUNCATE TABLE [Merchandise_Type]
BULK INSERT [Merchandise_Type]
FROM 'C:\Final Path Consulting\Data\Adekunle\MerchandiseType_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Merchandise_Type]

--Bulk Insert: Glassware
TRUNCATE TABLE [Glassware]
BULK INSERT [Glassware]
FROM 'C:\Final Path Consulting\Data\Adekunle\Glassware_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Glassware]

--***Chantera's Bulk Inserts***--

--Bulk Insert: Product
TRUNCATE TABLE [Product]
BULK INSERT [Product]
FROM 'C:\Final Path Consulting\Data\Chantera\Product_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Product]

--Bulk Insert: Misc Item
TRUNCATE TABLE [Misc_Item]
BULK INSERT [Misc_Item]
FROM 'C:\Final Path Consulting\Data\Chantera\MiscItems_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Misc_Item]

--Bulk Insert: Item Type 
TRUNCATE TABLE [Item_Type]
BULK INSERT [Item_Type]
FROM 'C:\Final Path Consulting\Data\Chantera\ItemType_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Item_Type]

--Bulk Insert: Coupon
TRUNCATE TABLE [Coupon]
BULK INSERT [Coupon]
FROM 'C:\Final Path Consulting\Data\Chantera\Coupon_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Coupon]

--Bulk Insert: Employee User
TRUNCATE TABLE [Employee_User]
BULK INSERT [Employee_User]
FROM 'C:\Final Path Consulting\Data\Chantera\EmployeeUser_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Employee_User]

--Bulk Insert: Role
TRUNCATE TABLE [Role]
BULK INSERT [Role]
FROM 'C:\Final Path Consulting\Data\Chantera\Role_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Role]

--Bulk Insert: Permission
TRUNCATE TABLE [Permission]
BULK INSERT [Permission]
FROM 'C:\Final Path Consulting\Data\Chantera\Permission_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Permission]

--Bulk Insert: User
TRUNCATE TABLE [User]
BULK INSERT [User]
FROM 'C:\Final Path Consulting\Data\Chantera\User_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [User]

--Bulk Insert: Customer User
TRUNCATE TABLE [Customer_User]
BULK INSERT [Customer_User]
FROM 'C:\Final Path Consulting\Data\Chantera\CustomerUser_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Customer_User]

--Bulk Insert: User Revision
TRUNCATE TABLE [User_Revision]
BULK INSERT [User_Revision]
FROM 'C:\Final Path Consulting\Data\Chantera\UserRevision_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [User_Revision]

--Bulk Insert: Revision
TRUNCATE TABLE [Revision]
BULK INSERT [Revision]
FROM 'C:\Final Path Consulting\Data\Chantera\Revision_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Revision]

--Bulk Insert: Department_Title
TRUNCATE TABLE [Department_Title]
BULK INSERT [Department_Title]
FROM 'C:\Final Path Consulting\Data\Chantera\DepartmentTitle_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Department_Title]

--***Faryal's Bulk Inserts***--

--Bulk Insert: Employee Title
TRUNCATE TABLE [Employee_Title]
BULK INSERT [Employee_Title]
FROM 'C:\Final Path Consulting\Data\Faryal\EmployeeTitle_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Employee_Title]

--Bulk Insert: Department
TRUNCATE TABLE [Department]
BULK INSERT [Department]
FROM 'C:\Final Path Consulting\Data\Faryal\Department_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Department]

--Bulk Insert: Employee Information
TRUNCATE TABLE [Employee_Information]
BULK INSERT [Employee_Information]
FROM 'C:\Final Path Consulting\Data\Faryal\EmployeeInformation_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Employee_Information]

--Bulk Insert: Hat
TRUNCATE TABLE [Hat]
BULK INSERT [Hat]
FROM 'C:\Final Path Consulting\Data\Faryal\Hat_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Hat]

--Bulk Insert: Hat Color
TRUNCATE TABLE [Hat_Color]
BULK INSERT [Hat_Color]
FROM 'C:\Final Path Consulting\Data\Faryal\HatColor_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Hat_Color]

--Bulk Insert: Employee Location
TRUNCATE TABLE [Employee_Location]
BULK INSERT [Employee_Location]
FROM 'C:\Final Path Consulting\Data\Faryal\EmployeeLocation_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Employee_Location]

--***John's Bulk Inserts***--
--Bulk Insert: City
TRUNCATE TABLE [City]
BULK INSERT [City]
FROM 'C:\Final Path Consulting\Data\John\City_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [City]

--Bulk Insert: State
TRUNCATE TABLE [State]
BULK INSERT [State]
FROM 'C:\Final Path Consulting\Data\John\State_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [State]

--Bulk Insert: Country
TRUNCATE TABLE [Country]
BULK INSERT [Country]
FROM 'C:\Final Path Consulting\Data\John\Country_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Country]

--Bulk Insert: Zip Code
TRUNCATE TABLE [Zip_Code]
BULK INSERT [Zip_Code]
FROM 'C:\Final Path Consulting\Data\John\ZipCode_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Zip_Code]

--Bulk Insert: Klaus Brewing Location
TRUNCATE TABLE [Klaus_Brewing_Location]
BULK INSERT [Klaus_Brewing_Location]
FROM 'C:\Final Path Consulting\Data\John\KlausBrewingLocation_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Klaus_Brewing_Location]

--***Pratik's Bulk Inserts***--

--Bulk Insert: Order Detail
TRUNCATE TABLE [Order_Detail]
BULK INSERT [Order_Detail]
FROM 'C:\Final Path Consulting\Data\Pratik\OrderDetail_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Order_Detail]

--Bulk Insert: Order
TRUNCATE TABLE [Order]
BULK INSERT [Order]
FROM 'C:\Final Path Consulting\Data\Pratik\Order_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Order]

--Bulk Insert: Customer Information
TRUNCATE TABLE [Customer_Information]
BULK INSERT [Customer_Information]
FROM 'C:\Final Path Consulting\Data\Pratik\CustomerInformation_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Customer_Information]

--***Sean's Bulk Inserts***--

--Bulk Insert: Customer Profile
TRUNCATE TABLE [Customer_Profile]
BULK INSERT [Customer_Profile]
FROM 'C:\Final Path Consulting\Data\Sean\CustomerProfile_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Customer_Profile]

--Bulk Insert: Food Truck Sales
TRUNCATE TABLE [Food_Truck_Sales]
BULK INSERT [Food_Truck_Sales]
FROM 'C:\Final Path Consulting\Data\Sean\FoodTruckSales_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Food_Truck_Sales]

--Bulk Insert: Redemption History
TRUNCATE TABLE [Redemption_History]
BULK INSERT [Redemption_History]
FROM 'C:\Final Path Consulting\Data\Sean\RedemptionHistory_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Redemption_History]

--Bulk Insert: Reward
TRUNCATE TABLE [Reward]
BULK INSERT [Reward]
FROM 'C:\Final Path Consulting\Data\Sean\Reward_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [Reward]

--***Sem's Bulk Inserts***--

--Bulk Insert: TShirt
TRUNCATE TABLE [TShirt]
BULK INSERT [TShirt]
FROM 'C:\Final Path Consulting\Data\Sem\TShirt_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [TShirt]

--Bulk Insert: TShirt Type
TRUNCATE TABLE [TShirt_Type]
BULK INSERT [TShirt_Type]
FROM 'C:\Final Path Consulting\Data\Sem\TShirtType_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [TShirt_Type]

--Bulk Insert: TShirt Color
TRUNCATE TABLE [TShirt_Color]
BULK INSERT [TShirt_Color]
FROM 'C:\Final Path Consulting\Data\Sem\TShirtColor_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);
Go

SELECT * FROM [TShirt_Color]

--Alter Table Primary Key Scripts
--***Adekunle's PKs***--

--Beer PK
ALTER TABLE [Beer] 
DROP CONSTRAINT IF EXISTS [PK_Beer];

ALTER TABLE [Beer] Add 
Constraint [PK_Beer] PRIMARY KEY ([Beer_ID]);
Go

--Beer Type PK
ALTER TABLE [Beer_Type]
DROP CONSTRAINT IF EXISTS [PK_Beer_Type];

ALTER TABLE [Beer_Type] Add
Constraint [PK_Beer_Type] PRIMARY KEY ([BeerType_ID]);
Go

--Beer Container Size PK
ALTER TABLE [Beer_Container_Size]
DROP CONSTRAINT IF EXISTS [PK_Beer_Container_Size];

ALTER TABLE [Beer_Container_Size] Add
Constraint [PK_Beer_Container_Size] PRIMARY KEY ([BeerContainerSize_ID]);
Go

--Beer List PK
ALTER TABLE [Beer_List]
DROP CONSTRAINT IF EXISTS [PK_Beer_List];

ALTER TABLE [Beer_List] Add
Constraint [PK_Beer_List] PRIMARY KEY ([Beer_Name]);
Go

--Merchandise PK
ALTER TABLE [Merchandise]
DROP CONSTRAINT IF EXISTS [PK_Merchandise];

ALTER TABLE [Merchandise] Add
Constraint [PK_Merchandise] PRIMARY KEY ([Merchandise_ID]);
Go

--Merchandise Type PK
ALTER TABLE [Merchandise_Type]
DROP CONSTRAINT IF EXISTS [PK_Merchandise_Type];

ALTER TABLE [Merchandise_Type] Add
Constraint [PK_Merchandise_Type] PRIMARY KEY ([MerchandiseType_ID]);
Go

--Glassware PK
ALTER TABLE [Glassware]
DROP CONSTRAINT IF EXISTS [PK_Glassware];

ALTER TABLE [Glassware] Add
Constraint [PK_Glassware] PRIMARY KEY ([Glassware_ID]);
Go

--***Chantera's PKs***--

--Products PK
ALTER TABLE [Product]
DROP CONSTRAINT IF EXISTS [PK_Product];

ALTER TABLE [Product] Add 
Constraint [PK_Product] PRIMARY KEY ([Product_ID]);
Go

--Misc Items PK
ALTER TABLE [Misc_Item]
DROP CONSTRAINT IF EXISTS [PK_Misc_Item];

ALTER TABLE [Misc_Item] Add 
Constraint [PK_Misc_Item] PRIMARY KEY ([MiscItem_ID]);
Go

--Item Type PK
ALTER TABLE [Item_Type]
DROP CONSTRAINT IF EXISTS [PK_Item_Type];

ALTER TABLE [Item_Type] Add
Constraint [PK_Item_Type] PRIMARY KEY ([ItemType_ID]);
Go

--Coupon PK
ALTER TABLE [Coupon]
DROP CONSTRAINT IF EXISTS [PK_Coupon]

ALTER TABLE [Coupon] Add
Constraint [PK_Coupon] PRIMARY KEY ([Coupon_Code]);
Go

--Employee User PK
ALTER TABLE [Employee_User]
DROP CONSTRAINT IF EXISTS [PK_Employee_User];

ALTER TABLE [Employee_User] Add
Constraint [PK_Employee_User] PRIMARY KEY ([EmployeeUser_ID]);
Go

--Role PK
ALTER TABLE [Role]
DROP CONSTRAINT IF EXISTS [PK_Role];

ALTER TABLE [Role] Add
Constraint [PK_Role] PRIMARY KEY ([Role_ID]);
Go

--Permission PK
ALTER TABLE [Permission]
DROP CONSTRAINT IF EXISTS [PK_Permission];

ALTER TABLE [Permission] Add
Constraint [PK_Permission] PRIMARY KEY ([Permission_ID]);
Go

--User PK
ALTER TABLE [User]
DROP CONSTRAINT IF EXISTS [PK_User];

ALTER TABLE [User] Add
Constraint [PK_User] PRIMARY KEY ([User_ID]);
Go

--Customer User PK
ALTER TABLE [Customer_User]
DROP CONSTRAINT IF EXISTS [PK_Customer_User];

ALTER TABLE [Customer_User] Add
Constraint [PK_Customer_User] PRIMARY KEY ([CustomerUser_ID]);
Go

--User Revision PK
ALTER TABLE [User_Revision]
DROP CONSTRAINT IF EXISTS [PK_User_Revision];

ALTER TABLE [User_Revision] Add
Constraint [PK_User_Revision] PRIMARY KEY ([UserRevision_ID]);
Go

--Revision PK
ALTER TABLE [Revision]
DROP CONSTRAINT IF EXISTS [PK_Revision];

ALTER TABLE [Revision] Add
Constraint [PK_Revision] PRIMARY KEY ([Revision_ID]);
Go

--Department_Title PK
ALTER TABLE [Department_Title] 
DROP CONSTRAINT IF EXISTS [PK_Department_Title];

ALTER TABLE [Department_Title] Add
Constraint [PK_Department_Title] PRIMARY KEY ([DepartmentTitle_ID]);
Go

--***Faryal's PKs***--

--Employee Title PK
ALTER TABLE [Employee_Title]
DROP CONSTRAINT IF EXISTS [PK_Employee_Title]

ALTER TABLE [Employee_Title] Add
Constraint [PK_Employee_Title] PRIMARY KEY ([EmployeeTitle_ID]);
Go

--Department PK
ALTER TABLE [Department]
DROP CONSTRAINT IF EXISTS [PK_Department];

ALTER TABLE [Department] Add
Constraint [PK_Department] PRIMARY KEY ([Department_ID]);
Go

--Employee Information PK
ALTER TABLE [Employee_Information]
DROP CONSTRAINT IF EXISTS [PK_Employee_Information];

ALTER TABLE [Employee_Information] Add
Constraint [PK_Employee_Information] PRIMARY KEY ([Employee_ID]);
Go

--Hat PK
ALTER TABLE [Hat]
DROP CONSTRAINT IF EXISTS [PK_Hat];

ALTER TABLE [Hat] Add
Constraint [PK_Hat] PRIMARY KEY ([Hat_ID]);
Go

--Hat Color PK
ALTER TABLE [Hat_Color]
DROP CONSTRAINT IF EXISTS [PK_Hat_Color];

ALTER TABLE [Hat_Color] Add
Constraint [PK_Hat_Color] PRIMARY KEY ([HatColor_ID]);
Go

--Employee Location PK
ALTER TABLE [Employee_Location]
DROP CONSTRAINT IF EXISTS [PK_Employee_Location];

ALTER TABLE [Employee_Location] Add
Constraint [PK_Employee_Location] PRIMARY KEY ([EmployeeLocation_ID]);
Go

--***John's PKs***--

--City Pk
ALTER TABLE [City]
DROP CONSTRAINT IF EXISTS [PK_City];

ALTER TABLE [City] Add 
Constraint [PK_City] PRIMARY KEY ([City_ID]);
Go

--State PK
ALTER TABLE [State]
DROP CONSTRAINT IF EXISTS [PK_State];

ALTER TABLE [State] Add
Constraint [PK_State] PRIMARY KEY ([State_ID]);
Go

--Country PK
ALTER TABLE [Country]
DROP CONSTRAINT IF EXISTS [PK_Country];

ALTER TABLE [Country] Add 
Constraint [PK_Country] PRIMARY KEY	([Country_ID]);
Go

--Zip Code PK
ALTER TABLE [Zip_Code]
DROP CONSTRAINT IF EXISTS [PK_Zip_Code];

ALTER TABLE [Zip_Code] Add
Constraint [PK_Zip_Code] PRIMARY KEY ([ZipCode_ID]);
Go

--Klaus Brewing Location PK
ALTER TABLE [Klaus_Brewing_Location]
DROP CONSTRAINT IF EXISTS [PK_Klaus_Brewing_Location];

ALTER TABLE [Klaus_Brewing_Location] Add
Constraint [PK_Klaus_Brewing_Location] PRIMARY KEY ([Brewery_ID]);
Go

--***Pratik's PKs***--

--Order Detail PK
ALTER TABLE [Order_Detail]
DROP CONSTRAINT IF EXISTS [PK_Order_Detail];

ALTER TABLE [Order_Detail] Add
Constraint [PK_Order_Detail] PRIMARY KEY ([OrderDetail_ID]);
Go

--Order PK
ALTER TABLE [Order]
DROP CONSTRAINT IF EXISTS [PK_Order];

ALTER TABLE [Order] Add
Constraint [PK_Order] PRIMARY KEY ([Order_ID]);
Go

--Customer Information PK
ALTER TABLE [Customer_Information]
DROP CONSTRAINT IF EXISTS [PK_Customer_Information];

ALTER TABLE [Customer_Information] Add
Constraint [PK_Customer_Information] PRIMARY KEY ([Customer_ID]);
Go

--***Sean's PK***--

--Customer Profile PK
ALTER TABLE [Customer_Profile]
DROP CONSTRAINT IF EXISTS [PK_Customer_Profile];

ALTER TABLE [Customer_Profile] Add
Constraint [PK_Customer_Profile] PRIMARY KEY ([CustomerProfile_ID]);
Go

--Food Truck Sales PK
ALTER TABLE [Food_Truck_Sales]
DROP CONSTRAINT IF EXISTS [PK_Food_Truck_Sales];

ALTER TABLE [Food_Truck_Sales] Add
Constraint [PK_Food_Truck_Sales] PRIMARY KEY CLUSTERED ([FoodTruck_Date], [Brewery_ID]);
Go

--Redemption History PK
ALTER TABLE [Redemption_History]
DROP CONSTRAINT IF EXISTS [PK_Redemption_History];

ALTER TABLE [Redemption_History] Add
Constraint [PK_Redemption_History] PRIMARY KEY ([Redemption_ID]);
Go

--Rewards PK
ALTER TABLE [Reward]
DROP CONSTRAINT IF EXISTS [PK_Reward];

ALTER TABLE [Reward] Add
Constraint [PK_Reward] PRIMARY KEY ([Reward_ID]);
Go

--***Sem's PK*** --

--TShirt PK
ALTER TABLE [TShirt]
DROP CONSTRAINT IF EXISTS [PK_TShirt];

ALTER TABLE [TShirt] Add
Constraint [PK_TShirt] PRIMARY KEY ([TShirt_ID]);
Go

--TShirt Type PK
ALTER TABLE [TShirt_Type]
DROP CONSTRAINT IF EXISTS [PK_TShirt_Type];

ALTER TABLE [TShirt_Type] Add
Constraint [PK_TShirt_Type] PRIMARY KEY ([TShirtType_ID]);
Go

--TShirt Color PK
ALTER TABLE [TShirt_Color]
DROP CONSTRAINT IF EXISTS [PK_TShirt_Color];

ALTER TABLE [TShirt_Color] Add
Constraint [PK_TShirt_Color] PRIMARY KEY ([Color_ID]);
Go

--Alter Table Foreign Key Scripts
--***Adekunle's FKs***--

--1) Reference: Product -> Beer
--2) Reference: Beer List -> Beer
--3) Reference: Beer Type -> Beer
--4) Reference: Beer Container Size -> Beer
ALTER TABLE [Beer] Add Constraint [FK_Beer]
	FOREIGN KEY ([Product_ID])
	REFERENCES [Product] ([Product_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
	
Go
ALTER TABLE [Beer] Add Constraint [FK_Beer2]
	FOREIGN KEY ([Beer_Name])
	REFERENCES [Beer_List] ([Beer_Name])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
	
Go
ALTER TABLE [Beer] Add Constraint [FK_Beer3]
	FOREIGN KEY ([BeerType_ID])
	REFERENCES [Beer_Type] ([BeerType_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Beer] Add Constraint [FK_Beer4]
	FOREIGN KEY ([BeerContainerSize_ID])
	REFERENCES [Beer_Container_Size] ([BeerContainerSize_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Product -> Merchandise
--1) Reference: Merchandise Type -> Merchandise
ALTER TABLE [Merchandise] Add Constraint [FK_Merchandise]
	FOREIGN KEY ([Product_ID])
	REFERENCES [Product] ([Product_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Merchandise] Add Constraint [FK_Merchandise2]
	FOREIGN KEY ([MerchandiseType_ID])
	REFERENCES [Merchandise_Type] ([MerchandiseType_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Merchandise -> Glassware
ALTER TABLE [Glassware] Add Constraint [FK_Glassware]
	FOREIGN KEY ([Merchandise_ID])
	REFERENCES [Merchandise] ([Merchandise_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--***Chantera's FK***--

--1) Reference: Klaus Brewing Location -> Product
ALTER TABLE [Product] Add Constraint [FK_Product]
	FOREIGN KEY ([Brewery_ID])
	REFERENCES [Klaus_Brewing_Location] ([Brewery_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Product  -> Misc Item
--2) Reference: Item Type -> Misc Item
ALTER TABLE [Misc_Item] Add Constraint [FK_Misc_Item]
	FOREIGN KEY ([Product_ID])
	REFERENCES [Product] ([Product_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Misc_Item] Add Constraint [FK_Misc_Item2] 
	FOREIGN KEY ([ItemType_ID])
	REFERENCES [Item_Type] ([ItemType_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Employee Title -> Employee User
--2) Reference: User -> Employee User
ALTER TABLE [Employee_User] Add Constraint [FK_Employee_User]
	FOREIGN KEY ([EmployeeTitle_ID])
	REFERENCES [Employee_Title] ([EmployeeTitle_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Employee_User] Add Constraint [FK_Employee_User2]
	FOREIGN KEY ([User_ID])
	REFERENCES [User] ([User_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Role -> User
ALTER TABLE [User] Add Constraint [FK_User]
	FOREIGN KEY ([Role_ID])
	REFERENCES [Role] ([Role_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference:Role -> Permission
ALTER TABLE [Permission] Add Constraint [FK_Permission]
	FOREIGN KEY ([Role_ID])
	REFERENCES [Role] ([Role_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference:Customer Profile -> Customer User
--2) Reference:User -> Customer User
--3) Reference:Customer Information -> Customer User
ALTER TABLE [Customer_User] Add Constraint [FK_Customer_User]
	FOREIGN KEY ([CustomerProfile_ID])
	REFERENCES [Customer_Profile] ([CustomerProfile_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Customer_User] Add Constraint [FK_Customer_User2]
	FOREIGN KEY ([User_ID])
	REFERENCES [User] ([User_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Customer_User] Add Constraint [FK_Customer_User3]
	FOREIGN KEY ([Customer_ID])
	REFERENCES [Customer_Information] ([Customer_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference:Revision -> User Revision
--2) Reference:User -> User Revision
ALTER TABLE [User_Revision] Add Constraint [FK_User_Revision]
	FOREIGN KEY ([Revision_ID])
	REFERENCES [Revision] ([Revision_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [User_Revision] Add Constraint [FK_User_Revision2]
	FOREIGN KEY ([User_ID])
	REFERENCES [User] ([User_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference:Department -> Department_Title
ALTER TABLE [Department_Title] Add Constraint [FK_Department_Title]
	FOREIGN KEY ([Department_ID])
	REFERENCES [Department] ([Department_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--***Faryal's FK***--

--1) Reference: Department -> Employee_Title
--2) Reference: Employee Information -> Employee_Title
ALTER TABLE [Employee_Title] Add Constraint [FK_Employee_Title]
	FOREIGN KEY ([DepartmentTitle_ID])
	REFERENCES [Department_Title] ([DepartmentTitle_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Employee_Title] Add Constraint [FK_Employee_Title2]
	FOREIGN KEY ([Employee_ID])
	REFERENCES [Employee_Information] ([Employee_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: City -> Employee Information
--2) Reference: State -> Employee Information
--3) Reference: Zip Code -> Employee Information
--4) Reference: Country -> Employee Information
ALTER TABLE [Employee_Information] Add Constraint [FK_Employee_Information]
	FOREIGN KEY ([City_ID])
	REFERENCES [City] ([City_ID]);
Go
ALTER TABLE [Employee_Information] Add Constraint [FK_Employee_Information2]
	FOREIGN KEY ([State_ID])
	REFERENCES [State] ([State_ID]);
Go
ALTER TABLE [Employee_Information] Add Constraint [FK_Employee_Information3]
	FOREIGN KEY ([ZipCode_ID])
	REFERENCES [Zip_Code] ([ZipCode_ID]);
Go
ALTER TABLE [Employee_Information] Add Constraint [FK_Employee_Information4]
	FOREIGN KEY ([Country_ID])
	REFERENCES [Country] ([Country_ID]);
Go
	
--1) Reference: Merchandise -> Hat
--2) Reference: Hat Color -> Hat
ALTER TABLE [HAT] Add Constraint [FK_Hat]
	FOREIGN KEY ([Merchandise_ID])
	REFERENCES [Merchandise] ([Merchandise_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [HAT] Add Constraint [FK_Hat2]
	FOREIGN KEY ([HatColor_ID])
	REFERENCES [Hat_Color] ([HatColor_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Employee Information -> Employee Location
--2) Reference: Klaus Brewing Location -> Employee Location
ALTER TABLE [Employee_Location] Add Constraint [FK_Employee_Location]
	FOREIGN KEY ([Employee_ID])
	REFERENCES [Employee_Information] ([Employee_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Employee_Location] Add Constraint [FK_Employee_Location2]
	FOREIGN KEY ([Brewery_ID])
	REFERENCES [Klaus_Brewing_Location] ([Brewery_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--***John's FK***--

--1) Reference: State -> City
ALTER TABLE [City] Add Constraint [FK_City]
	FOREIGN KEY ([State_ID])
	REFERENCES [State] ([State_ID]);
Go

--1) Reference: Country -> State
ALTER TABLE [State] Add Constraint [FK_State]
	FOREIGN KEY ([Country_ID])
	REFERENCES [Country] ([Country_ID]);
Go

--1) Reference: City -> Zip Code
ALTER TABLE [Zip_Code] Add Constraint [FK_Zip_Code]
	FOREIGN KEY ([City_ID])
	REFERENCES [City] ([City_ID]);
Go

--1) Reference: City -> Klaus Brewing Location
--2) Reference: State -> Klaus Brewing Location
--3) Reference: Zip Code -> Klaus Brewing Location
--4) Reference: Country -> Klaus Brewing Location
ALTER TABLE [Klaus_Brewing_Location] Add Constraint [FK_Klaus_Brewing_Location]
	FOREIGN KEY ([City_ID])
	REFERENCES [City] ([City_ID]);
Go
ALTER TABLE [Klaus_Brewing_Location] Add Constraint [FK_Klaus_Brewing_Location2]
	FOREIGN KEY ([State_ID])
	REFERENCES [State] ([State_ID]);
Go
ALTER TABLE [Klaus_Brewing_Location] Add Constraint [FK_Klaus_Brewing_Location3]
	FOREIGN KEY ([ZipCode_ID])
	REFERENCES [Zip_Code] ([ZipCode_ID]);
Go
ALTER TABLE [Klaus_Brewing_Location] Add Constraint [FK_Klaus_Brewing_Location4]
	FOREIGN KEY ([Country_ID])
	REFERENCES [Country] ([Country_ID]);
Go

--***Pratik's FKs***---

--1) Reference: Order -> Order Detail
--2) Reference: Product -> Order Detail
ALTER TABLE [Order_Detail] Add Constraint [FK_Order_Detail]
	FOREIGN KEY ([Order_ID])
	REFERENCES [Order] ([Order_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Order_Detail] Add Constraint [FK_Order_Detail2]
	FOREIGN KEY ([Product_ID])
	REFERENCES [Product] ([Product_ID]);
Go

--1) Reference: Customer Information -> Order
--2) Reference: Employee -> Order
--3) Reference: Coupon -> Order
ALTER TABLE [Order] Add Constraint [FK_Order]
	FOREIGN KEY ([Customer_ID])
	REFERENCES [Customer_Information] ([Customer_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Order] Add Constraint [FK_Order2]
	FOREIGN KEY ([EmployeeTitle_ID])
	REFERENCES [Employee_Title] ([EmployeeTitle_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Order] Add Constraint [FK_Order3]
	FOREIGN KEY ([Coupon_Code])
	REFERENCES [Coupon] ([Coupon_Code])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: City  -> Customer Information
--2) Reference: State -> Customer Information
--3) Reference: Zip Code -> Customer Information
--4) Reference: Country -> Customer Information
ALTER TABLE [Customer_Information] Add Constraint [FK_Customer_Information]
	FOREIGN KEY ([City_ID])
	REFERENCES [City] ([City_ID]);
Go
ALTER TABLE [Customer_Information] Add Constraint [FK_Customer_Information2]
	FOREIGN KEY ([State_ID])
	REFERENCES [State] ([State_ID]);
Go
ALTER TABLE [Customer_Information] Add Constraint [FK_Customer_Information3]
	FOREIGN KEY ([ZipCode_ID])
	REFERENCES [Zip_Code] ([ZipCode_ID]);
Go
ALTER TABLE [Customer_Information] Add Constraint [FK_Customer_Information4]
	FOREIGN KEY ([Country_ID])
	REFERENCES [Country] ([Country_ID]);
Go


--***Sean's FKs***---

--1) Reference: Klaus Brewing Location -> Food Truck Sales PK
ALTER TABLE [Food_Truck_Sales] Add Constraint [FK_Food_Truck_Sales]
	FOREIGN KEY ([Brewery_ID])
	REFERENCES [Klaus_Brewing_Location] ([Brewery_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: Customer Profile -> Redemption History
--2) Reference: Reward -> Redemption History
ALTER TABLE [Redemption_History] Add Constraint [FK_Redemption_History] 
	FOREIGN KEY ([CustomerProfile_ID])
	REFERENCES [Customer_Profile] ([CustomerProfile_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [Redemption_History] Add Constraint [FK_Redemption_History2]
	FOREIGN KEY ([Reward_ID])
	REFERENCES [Reward] ([Reward_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

---***Sem's FKs***---

--1) Reference: TShirt Type -> TShirt
--2) Reference: Merchandise -> TShirt
ALTER TABLE [TShirt] Add Constraint [FK_TShirt]
	FOREIGN KEY ([TShirtType_ID])
	REFERENCES [TShirt_Type] ([TShirtType_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go
ALTER TABLE [TShirt] Add Constraint [FK_TShirt2]
	FOREIGN KEY ([Merchandise_ID])
	REFERENCES [Merchandise] ([Merchandise_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--1) Reference: TShirt Color -> TShirt Type
ALTER TABLE [TShirt_Type] Add Constraint [FK_TShirt_Type]
	FOREIGN KEY ([Color_ID])
	REFERENCES [TShirt_Color] ([Color_ID])
	ON UPDATE CASCADE
	ON DELETE CASCADE;
Go

--Trigger Scripts (Soft Deletes)

--Trigger: Brewery
CREATE OR ALTER TRIGGER SoftDelete_Klaus_Brewing_Location ON [Klaus_Brewing_Location]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Klaus_Brewing_Location]
	SET [IsDeleted] = 1
	WHERE [Brewery_ID] IN (SELECT [Brewery_ID] FROM DELETED);
END
GO

--Trigger: State
CREATE OR ALTER TRIGGER SoftDelete_Coupon ON [Coupon]
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Coupon]
	SET [IsDeleted] = 1
	WHERE [Coupon_Code] IN (SELECT [Coupon_Code] FROM DELETED);
END
GO


--Soft Deletes examples

--Klaus Brewing Location
DELETE FROM [Klaus_Brewing_Location] 
WHERE [Brewery_ID] = 3;

SELECT * FROM [Klaus_Brewing_Location]

--Coupon
DELETE FROM [Coupon] 
WHERE [Coupon_Code] = 'BUY1GET50OFF';

SELECT * FROM [Coupon]
