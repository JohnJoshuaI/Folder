SELECT 
MerchandiseType.Merchandise_Type,
TSHIRT.Tshirt_ID AS 'TshirtID',
TShirt_Size.Tshirt_Classification AS 'Classification',
TShirt_Size.size,
TShirt_Type.Tshirt_Design AS 'Design',
TShirtColor.colorName AS 'Color'

FROM MerchandiseType

JOIN TSHIRT ON TSHIRT.MerchandiseType_ID = MerchandiseType.MerchandiseType_ID
JOIN TShirt_Size on TShirt_Size.Tshirt_Size_ID = TSHIRT.Tshirt_Size_ID
JOIN TShirt_Type on TShirt_Type.Tshirt_TypeID = TSHIRT.Tshirt_TypeID
JOIN TShirtColor ON  TShirtColor.Color_ID = TSHIRT.Color_ID

