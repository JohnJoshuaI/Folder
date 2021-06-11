
USE [klaus]

CREATE TABLE TShirt_Type(
Tshirt_TypeID INT NOT NULL,
Tshirt_Design VARCHAR(255) NOT NULL,
PRIMARY KEY (Tshirt_TypeID)
);

CREATE TABLE TShirtColor(
Color_ID INT NOT NULL,
colorName VARCHAR(25) NOT NULL
PRIMARY KEY (Color_ID)
);

CREATE TABLE TShirt_Size(
Tshirt_Size_ID INT NOT NULL,
Tshirt_Classification VARCHAR(20) NOT NULL,
size VARCHAR(20) NOT NULL,
PRIMARY KEY (Tshirt_Size_ID)
);

CREATE TABLE TSHIRT(
Tshirt_ID INT IDENTITY(1,1) PRIMARY KEY,
Tshirt_TypeID  INT NOT NULL,
Color_ID INT NOT NULL,
Tshirt_Size_ID INT NOT NULL,
MerchandiseType_ID INT
);



GO

ALTER TABLE TSHIRT 
ADD FOREIGN KEY (Color_ID) REFERENCES TShirtColor(Color_ID)

GO

ALTER TABLE TSHIRT 
ADD FOREIGN KEY (Tshirt_TypeID) REFERENCES TShirt_Type(Tshirt_TypeID)


GO
ALTER TABLE TSHIRT 
ADD FOREIGN KEY (Tshirt_Size_ID) REFERENCES TShirt_Size(Tshirt_Size_ID)

ALTER TABLE TSHIRT
ADD FOREIGN KEY(MerchandiseType_ID) REFERENCES MerchandiseType(MerchandiseType_ID)