---1. Create a database as requested above.
create database SonT2207E;
---2. Create table based on the above design.
create table Categories (
	CateID char(6) primary key ,
	CateName nvarchar(100) not null unique,
	Description nvarchar(200)
);



create table Parts (
	PartsId int primary key identity(1,1),
	PartsName nvarchar(100) not null unique ,
	CateID char(6) foreign key references Categories(CateID),
	Description nvarchar(1000) ,
	Price decimal(12,0) not null default 0,
	Quantity int default 0, 
	Warranty int default 1,
	Photo nvarchar(200) check(Photo like 'photo/%') default 'photo/nophoto.png'
);



---3. Insert into each table at least three records.

insert into Categories (CateID,CateName,Description)

values('CC2022',N'RAM',N'This is RAM'),
('CC2023',N'CPU',N'This is CPU'),
('CC2024',N'HDD',N'This is HDD')
;

Select * from Categories ;

insert into Parts (PartsName,CateID,Description,Price,Quantity,Warranty,Photo)
values(N'Ram PC Kingston Fury Beast Black 32GB 5200MHz DDR','CC2022',N'This is PC Kingston Fury Beast Black 32GB 5200MHz DDR5',50,3,3,N'Photo/Ram.png' ),
(N'PC ST-NEPTUNE i7','CC2023',N'This is PC ST-NEPTUNE i7',400,4,4,N'Photo/CPU.png' ),
(N'HDD WD Blue 2TB 3.5 inch SATA III 256MB Cache 7200RPM WD20EZBX','CC2024',N'This is HDD WD Blue 2TB 3.5 inch SATA III 256MB Cache 7200RPM WD20EZBX ',500,5,5,N'Photo/HDD.png' )

Select * from  Parts ;

---4.List all parts in the store with price > 100

select * from Parts where Price>100;

---5. List all parts of the category ‘CPU’

select * from Parts where CateID in (select CateID from Categories where CateName like 'CPU');

---6. Create a view v_Parts contains the following information (PartID, PartName, CateName,Price, Quantity) from table Parts and Categories.

CREATE VIEW v_Parts AS
select a.PartsId,a.PartsName,b.CateName,a.Price,a.Quantity from Parts a 
left join Categories b on a.CateID = b.CateID;

select * from v_Parts;

--- 7.Create a view v_TopParts about 5 parts with the most expensive price


create view v_TopParts as
select top 5 PartsName from Parts order by Price desc;

select * from v_TopParts;
