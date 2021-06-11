Use Klaus_Brewery

Alter Table City 
	Add	Constraint [PK_City] Primary Key 
	Clustered 
	(City_ID);
Go

Alter Table State 
	Add Constraint [PK_State] Primary Key 
	Clustered
	(State_ID);
Go

Alter Table Country 
	Add Constraint [PK_Country] Primary Key 
	Clustered
	(Country_ID);
Go

Alter Table Zip_Code
	Add Constraint [PK_Zip_Code] Primary Key 
	Clustered
	(Zip_Code_Id);
Go

Alter Table Address
	Add Constraint [PK_Address] PRIMARY KEY 
	Clustered
	(Address_ID);
Go

Alter table Address_W_Zip_Code
	Add Constraint [PK_Address_W_Zip_Code] PRIMARY KEY
	Clustered
	(Address_W_Zip_ID);
Go

Alter table Address_W_O_Zip_Code
	Add Constraint [PK_Address_W_Zip_Code] PRIMARY KEY
	Clustered
	(Address_W_O_Zip_ID);

Alter Table Klaus_Brewing_Location 
	Add Constraint [PK_Klaus_Brewing_Location] PRIMARY KEY
	Clustered
	(Brewery_ID);
Go