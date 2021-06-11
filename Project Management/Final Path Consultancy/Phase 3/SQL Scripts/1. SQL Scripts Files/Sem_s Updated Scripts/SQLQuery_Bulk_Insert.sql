BULK INSERT TShirt_Type
FROM 'C:\Users\Squintanilla\Documents\CIS 3343 project documents\CIS 3365\TShirt_Type.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR='\n' );

Go

BULK INSERT TShirtColor
FROM 'C:\Users\Squintanilla\Documents\CIS 3343 project documents\CIS 3365\TShirtColor.csv'
WITH (
FIELDTERMINATOR = ',',
ROWTERMINATOR='\n' );

GO

Select * FROM TShirt_Size
BULK INSERT TShirt_Size
FROM 'C:\Users\Squintanilla\Documents\CIS 3343 project documents\CIS 3365\TShirt_Size.csv'
WITH ( 
FIELDTERMINATOR = ',',
ROWTERMINATOR='\n' )
;
