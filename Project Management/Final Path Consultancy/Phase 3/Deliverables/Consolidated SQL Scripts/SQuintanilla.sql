--Sem's 10 Scripts

Use [Klaus Loyalty Program]

--***Sem's Insert Scripts ***--

--Insert Script 1: TShirt Type 
INSERT INTO [TShirt_Type] ([TShirt_Classification], [TShirt_Size], [TShirt_Design], [Color_ID])
	VALUES ('Men', 'XXXX-Large', 'Klaus', 1);

SELECT * FROM [TShirt_Type]

--Insert Script 2: TShirt Color 
INSERT INTO [TShirt_Color] ([TShirt_Color])
	VALUES ('Yellow');
INSERT INTO [TShirt_Color] ([TShirt_Color])
	VALUES ('Pink');

SELECT * FROM [TShirt_Color]

--***Sem's Update Scripts***--

--Update Script 1: TShirt Type 
UPDATE [TShirt_Type]
SET [TShirt_Classification] = 'Men'
WHERE [TShirtType_ID] = 30

SELECT * FROM [TShirt_Type]

--Update Script 2: TShirt Color
UPDATE [TShirt_Color]
SET [TShirt_Color] ='Brown'
WHERE [Color_ID] = 6

SELECT * FROM [TShirt_Color]

--***Sem's Delete Scripts***--

--Delete Script 1: TShirt Design
DELETE FROM [TShirt_Type]
WHERE [TShirtType_ID] = 30;

Select * FROM [TShirt_Type]

--Delete Script 2: TShirt Color
DELETE FROM [TShirt_Color]
WHERE [Color_ID] = 2;

SELECT * FROM [TShirt_Color]

--***Sem's Query/Report Scripts***--

--Report 1: Employees who made a revision to the database.
SELECT
[Employee_Information].Employee_ID AS 'Employee ID',
[Employee_Information].First_Name AS 'First Name',
[Employee_Information].Last_Name AS 'Last Name',
[User].Username AS 'Username',
[Revision].Revision_Name 'Revision'

FROM [Employee_Information]
JOIN [Employee_Title] ON [Employee_Title].Employee_ID = [Employee_Information].Employee_ID
JOIN [Employee_User] ON [Employee_User].EmployeeTitle_ID = [Employee_Title].EmployeeTitle_ID
JOIN [User] ON [User].User_ID = [Employee_User].User_ID
JOIN [User_Revision] ON [User_Revision].User_ID = [User].User_ID
JOIN [Revision] ON [Revision].Revision_ID = [User_Revision].Revision_ID

--Report 2: Customers who made a revision to the database.
SELECT
[Customer_Information].Customer_ID AS 'CID',
[Customer_Information].Customer_First AS 'First Name',
[Customer_Information].Customer_Last AS 'Last Name',
[User].Username AS 'Username',
[Revision].Revision_Name 'Revision'

FROM [Customer_Information]
JOIN [Customer_User] on [Customer_User].Customer_ID = [Customer_Information].Customer_ID
JOIN [User] ON [User].User_ID = [Customer_User].User_ID
JOIN [User_Revision] ON [User_Revision].User_ID = [User].User_ID
JOIN [Revision] ON [Revision].Revision_ID = [User_Revision].Revision_ID

--Report 3: List of Biertenders from Brewery ID 1 and their corresponding start dates
DECLARE
@brew int,
@active bit,
@title int

SELECT @brew   = 1,
	   @active = 1,
	   @title = 3

SELECT
[Employee_Information].Employee_ID AS 'EID',
[Employee_Information].First_Name AS 'First Name',
[Employee_Information].Last_Name AS 'Last Name',
[Employee_Title].From_Date AS 'Start Date'


FROM [Klaus_Brewing_Location]
JOIN [Employee_Location] ON [Employee_Location].Brewery_ID = [Klaus_Brewing_Location].Brewery_ID
JOIN [Employee_Information] ON [Employee_Information].Employee_ID = [Employee_Location].Employee_ID
JOIN [Employee_Title] ON [Employee_Title].Employee_ID = [Employee_Information].Employee_ID
JOIN [Department_Title] ON [Department_Title].DepartmentTitle_ID = [Employee_Title].DepartmentTitle_ID

WHERE [Klaus_Brewing_Location].Brewery_ID = @brew 
AND   [Employee_Information].IsActive = @active 
AND   [Department_Title].DepartmentTitle_ID = @title

--Report 4: List of employees in the Brewing Department
DECLARE
@department int,
@active1 bit


SELECT @department = 5,
	   @active1 = 1

SELECT
[Employee_Information].Employee_ID AS 'EID',
[Employee_Information].First_Name AS 'First Name',
[Employee_Information].Last_Name AS 'Last Name',
[Department_Title].Title_Name AS 'Title',
[Klaus_Brewing_Location].Brewery_ID AS 'Brewery ID'


FROM [Klaus_Brewing_Location]
JOIN [Employee_Location] ON [Employee_Location].Brewery_ID = [Klaus_Brewing_Location].Brewery_ID
JOIN [Employee_Information] ON [Employee_Information].Employee_ID = [Employee_Location].Employee_ID
JOIN [Employee_Title] ON [Employee_Title].Employee_ID = [Employee_Information].Employee_ID
JOIN [Department_Title] ON [Department_Title].DepartmentTitle_ID = [Employee_Title].DepartmentTitle_ID
JOIN [Department] ON [Department].Department_ID = [Department_Title].Department_ID

WHERE [Department].Department_ID = @department
AND   [Employee_Information].IsActive = @active1