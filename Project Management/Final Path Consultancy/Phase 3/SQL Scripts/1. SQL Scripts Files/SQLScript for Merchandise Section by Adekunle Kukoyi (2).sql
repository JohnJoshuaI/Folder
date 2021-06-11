create table Merchandise(
	Merch_ID int primary key identity(2000,1),
	Product_ID int,
	MerchandiseType_ID int
)
--drop table Merchandise
select* from Merchandise
insert into Merchandise(Product_ID) values(27);
insert into Merchandise(Product_ID) values(28);
insert into Merchandise(Product_ID) values(29);
insert into Merchandise(Product_ID) values(30);
insert into Merchandise(Product_ID) values(31);
insert into Merchandise(Product_ID) values(32);
insert into Merchandise(Product_ID) values(33);


alter table Merchandise
add foreign key(MerchandiseType_ID) references MerchandiseType(MerchandiseType_ID);


create table MerchandiseType(
	MerchandiseType_ID int primary key identity(1,1),
	Merchandise_Type varchar(50)
)
--drop table MerchandiseType
select* from MerchandiseType
insert into MerchandiseType(Merchandise_Type) values('Hat');
insert into MerchandiseType(Merchandise_Type) values('T-Shirt');
insert into MerchandiseType(Merchandise_Type) values('Glassware');






create table Glassware(
	Glassware_ID int primary key identity(1,1),
	MerchandiseType_ID int,
	GlasswareSize_ID int,
	Glassware_Description varchar(60)
)
 --drop table Glassware;
select* from Glassware;
alter table Glassware
add foreign key(MerchandiseType_ID) references MerchandiseType(MerchandiseType_ID);
alter table Glassware
add foreign key(GlasswareSize_ID) references GlasswareSize(GlasswareSize_ID);



create table GlasswareSize(
	GlasswareSize_ID int primary key identity(1,1),
	Size varchar(50)
)
--drop table GlasswareSize
select* from GlasswareSize

insert into GlasswareSize(Size) values('6 oz Snifter');
insert into GlasswareSize(Size) values('8 oz Snifter');
insert into GlasswareSize(Size) values('8.8 oz Pilsner');
insert into GlasswareSize(Size) values('11 oz Pilsner');
insert into GlasswareSize(Size) values('13 oz Goblet');
insert into GlasswareSize(Size) values('6 oz Mug');
insert into GlasswareSize(Size) values('30 oz Mug');






