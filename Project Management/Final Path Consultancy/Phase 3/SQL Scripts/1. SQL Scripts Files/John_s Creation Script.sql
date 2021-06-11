Use Klaus_Brewery

CREATE TABLE City
(
	City_ID Int Not Null,
	City_Name VarChar(25) Not Null, 
	State_ID Int Not Null,
	Country_ID Int	Not Null,
);
Go

CREATE TABLE State
(
	State_ID Int Not Null,
	State_Name VarChar(25) Not Null,
	Country_ID Int Not Null,
);
Go

CREATE TABLE Country
(
	Country_ID Int Not Null,
	Country_Name VarChar(25) Not Null,
	Zip_Code_ID Int Not Null,
);
Go

CREATE TABLE Zip_Code
(
	Zip_Code_ID Int Not Null,
	Zip_Code_# Int Not Null,
	City_ID	Int Not Null,
	Country_ID Int Not Null, 
);
Go

CREATE TABLE Address
(
	Address_ID Int Not Null,
	Address_Street VarChar(25) Not Null,
	Address_Street_2 VarChar(25) Not Null,
);
Go

CREATE TABLE Address_W_Zip_Code
(
	Address_ID Int Not Null,
	Address_Street VarChar(25) Not Null,
	Address_Street_2 VarChar(25) Not Null,
);
Go

CREATE TABLE Address_W_O_Zip_Code
(
	Address_ID Int Not Null,
	Address_Street VarChar(25) Not Null,
	Address_Street_2 VarChar(25) Not Null,
);
Go

Create Table Klaus_Brewing_Location
(
	Brewery_ID Int Not Null,
	Brewery_Address VarChar(25) Not Null,
	City_Id Int Not Null,
	State_ID Int Not Null,
	Zip_Code_ID Int Not Null,
	Country_ID Int Not Null,
);
Go