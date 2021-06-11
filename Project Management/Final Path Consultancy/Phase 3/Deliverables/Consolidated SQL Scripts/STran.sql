--Sean's 10 scripts

Use [Klaus Loyalty Program]

--***Sean's Insert Scripts***--

--Insert Script 1: Reward
INSERT INTO [Reward] ([Reward_Description], [Redemption_Cost])
	VALUES ('2 T-shirts', '400');
INSERT INTO [Reward] ([Reward_Description], [Redemption_Cost])
	VALUES ('3 T-shirts', '800');

SELECT * FROM [Reward]

--Insert Script 2: Food Truck Sales
INSERT INTO [Food_Truck_Sales] ([FoodTruck_Date], [Brewery_ID], [FoodTruck_Sales])
	VALUES ('2020-10-20', '1', '312.52');

SELECT * FROM [Food_Truck_Sales]

--***Sean's Update Scripts***--

--Update Script 1: Reward
UPDATE [Reward]
SET [Redemption_Cost] = '500'
WHERE [Reward_ID] = '1';

SELECT * FROM [Reward]

--Update Script 2: Food Truck Sales
UPDATE [Food_Truck_Sales]
SET [Brewery_ID] = '2'
WHERE [FoodTruck_Date] = '2020-10-20';

SELECT * FROM [Food_Truck_Sales]

--***Sean's Delete Scripts***--

--Delete Script 1: Food Truck Sales
DELETE FROM [Food_Truck_Sales] 
WHERE [FoodTruck_Date] = '2020-10-20';

SELECT * FROM [Food_Truck_Sales]

--Delete Script 2: Reward
DELETE FROM [Reward]
WHERE [Reward_ID] = 10;

SELECT * FROM [Reward]

--***Sean's Query/Report Scripts***--

--Report 1: List of all Customer's that has >= 100 lifetime points
DECLARE 
@Lifetime int

SELECT @Lifetime= 100

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Customer_Information].Customer_Email AS 'E-mail Address',
[User].Username AS 'Username',
[Customer_Profile].Lifetime_Points AS 'Lifetime Points'


FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [User] ON [User].User_ID = [Customer_User].User_ID

WHERE [Customer_Profile].Lifetime_Points >= @Lifetime

--Report 2: List of Customer's that has >= 50 lifetime points, but < 100 lifetime points.
DECLARE 
@LifetimeMin int,
@LifetimeMax int

SELECT @LifetimeMin = 50,
	   @LifetimeMax= 100

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Customer_Information].Customer_Email AS 'E-mail Address',
[User].Username AS 'Username',
[Customer_Profile].Lifetime_Points AS 'Lifetime Points'



FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [User] ON [User].User_ID = [Customer_User].User_ID

WHERE [Customer_Profile].Lifetime_Points >= @LifetimeMin AND [Customer_Profile].Lifetime_Points < @LifetimeMax

--Report 3: List of Customer's that has >= 25 lifetime points, but < 50 lifetime points.
DECLARE 
@LifetimeMin1 int,
@LifetimeMax1 int

SELECT @LifetimeMin1 = 25,
	   @LifetimeMax1 = 50

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Customer_Information].Customer_Email AS 'E-mail Address',
[User].Username AS 'Username',
[Customer_Profile].Lifetime_Points AS 'Lifetime Points'


FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [User] ON [User].User_ID = [Customer_User].User_ID

WHERE [Customer_Profile].Lifetime_Points >= @LifetimeMin1 AND [Customer_Profile].Lifetime_Points < @LifetimeMax1

--Report 4: List of Customer's that has < 25 Lifetime points
DECLARE 
@Lifetime1 int

SELECT @Lifetime1 = 25

SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[Customer_Information].Customer_Email AS 'E-mail Address',
[User].Username AS 'Username',
[Customer_Profile].Lifetime_Points AS 'Lifetime Points'


FROM [Customer_Information]
JOIN [Customer_User] ON [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [Customer_Profile] ON [Customer_Profile].CustomerProfile_ID = [Customer_User].CustomerProfile_ID
JOIN [User] ON [User].User_ID = [Customer_User].User_ID

WHERE [Customer_Profile].Lifetime_Points < @Lifetime1














Use [Klaus Loyalty Program]

SELECT 
[Beer_Type].Beer_Type AS 'Beer Type',
[Beer_Container_Size].Container_Name AS 'Container',
[Beer_Container_Size].Size AS 'Size',
[Beer].Beer_Name AS 'Beer Name',
[Beer_List].ABV AS 'ABV',
[Beer_List].IBU AS 'IBU'

FROM [Beer]
JOIN [Beer_List] ON [Beer_List].Beer_Name = [Beer].Beer_Name
JOIN [Beer_Container_Size] ON [Beer_Container_Size].BeerContainerSize_ID = [Beer].BeerContainerSize_ID
JOIN [Beer_Type] ON [Beer_Type].BeerType_ID = [Beer].BeerType_ID
