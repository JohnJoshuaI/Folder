--Adekunle's 10 Scripts

Use [Klaus Loyalty Program]

--***Adekunle's Insert Scripts ***--

--Insert Script 1: Beer Type 
INSERT INTO [Beer_Type] ([Beer_Type]) 
	VALUES ('Tour of Europe Special Release');

SELECT * FROM [Beer_Type]

--Insert Script 2: Glassware
INSERT INTO [Glassware] ([Merchandise_ID], [Glassware_Description])
	VALUES (2042, '30 oz Mug');

SELECT * FROM [Glassware]

--***Adekunle's Update Scripts***--

--Update Script 1: Beer List
UPDATE [Beer_List]
SET [Beer_Name] = 'India Pale Lager (IPL)'
WHERE [Beer_Name] = 'India Pale Lager';

SELECT * FROM [Beer_List]
SELECT * FROM [Beer]

--Update Script 2: Beer Type
UPDATE [Beer_Type]
SET [Beer_Type] = 'Very Special Release'
WHERE [Beer_Type] = 'Special Release';

SELECT * FROM [Beer_Type]

--***Adekunle's Delete Scripts***--

--Delete Script 1: Beer List
DELETE FROM [Beer_Type]
WHERE [Beer_Type] = 'Tour of Europe Special Release'

SELECT * FROM [Beer_Type]

--Delete Script 2: Beer Container Size
DELETE FROM [Beer_Container_Size]
WHERE [Size] = '6-ounce';

SELECT * FROM [Beer_Container_Size]

--***Adekunle's Query/Report Scripts***--

--Report 1: Search for which Beers are served in 'Glass' containers
DECLARE
@check varchar(30)

SELECT @check ='Glass'

SELECT
[Beer].Product_ID AS 'Product ID',
[Beer].Beer_Name AS 'BeerName',
[Beer_Type].Beer_Type AS 'BeerType',
[Beer_Container_Size].Container_Name AS 'Container',
[Beer_Container_Size].Size AS 'Size',
[Beer_List].ABV AS 'ABV',
[Beer_List].IBU AS 'IBU'

FROM [Beer]
JOIN [Beer_List] ON[Beer_List].Beer_Name = [Beer].Beer_Name
JOIN [Beer_Type] ON [Beer_Type].BeerType_ID = [Beer].BeerType_ID
JOIN [Beer_Container_Size] ON [Beer_Container_Size].BeerContainerSize_ID = [Beer].BeerContainerSize_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID

WHERE [Beer_Container_Size].Container_Name = @check

--Report 2: Search for which Beers are served in 'Bottle' containers
DECLARE
@check1 varchar(30)

SELECT @check1 ='Bottle'

SELECT
[Beer].Product_ID AS 'Product ID',
[Beer].Beer_Name AS 'BeerName',
[Beer_Type].Beer_Type AS 'BeerType',
[Beer_Container_Size].Container_Name AS 'Container',
[Beer_Container_Size].Size AS 'Size',
[Beer_List].ABV AS 'ABV',
[Beer_List].IBU AS 'IBU'

FROM [Beer]
JOIN [Beer_List] ON[Beer_List].Beer_Name = [Beer].Beer_Name
JOIN [Beer_Type] ON [Beer_Type].BeerType_ID = [Beer].BeerType_ID
JOIN [Beer_Container_Size] ON [Beer_Container_Size].BeerContainerSize_ID = [Beer].BeerContainerSize_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID

WHERE [Beer_Container_Size].Container_Name = @check1

--Report 3: Search for which Beers are served in 'Growler' containers
DECLARE
@check2 varchar(30)

SELECT @check2 ='Growler'

SELECT
[Beer].Product_ID AS 'Product ID',
[Beer].Beer_Name AS 'BeerName',
[Beer_Type].Beer_Type AS 'BeerType',
[Beer_Container_Size].Container_Name AS 'Container',
[Beer_Container_Size].Size AS 'Size',
[Beer_List].ABV AS 'ABV',
[Beer_List].IBU AS 'IBU'

FROM [Beer]
JOIN [Beer_List] ON[Beer_List].Beer_Name = [Beer].Beer_Name
JOIN [Beer_Type] ON [Beer_Type].BeerType_ID = [Beer].BeerType_ID
JOIN [Beer_Container_Size] ON [Beer_Container_Size].BeerContainerSize_ID = [Beer].BeerContainerSize_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID

WHERE [Beer_Container_Size].Container_Name = @check2

--Report 4: Search for which Beers are served in 'Keg' containers
DECLARE
@check3 varchar(30)

SELECT @check3 ='Keg'

SELECT
[Beer].Product_ID AS 'Product ID',
[Beer].Beer_Name AS 'BeerName',
[Beer_Type].Beer_Type AS 'BeerType',
[Beer_Container_Size].Container_Name AS 'Container',
[Beer_Container_Size].Size AS 'Size',
[Beer_List].ABV AS 'ABV',
[Beer_List].IBU AS 'IBU'

FROM [Beer]
JOIN [Beer_List] ON[Beer_List].Beer_Name = [Beer].Beer_Name
JOIN [Beer_Type] ON [Beer_Type].BeerType_ID = [Beer].BeerType_ID
JOIN [Beer_Container_Size] ON [Beer_Container_Size].BeerContainerSize_ID = [Beer].BeerContainerSize_ID
JOIN [Product] ON [Product].Product_ID = [Beer].Product_ID

WHERE [Beer_Container_Size].Container_Name = @check3