--Chantera's 10 Scripts

Use [Klaus Loyalty Program]

--***Chantera's Insert Scripts***--

--Insert Script 1: Coupon
INSERT INTO [Coupon] ([Coupon_Code], [Coupon_Value], [Coupon_Unit], [Groupon])
	VALUES ('KB168945', '20', 'percent', '0');

SELECT * FROM [Coupon]


--Insert Script 2: Product
INSERT INTO [Product] ([Product_ID], [Brewery_ID], [Product_Description], [Product_Price])
	VALUES (295, 2, 'Saturday Core Flights', 10);

SELECT * FROM [Product]

--***Chantera's Update Scripts***--

--Update Script 1: Coupon
UPDATE [Coupon]
SET [Coupon_Value] = '30', Groupon = '1', Issue_Date = '2020-10-22'
WHERE [Coupon_Code] = 'KB168945';

SELECT * FROM [Coupon]

--Update Script 2: Product
UPDATE [Product]
SET [Product_Description] = 'Saturday Mix Flights'
WHERE [Product_ID] = 295;

SELECT * FROM [Product]

--***Chantera's Delete Scripts***--

--Delete Script 1: Coupon
DELETE FROM [Coupon] 
WHERE [Coupon_Code] = 'KB168945';

SELECT * FROM [Coupon]

--Delete Script 2: Product
DELETE FROM [Product]
WHERE [Product_ID] = 295;

SELECT * FROM [Product]

----***Chantera's Query/Report Scripts***--

--Report 1: Redemption History for a Customer of Interest
DECLARE
@CustOfInt INT
 
SELECT @CustOfInt = 5

SELECT 
[Customer_Information].Customer_First,
[Customer_Information].Customer_Last,
[Reward].Reward_Description,
[Reward].Redemption_Cost
 
FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [Redemption_History] ON [Redemption_History].CustomerProfile_ID = [Customer_Profile].CustomerProfile_ID
JOIN [Reward] ON [Reward].Reward_ID = [Redemption_History].Reward_ID
 
WHERE Customer_Profile.CustomerProfile_ID = @CustOfInt

--Report 2: List of Employee Admin
DECLARE
@roleofint int
 
SELECT @roleofint = 1

SELECT [Employee_Information].First_name,
[Employee_Information].Last_name,
[Department_Title].Title_Name
 
FROM [Employee_Information]
JOIN [Employee_Title] ON  [Employee_Information].Employee_ID = [Employee_Title].Employee_ID
JOIN [Department_Title] ON [Employee_Title].DepartmentTitle_ID = [Department_Title].DepartmentTitle_ID
JOIN [Employee_User] ON [Employee_User].EmployeeTitle_ID = [Employee_Title].EmployeeTitle_ID
JOIN [User] ON [User].User_ID = [Employee_User].User_ID
JOIN [Role] ON [Role].Role_ID = [User].Role_ID
 
WHERE [Role].Role_ID = @roleofint

--Report 3: List of Active Gift Sets
DECLARE
@ItemofInt int,
@Deleted bit, 
@Brewery int
 
SELECT @ItemofInt = 1
SELECT @Brewery = 1

SELECT 
[Product].Product_Description,
[Product].Product_Price
 
FROM [Product]
JOIN [Misc_Item] ON [Misc_Item].Product_ID = [Product].Product_ID
JOIN [Item_Type] ON [Item_Type].ItemType_ID = [Misc_Item].ItemType_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID 
   	
WHERE 
[Item_Type].ItemType_ID = @ItemofInt AND
[Klaus_Brewing_Location].Brewery_ID = @Brewery
			
--Report 4: Order Details for a specific order
Use [Klaus Loyalty Program]
DECLARE
@brewofInt int,
@OrderofInt int
 
SELECT @OrderofInt = '1019'

SELECT
[Order].Order_ID,
[Product].Product_Description,
[Product].Product_Price,
[Klaus_Brewing_Location].Brewery_ID
 
FROM [Order]
JOIN [Order_Detail] ON	[Order].Order_ID = [Order_Detail].Order_ID
JOIN [Product] ON [Product].Product_ID = [Order_Detail].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID
 
WHERE [Order].Order_ID = @OrderofInt

	