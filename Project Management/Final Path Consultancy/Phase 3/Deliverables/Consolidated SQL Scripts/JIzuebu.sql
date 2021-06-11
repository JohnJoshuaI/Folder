--John's 10 Scripts

Use [Klaus Loyalty Program]

--***John's Insert Scripts***--

--Insert Script 1: City
INSERT INTO [City] ([State_ID], [City_Name]) 
	VALUES (34, 'New York City');

SELECT * FROM [City]

--Insert Script 2: Klaus Brewing Location
INSERT INTO [Klaus_Brewing_Location] ([Brewery_ID], [Brewery_Address], [City_ID], [State_ID], [ZipCode_ID], [Country_ID])
	VALUES (4, '10143 Jones Road', 1, 1, 2, 215);

SELECT * FROM [Klaus_Brewing_Location]

--***John's Update Scripts***--

--Update Script 1: City
UPDATE [City]
SET [City_Name] = 'Denton'
WHERE [City_Name] = 'Dallas';

SELECT * FROM [City]

--Update Script 2: Country
UPDATE [Country]
SET [Country_Name] = 'United States of America (USA)'
WHERE [Country_Name] = 'United States of America';

SELECT * FROM [Country]

--***John's Delete Scripts***--

--Delete Script 1: Country
DELETE FROM [Country]
WHERE [Recognized_UN] = 0;

SELECT * FROM [Country]

--Delete Script 2: Klaus Brewing Location
DELETE FROM [Klaus_Brewing_Location] 
WHERE [Brewery_ID] = 4;

SELECT * FROM [Klaus_Brewing_Location]

--***John's Query/Report Scripts***--

--Report 1: List of Core Series Beer sold at all Breweries
DECLARE
@BeerType varchar(60)

SELECT @BeerType= 'Core'

SELECT
[Beer_Type].Beer_Type AS 'Type of Beer',
[Product].Product_Description AS 'Beer Name',
[Product].Product_Price AS 'Price',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery ID'

FROM [Beer_Type]
JOIN [Beer] ON [BEER].BeerType_ID = [Beer_Type].BeerType_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID

WHERE [Beer_Type].Beer_Type= @BeerType

--Report 2: List of Tour of Europe Series Beer sold at all Breweries
DECLARE
@BeerType2 varchar(60)

SELECT @BeerType2= 'Tour of Europe'

SELECT
[Beer_Type].Beer_Type AS 'Type of Beer',
[Product].Product_Description AS 'Beer Name',
[Product].Product_Price AS 'Price',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery ID'

FROM [Beer_Type]
JOIN [Beer] ON [BEER].BeerType_ID = [Beer_Type].BeerType_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID

WHERE [Beer_Type].Beer_Type= @BeerType2

--Report 3: List of Special Release Series Beer sold at all Breweries
DECLARE
@BeerType3 varchar(60)

SELECT @BeerType3= 'Special Release'

--Use if Adekunle's update script was completed
--SELECT @BeerType3= 'Very Special Release'

SELECT
[Beer_Type].Beer_Type AS 'Type of Beer',
[Product].Product_Description AS 'Beer Name',
[Product].Product_Price AS 'Price',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery ID'

FROM [Beer_Type]
JOIN [Beer] ON [BEER].BeerType_ID = [Beer_Type].BeerType_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID

WHERE [Beer_Type].Beer_Type= @BeerType3

--Report 4: List of "Dunkel" Beers sold at all Breweries
SELECT
[Product].Product_Description AS 'Beer Name',
[Product].Product_Price AS 'Price',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery ID'

FROM [Beer_List]
JOIN [Beer] ON [Beer].Beer_Name = [Beer_List].Beer_Name
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID
JOIN [Klaus_Brewing_Location] ON [Klaus_Brewing_Location].Brewery_ID = [Product].Brewery_ID

WHERE [Beer_List].Beer_Name LIKE 'Dunkel%'
