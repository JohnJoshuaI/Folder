--Insert a new coupon

Use [Klaus Loyalty Program]

INSERT INTO [Coupon] ([Coupon_Code], [Coupon_Value], [Coupon_Unit], [Groupon])
VALUES ('KB168945', '20', 'percent', '0');

SELECT * FROM [Coupon]

--Update coupon
UPDATE [Coupon]
SET [Coupon_Value] = '30', Groupon = '1'
WHERE [Coupon_Code] = 'KB168945';

SELECT * FROM [Coupon]


DELETE FROM [Coupon] WHERE [Coupon_Code] = 'KB168945';

SELECT * FROM [Coupon]
