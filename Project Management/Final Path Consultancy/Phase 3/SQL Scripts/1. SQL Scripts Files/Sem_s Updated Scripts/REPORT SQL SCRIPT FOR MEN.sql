DECLARE
@TEMP VARCHAR(10)

SELECT @TEMP = 'MEN'

SELECT 
TSHIRT.Tshirt_ID AS 'TshirtID',
TShirt_Size.Tshirt_Classification AS 'Classification',
TShirt_Size.size,
TShirt_Type.Tshirt_Design AS 'Design',
TShirtColor.colorName AS 'Color'


FROM TSHIRT
 JOIN TShirt_Size on TShirt_Size.Tshirt_Size_ID = TSHIRT.Tshirt_Size_ID
 JOIN TShirt_Type on TShirt_Type.Tshirt_TypeID = TSHIRT.Tshirt_TypeID
 JOIN TShirtColor ON  TShirtColor.Color_ID = TSHIRT.Color_ID

 WHERE TShirt_Size.Tshirt_Classification = @TEMP
