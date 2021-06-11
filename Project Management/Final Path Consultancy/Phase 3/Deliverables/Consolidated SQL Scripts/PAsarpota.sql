--Pratik's 10 Scripts

Use [Klaus Loyalty Program]

--Pratik's Insert Scripts***--

--Insert Script 1: Order
INSERT INTO [Order] ([Order_ID], [Customer_ID], [EmployeeTitle_ID], [Order_Date], [Is_Member], [Subtotal], [Total_Price], [Payment_Type], [Status], [Loyalty_Points_Earned], [Total_Points])
	VALUES ('1231', '5555', '6', '2020-10-20', '1', '25', '27.06', 'Cash', 'Fulfilled', '2', '102');
INSERT INTO [Order] ([Order_ID], [Customer_ID], [EmployeeTitle_ID], [Order_Date], [Is_Member], [Subtotal], [Total_Price], [Payment_Type], [Status], [Loyalty_Points_Earned], [Total_Points])
	VALUES ('1232', '3333', '5', '2020-10-20', '1', '22', '23.82', 'Cash', 'Fulfilled', '1', '53');
INSERT INTO [Order] ([Order_ID], [Customer_ID], [EmployeeTitle_ID], [Order_Date], [Is_Member], [Subtotal], [Total_Price], [Payment_Type], [Status])
	VALUES ('1233', '5555', '9', '2020-10-20', '0', '54', '58.46', 'Credit Card', 'Fulfilled');
INSERT INTO [Order] ([Order_ID], [Customer_ID], [EmployeeTitle_ID], [Order_Date], [Is_Member], [Subtotal], [Total_Price], [Payment_Type], [Status], [Loyalty_Points_Earned], [Total_Points])
	VALUES ('1234', '2222', '1', '2020-10-21', '1', '38', '41.14', 'Cash', 'Fulfilled', '3', '69');

SELECT * FROM [Order]

--Insert Script 2: Order Detail
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])  
	VALUES('1231', '1');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1232', '4');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1233', '79');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1233', '162');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1233', '63');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1234', '69');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1234', '294');
INSERT INTO [Order_Detail] ([Order_ID], [Product_ID])
	VALUES ('1234', '294');

SELECT * FROM [Order_Detail]

--***Pratik's Update Scripts***---

--Update Script 1: Order
UPDATE [Order]
SET [Is_Member] = 1
WHERE [Order_ID] = 1233;

SELECT * FROM [Order]

--Update Script 2: Order Detail
UPDATE [Order_Detail]
SET [Discount] = 0
Where [OrderDetail_ID] = 3

SELECT * FROM [Order_Detail]

--***Pratik's Delete Scripts***--

--Delete Script 1: Order
DELETE FROM [Order] 
WHERE [Order_ID] = 1252;

SELECT * FROM [Order]

--Delete Script 2: Order Detail
DELETE FROM [Order_Detail]
WHERE [OrderDetail_ID] = 5

SELECT * FROM [Order_Detail]

--***Pratik's Query/Report Scripts***--

--Report 1: List of Klaus Caps sold at a specific brewery 
DECLARE 
@brewery int

SELECT @brewery = 2

SELECT
[Hat_Color].Color AS 'Color',
[Hat].Hat_Description AS 'Description',
[Product].Product_Price AS 'Price',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery ID'

FROM [Hat_Color]
JOIN [Hat] ON [Hat].HatColor_ID = [Hat_Color].HatColor_ID
JOIN [Merchandise] ON [Merchandise].Merchandise_ID = [Hat].Merchandise_ID
JOIN [Product] ON [Product].Product_ID = [Merchandise].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID

WHERE [Hat].Hat_Description LIKE 'Klaus%' AND [Klaus_Brewing_Location].Brewery_ID = @brewery

--Report 2: List of Customers that Redeemed Reward 1
DECLARE
@Reward int

SELECT @Reward = 1

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Reward].Reward_Description AS 'Reward of Interest'

FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [Redemption_History] ON [Redemption_History].CustomerProfile_ID = [Customer_Profile].CustomerProfile_ID
JOIN [Reward] ON [Reward].Reward_ID = [Redemption_History].Reward_ID

WHERE [Reward].Reward_ID = @Reward

--Report 3: List of Customers that Redeemed Reward 2
DECLARE
@Reward2 int

SELECT @Reward2 = 2

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Reward].Reward_Description AS 'Reward of Interest'

FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [Redemption_History] ON [Redemption_History].CustomerProfile_ID = [Customer_Profile].CustomerProfile_ID
JOIN [Reward] ON [Reward].Reward_ID = [Redemption_History].Reward_ID

WHERE [Reward].Reward_ID = @Reward2

--Report 4: List of Customers that Redeemed Reward 4
DECLARE
@Reward3 int

SELECT @Reward3 = 4

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Reward].Reward_Description AS 'Reward of Interest'

FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [Redemption_History] ON [Redemption_History].CustomerProfile_ID = [Customer_Profile].CustomerProfile_ID
JOIN [Reward] ON [Reward].Reward_ID = [Redemption_History].Reward_ID

WHERE [Reward].Reward_ID = @Reward3