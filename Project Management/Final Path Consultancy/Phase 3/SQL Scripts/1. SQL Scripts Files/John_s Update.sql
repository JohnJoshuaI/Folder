UPDATE[City]
	SET[State_ID]='1-Texas',
	WHERE[City_Name] = 'Houston';
SELECT * FROM[CITY]

--Update State--

UPDATE[State]
	SET[State_ID]='1-Texas',
	WHERE[State_Name] = 'Texas';
SELECT * FROM[State]

--Update Country--

UPDATE[Country]
	SET[Country_ID]='1-United States',
	WHERE[Country_Name] = 'US';
SELECT * FROM[Country]

--Update Zip_Code--

UPDATE[Zip_Code]
	SET[City_ID]='Houston',
	WHERE[Zip_Code_#] = '77004';
SELECT * FROM[Zip_Code]

--Update Address--

UPDATE[Address]
	SET[Address_Name]='2563 Glennshire Court',
	WHERE[Address_ID] = '3';
SELECT * FROM[Address]

--Update Address_W_Zip_Code--

UPDATE[Address_W_Zip_Code]
	SET[Zip_Code_ID]='N/A',
	WHERE[Country_ID] = '7-Austrillia';
SELECT * FROM[Address_W_Zip_Code]

--Update Address_W_O_Zip_Code--

UPDATE[Address_W_O_Zip_Code]
	SET[City_ID]='N/A',
	WHERE[Country_ID] = '7-Austrillia';
SELECT * FROM[Address_W_Zip_Code]
