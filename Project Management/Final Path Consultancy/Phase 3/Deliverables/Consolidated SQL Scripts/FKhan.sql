--Faryal's 10 Scripts

Use [Klaus Loyalty Program]

--***Faryal's Insert Scripts***--

--Insert Script 1: Hat Color
INSERT INTO [Hat_Color] ([Color]) 
	VALUES ('Pink');

SELECT * FROM [Hat_Color]

----Insert Script 2: Department
INSERT INTO [Department] ([Department_Name], [Department_Description]) 
	VALUES ('Human Resources', 'Specialists are responsible for recruiting, screening, interviewing and 
			 placing workers. Also in charge of admistrative function of the Brewery.');
	
SELECT * FROM [Department]

--***Faryal's Update Scripts***-- 

--Update Script 1: Hat Color
UPDATE [Hat_Color]
SET [Color] = 'Purple'
WHERE [Color] = 'Pink';

SELECT * FROM [Hat_Color]

--Update Script 2: Department
UPDATE [Department]
SET [Department_Description] = 'Consists of Brewery Managers responsible for management regarding brew making, sales and other components'
WHERE [Department_Name] = 'Manager'

SELECT * FROM [Department]

--***Faryal's Delete Scripts***--

--Delete Script 1: Hat Color
DELETE FROM [Hat_Color]
WHERE [HatColor_ID] = 5;

SELECT * FROM [Hat_Color]

--Delete Script 2: Department 
DELETE FROM [Department] 
WHERE [Department_Name] = 'Finance';

SELECT * FROM [Department]

--***Faryal's Query/Report Scripts***--

--Report 1:List of Employees located in Houston, TX
DECLARE 
@CITYNAME varchar(25)

SELECT @CITYNAME= 'Houston'

SELECT City.City_ID AS 'City ID',
[City].City_Name AS 'Name of City',
[State].State_Code AS 'Name of State',
[Country].Country_Name AS 'Name of Country',
[Employee_Information].Employee_ID AS 'Employee ID',
[Employee_Information].First_Name AS 'First Name',
[Employee_Information].Last_Name AS 'Last Name'


FROM [Employee_Information] 
JOIN [City] ON [City].City_ID = [Employee_Information].City_ID
JOIN [State] ON [State].State_ID = [City].State_ID
JOIN [Country] ON [Country].Country_ID = [State].Country_ID

WHERE [City].City_Name=@CITYNAME

--Report 2:List of all Mug glasses and which brewery they are sold.
SELECT
[Glassware].Glassware_Description AS 'Description',
[Merchandise_Type].Merchandise_Type AS 'Merchandise Type',
[Merchandise].Merchandise_ID AS 'Merchandise ID',
[Product].Product_ID AS 'Product ID',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery_ID'

FROM [Glassware]
JOIN [Merchandise] ON [Merchandise].Merchandise_ID = [Glassware].Merchandise_ID
JOIN [Merchandise_Type] ON [Merchandise_Type].MerchandiseType_ID = [Merchandise].MerchandiseType_ID
JOIN [Product] ON [Product].Product_ID = [Merchandise].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID 

WHERE [Glassware].Glassware_Description LIKE '%Mug'

--Report 3: List all hats priced at $22
DECLARE
@PRICE smallmoney

SELECT @PRICE = 22.00

SELECT
[Hat_Color].Color 'Hat Color',
[Hat].Hat_Description AS 'Hat Description',
[Product].Product_Price AS 'Price',
[Product].Brewery_ID AS 'Brewery ID'

FROM [Hat]
JOIN [Hat_Color] ON [Hat_Color].HatColor_ID = [Hat].HatColor_ID
JOIN [Merchandise] ON [Merchandise].Merchandise_ID = [Hat].Merchandise_ID
JOIN [Product] ON [Product].Product_ID = [Merchandise].Product_ID


WHERE [Product].Product_Price=@PRICE

--Report 4: List of Employees located in the zip code 77043 only
DECLARE  
@emptable INT

SELECT @emptable= 75043

SELECT 
[Employee_Information].Employee_ID AS 'Employee ID',
[Employee_Information].First_Name AS 'First Name',
[Employee_Information].Middle_Initial AS 'Middle Initial',
[Employee_Information].Last_Name AS 'Last Name',
[Employee_Information].Employee_Address AS 'Address',
[City].City_Name AS 'City',
[State].State_Code AS 'State',
[Zip_Code].Zip_Code AS 'Zip Code'

FROM [Employee_Information]
JOIN [Zip_Code] ON [Zip_Code].ZipCode_ID = [Employee_Information].ZipCode_ID
JOIN [City] ON [City].City_ID = [Employee_Information].City_ID
JOIN [State] ON [State].State_ID = Employee_Information.State_ID
--JOIN [City] ON [City].City_ID = Zip_Code.City_ID
--JOIN [State] ON [State].State_ID = [City].State_ID


WHERE [Zip_Code].Zip_Code = @emptable