--Insert Scripts
Use [Klaus Loyalty Program]
--BULK INSERT [Products]
BULK INSERT [Products]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\Products_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);


SELECT * FROM [Products]

--BULK INSERT [Misc_Items]
BULK INSERT [Misc_Item]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\MiscItems_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Misc_Item]

--BULK INSERT [Item_Type] 
BULK INSERT [Item_Type]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\ItemType_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Item_Type]

--BULK INSERT [Coupon]
BULK INSERT [Coupon]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\Coupon_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Coupon]

--BULK INSERT [Employee_User]
BULK INSERT [Employee_User]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\EmployeeUser_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Employee_User]

--BULK INSERT [Role]
BULK INSERT [Role]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\Role_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Role]

--BULK INSERT [Permission]
BULK INSERT [Permission]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\Permission_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Permission]

--BULK INSERT [User]
BULK INSERT [User]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\User_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [User]

--BULK INSERT [Customer_User]
BULK INSERT [Customer_User]
FROM 'C:\Users\Student\Documents\SQL Server Management Studio\Data\CustomerUser_Data.csv'
WITH (
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM [Customer_User]

