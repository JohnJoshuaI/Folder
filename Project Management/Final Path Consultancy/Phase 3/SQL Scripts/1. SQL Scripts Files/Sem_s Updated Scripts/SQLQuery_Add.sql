SELECT * FROM TShirt_Type
INSERT INTO TShirt_Type(Tshirt_TypeID,Tshirt_Design)
VALUES (10,'LIGHT BLONDE')

Go

Select * FROM TShirt_Size
INSERT into TShirt_Size(Tshirt_Size_ID, Tshirt_Classification,size)
Values (10,'Men', '4XL')

Go

SELECT * FROM TShirtColor
INSERT into TShirtColor(Color_ID,colorName)
VALUES(7, 'Blue')

Go
SELECT * FROM TSHIRT
INSERT INTO TSHIRT(Tshirt_TypeID ,Color_ID,Tshirt_Size_ID)
VALUES(2,4,8),(4,2,5),(4,2,7),(4,2,2),(4,2,1)
