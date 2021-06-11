
--CITY SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_City ON CITY
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE City
	SET [IsDeleted] = 1
	WHERE City_Name IN (SELECT City_Name FROM DELETED);
END
GO

--STATE SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_State ON State
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE State
	SET [IsDeleted] = 1
	WHERE State_Name IN (SELECT State_Name FROM DELETED);
END
GO

--COUNTRY SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_Country ON Country
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Country
	SET [IsDeleted] = 1
	WHERE Country_Name IN (SELECT Country_Name FROM DELETED);
END
GO

--ZIP CODE SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_Zip_Code ON Zip_Code
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Zip_Code
	SET [IsDeleted] = 1
	WHERE Zip_Code IN (SELECT Zip_Code FROM DELETED);
END
GO

--ADDRESS SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_Address ON Address
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Address
	SET [IsDeleted] = 1
	WHERE Address IN (SELECT Address FROM DELETED);
END
GO

--Address w/ Zip Code SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_Address_W_Zip_Code ON Address_W_Zip_Code
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Address_W_Zip_Code
	SET [IsDeleted] = 1
	WHERE Address_W_Zip_Code IN (SELECT Address_W_Zip_Code FROM DELETED);
END
GO

--Address w/o Zip Code SOFTDELETE TRIGGER--

CREATE OR ALTER TRIGGER SoftDelete_Address_W_O_Zip_Code ON Address_W_O_Zip_Code
	INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Address_W_O_Zip_Code
	SET [IsDeleted] = 1
	WHERE Address_W_O_Zip_Code IN (SELECT Address_W_O_Zip_Code FROM DELETED);
END
GO


---------DELETION SYNTAX----------

DELETE FROM [City] WHERE [CITY_ID] = '2';
SELECT * FROM [State]

DELETE FROM [State] WHERE [State_ID] = '2';
SELECT * FROM [State]

DELETE FROM [Country] WHERE [Country_ID] = '2';
SELECT * FROM [Country]

DELETE FROM [Zip_Code] WHERE [Zip_Code_ID] = '2';
SELECT * FROM [Zip_Code]

DELETE FROM [Address] WHERE [Address_ID] = '2';
SELECT * FROM [Address]

DELETE FROM [Address_W_Zip_Code] WHERE [Address_ID] = '2';
SELECT * FROM [Address_W_Zip_Code]

DELETE FROM [Address_W_O_Zip_Code] WHERE [Address_ID] = '2';
SELECT * FROM [Address_W_O_Zip_Code]
GO