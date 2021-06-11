
INSERT INTO City (City_ID, City_Name, State_ID, Country_ID)
	VALUES ('1','Houston','1-Texas','1-United States');
SELECT * FROM City


INSERT INTO State (State_ID, State_Name, Country_ID)
	VALUES ('1','1-Texas','1-United States');
SELECT * FROM State

INSERT INTO Country (Country_ID, Country_Name)
	VALUES ('1','1-United States');
SELECT * FROM Country

INSERT INTO Zip_Code (Zip_Code_ID, Zip_Code_#, City_ID, Country_ID)
	VALUES ('1', '77004', '1-Houston', '1-United States');
SELECT * FROM Zip_Code

INSERT INTO Address (Address_ID, Address_Street, Adress_Street2)
	VALUES ('1','6584 Willow Dr','');
SELECT * FROM Address


INSERT INTO Address_W_Zip_Code (Address_ID, Zip_Code_#, City_ID, Country_ID)
	VALUES ('1','77004','1-Houston', '1-United States');
SELECT * FROM Address_W_Zip_Code

INSERT INTO Address_W_O_Zip_Code (Address_ID, City_ID, Country_ID)
	VALUES ('1','1-Houston', '1-United States');
SELECT * FROM Address_W_O_Zip_Code



