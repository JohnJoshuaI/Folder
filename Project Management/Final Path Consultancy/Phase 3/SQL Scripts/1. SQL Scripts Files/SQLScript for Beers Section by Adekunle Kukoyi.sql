create table Beer(
	Beer_ID int primary key identity(1,1),
	Product_ID int,
	Beer_Name varchar(60),
	BeerType_ID int,
	BeerContainerSize_ID int
)

select* from Beer
--drop table Beer;
alter table Beer
add foreign key(Beer_Name) references BeerList(Beer_Name);
alter table Beer
add foreign key(BeerType_ID) references BeerType(BeerType_ID);
alter table Beer
add foreign key(BeerContainerSize_ID) references Beer_Container_Size(BeerContainerSize_ID);
alter table Beer
add foreign key(Product_ID) REFERENCES Products(Product_ID);



create table BeerList(
	Beer_Name varchar(60),
	ABV decimal(5,1),
	constraint ck_BeerList_ABV check (ABV >0 and ABV<=100),
	IBU int
	primary key(Beer_Name)
	
)
select* from BeerList
--delete BeerList
--drop table BeerList

insert into BeerList(Beer_Name, ABV, IBU) values('Edelweizen',5,15);
insert into BeerList(Beer_Name, ABV, IBU) values('One Helles of a Lager',5.4,21);
insert into BeerList(Beer_Name, ABV, IBU) values('Wanderlust',5,28);
insert into BeerList(Beer_Name, ABV, IBU) values('Kaiser Kolsch',4.9,22);
insert into BeerList(Beer_Name, ABV, IBU) values('Dirndi Dropper',5.8,25);
insert into BeerList(Beer_Name, ABV, IBU) values('Dunkel Breakin My Heart',4.9,25);
insert into BeerList(Beer_Name, ABV, IBU) values('Doppelsticke',8,60);
insert into BeerList(Beer_Name, ABV, IBU) values('Vom Fass No.3',8.9,60);
insert into BeerList(Beer_Name, ABV, IBU) values('Weizenbock',8.5,18);
insert into BeerList(Beer_Name, ABV, IBU) values('Old World Kolsch',4.9,22);
insert into BeerList(Beer_Name, ABV, IBU) values('India Pale Lager',7.2,55);
insert into BeerList(Beer_Name, ABV, IBU) values('Saison',6.2,20);
insert into BeerList(Beer_Name, ABV, IBU) values('Berliner Weisse',3.5,2.5);
insert into BeerList(Beer_Name, ABV, IBU) values('Pilsnerfest',5.5,33);





create table BeerType(
	BeerType_ID int primary key identity(20,1),
	Beer_Type varchar(60)
)
SELECT* FROM BeerType;
--drop table BeerType;
insert into BeerType(Beer_Type) values('Core');
insert into BeerType(Beer_Type) values('Special Release');
insert into BeerType(Beer_Type) values('Tour of Europe');







create table Beer_Container_Size(
	BeerContainerSize_ID int primary key identity(1,1),
	Container_Name varchar(30),
	Size varchar(30),
	
)
--drop table Beer_Container_Size;
select* from Beer_Container_Size;

insert into Beer_Container_Size(Container_Name,Size) VALUES('Growler Fill', '32-ounce');
insert into Beer_Container_Size(Container_Name,Size) VALUES('Growler Fill', '64-ounce');
insert into Beer_Container_Size(Container_Name,Size) VALUES('Growler Fill', 'Gallon');
insert into Beer_Container_Size(Container_Name,Size) VALUES('Keg', 'Quarter Barrel');
insert into Beer_Container_Size(Container_Name,Size) VALUES('Keg', '50 Liter');
insert into Beer_Container_Size(Container_Name,Size) VALUES('Bottle', '22-ounce');
insert into Beer_Container_Size(Container_Name,Size) VALUES('Glass', '6-ounce');



