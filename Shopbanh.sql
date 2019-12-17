create database ProTechTiveGear

go
use ProTechTiveGear

go

---------------------TAI KHOANG NHAN VIEN---------------------------------
CREATE TABLE [Admin](
	Username nvarchar(400) not null primary key,
	Passwords nvarchar(400) not null,	
	[Name] NVARCHAR(45) NOT NULL,
	Picture NVARCHAR(max),
	
	 
)



go
CREATE TABLE Customer
(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	Username nvarchar(400) not null Unique,
	Passwords nvarchar(400) not null,
	[Name] NVARCHAR(45) NOT NULL,
	
	[Address]NVARCHAR(100),
	[EmailAddress] CHARACTER(100),

	Phone VARCHAR(15),
	Picture NVARCHAR(max),
	

	
)
-----------------------------------------------------------------------------

go
Create table Menu
(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(40),
	Link nvarchar(40),
)
go
CREATE TABLE ItemType
(
	ID BIGINT IDENTITY (1,1) PRIMARY KEY,
	TypeName NVARCHAR(30) NOT NULL,
	MenuID BIGINT REFERENCES dbo.Menu(ID),
)
go
CREATE TABLE Brand
(
	ID BIGINT IDENTITY (1,1) PRIMARY KEY,
	Name NVARCHAR(30) NOT NULL,
	MenuID BIGINT REFERENCES dbo.Menu(ID),
)
go
create table Item(

	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(30) NOT NULL,
	PurcharsePrice DECIMAL (18,0) , 
	SellPrice Decimal(18,0) NOT NULL,
	DateImport DATETIME DEFAULT GETDATE(),
	Quantity INT,
	TypeID BIGINT REFERENCES dbo.ItemType(ID),
	BrandID BIGINT REFERENCES dbo.Brand(ID),
    Picture nvarchar(200),
	[Active]  bit,
    [ShortTitle] nvarchar(200),
	[Describe] nvarchar(max),

	
)
-----------------GIO HANG---------------------------------


go
-----------------------CHI TIET HOA DON-----------------
create table [Order](
	ID BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Orderdate DATETIME DEFAULT GETDATE(),
	Deliverystatus bit,
	Deliverydate DATETIME,
	[Status] bit,
	Totalprice Decimal(18,0),
	CustomerID BIGINT REFERENCES dbo.Customer(ID)
	
)
-----------------Hoa Don---------------------------------------
create table OrderDetail(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	Quantity INT NOT NULL,
	ItemId BIGINT REFERENCES dbo.ITEM(ID),
	OrderID BIGINT REFERENCES dbo.[Order](ID),
	Totalprice Decimal(18,0)
)


go
Create table Payment(
ID BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL, 

Payprices Decimal(18,0),
	OrderID BIGINT REFERENCES dbo.[Order](ID),

)




---------------------CO Ma Khuyen MAi Nhap dung coupon code update lai gia tien trong bill----------------------------


--------------------

GO
CREATE TABLE Feedback
(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	Content NVARCHAR(200) NOT NULL,
	CustomerID BIGINT REFERENCES dbo.Customer(ID)
)
GO
CREATE TABLE ReplyFeedback
(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	Content NVARCHAR(200) NOT NULL,
	FeedBackID BIGINT REFERENCES dbo.FEEDBACK(ID),
	CustomerID BIGINT REFERENCES dbo.Customer(ID)
)


------------------------------------
CREATE TABLE Blogs
(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
		DateImport datetime,
	Title nvarchar(max),
	ShortTitle nvarchar(max),

	Picture nvarchar(200),
	[Describe] nvarchar(max),
	
)




Create table Banner
(
	ID BIGINT IDENTITY(1,1) PRIMARY KEY,
	Picture nvarchar(200),

)


Create table Footer(
ID int identity(1,1) primary key,
Name nvarchar(40),

)
Create table FooterDetail
(
ID int identity(1,1) primary key,
Name nvarchar(40),
FooterID int REFERENCES dbo.Footer(ID),
)
Create table Contact
(
ID int identity(1,1) primary key,
Name nvarchar(40),
EmailAddress varchar(50),
[Subject] nvarchar(100),
[Messages] nvarchar(max),
)
go
Create table About
(
ID int identity(1,1) primary key,
CompanyName nvarchar(40),
EmailAddress varchar(50),
Phone nvarchar(100),
OpenningTime nvarchar(40),
OpenningDay nvarchar(40),
[Messages] nvarchar(max),
)


insert into Menu values(N'Trang chủ','Index')
insert into Menu values(N'Bánh kem','Helmets')
insert into Menu values(N'Đồ uống','RiddingGear')
insert into Menu values(N'Bánh quy','Accsesories')
insert into Menu values(N'Nhãn hiệu ','Brand')
insert into Menu values(N'Tin tức','Blog')
insert into Menu values(N'Liên hệ','Contact')

insert into  ItemType values(N'Bánh 3d','1')
insert into  ItemType values(N'Trà','2')
insert into  ItemType values(N'Coffee','2')
insert into  ItemType values(N'Mouse','1')
insert into  ItemType values(N'Tiramisu','1')
insert into  ItemType values(N'Chocolate','1')
insert into  ItemType values(N'Quy lạt','3')


insert into  Brand values(N'Supreme','5')
insert into  Brand values(N'Convert','5')

insert into Banner values('banner7.jpg')
insert into Banner values('banner8.jpg')


insert into  Item(Name,PurcharsePrice,SellPrice,DateImport,Quantity,TypeID,BrandID,Picture,[Active],[ShortTitle],[Describe]) values(N' Mouse xoài ',
2,9,'2019/4/5',40,1,1
,'banh3.jpg',1,

N'Chất liệu lụa trơn cao cấp thấm hút mồ hôi',

N'Áo Sơ Mi Nam Lịch Lãm với kiểu dáng áo tay dài, cổ bẻ thời thượng cho phái mạnh phong cách thời trang mạnh mẽ, nam tính và lịch lãm.
Đặc biệt, áo được may từ chất liệu vải lụa trơn cao cấp, thấm hút mồ hôi tốt mang lại cảm giác thoải mái, tự tin và dễ chịu.
Gam màu hiện đại dễ dàng phối với nhiều trang phục, mang đến vẻ ngoại hiện đại và lịch lãm cho các chàng trai sành điệu với thiết kế ôm nhẹ cơ thể, giúp tôn lên đường nét săn chắc, gọn gàng và đầy cuốn hút.')



insert into  Item(Name,PurcharsePrice,SellPrice,DateImport,Quantity,TypeID,BrandID,Picture,[Active],[ShortTitle],[Describe]) values(N' Latte',
2,9,'2019/4/5',40,2,2
,'tra2.jpg',1,

N'Chất liệu lụa trơn cao cấp thấm hút mồ hôi',

N'Áo Sơ Mi Nam Lịch Lãm với kiểu dáng áo tay dài, cổ bẻ thời thượng cho phái mạnh phong cách thời trang mạnh mẽ, nam tính và lịch lãm.
Đặc biệt, áo được may từ chất liệu vải lụa trơn cao cấp, thấm hút mồ hôi tốt mang lại cảm giác thoải mái, tự tin và dễ chịu.
Gam màu hiện đại dễ dàng phối với nhiều trang phục, mang đến vẻ ngoại hiện đại và lịch lãm cho các chàng trai sành điệu với thiết kế ôm nhẹ cơ thể, giúp tôn lên đường nét săn chắc, gọn gàng và đầy cuốn hút.')




insert into  Item(Name,PurcharsePrice,SellPrice,DateImport,Quantity,TypeID,BrandID,Picture,[Active],[ShortTitle],[Describe]) values(N' Quy dâu',
2,9,'2019/4/5',40,3,2
,'banh1.jpg',1,

N'Chất liệu lụa trơn cao cấp thấm hút mồ hôi',

N'Áo Sơ Mi Nam Lịch Lãm với kiểu dáng áo tay dài, cổ bẻ thời thượng cho phái mạnh phong cách thời trang mạnh mẽ, nam tính và lịch lãm.
Đặc biệt, áo được may từ chất liệu vải lụa trơn cao cấp, thấm hút mồ hôi tốt mang lại cảm giác thoải mái, tự tin và dễ chịu.
Gam màu hiện đại dễ dàng phối với nhiều trang phục, mang đến vẻ ngoại hiện đại và lịch lãm cho các chàng trai sành điệu với thiết kế ôm nhẹ cơ thể, giúp tôn lên đường nét săn chắc, gọn gàng và đầy cuốn hút.')


insert into  Item(Name,PurcharsePrice,SellPrice,DateImport,Quantity,TypeID,BrandID,Picture,[Active],[ShortTitle],[Describe]) values(N' Trà chanh',
2,9,'2019/4/5',40,2,2
,'tra1.jpg',1,

N'Chất liệu lụa trơn cao cấp thấm hút mồ hôi',

N'Áo Sơ Mi Nam Lịch Lãm với kiểu dáng áo tay dài, cổ bẻ thời thượng cho phái mạnh phong cách thời trang mạnh mẽ, nam tính và lịch lãm.
Đặc biệt, áo được may từ chất liệu vải lụa trơn cao cấp, thấm hút mồ hôi tốt mang lại cảm giác thoải mái, tự tin và dễ chịu.
Gam màu hiện đại dễ dàng phối với nhiều trang phục, mang đến vẻ ngoại hiện đại và lịch lãm cho các chàng trai sành điệu với thiết kế ôm nhẹ cơ thể, giúp tôn lên đường nét săn chắc, gọn gàng và đầy cuốn hút.')


insert into  Item(Name,PurcharsePrice,SellPrice,DateImport,Quantity,TypeID,BrandID,Picture,[Active],[ShortTitle],[Describe]) values(N' Quy vừng',
2,9,'2019/4/5',40,3,2
,'banh2.jpg',1,

N'Chất liệu lụa trơn cao cấp thấm hút mồ hôi',

N'Áo Sơ Mi Nam Lịch Lãm với kiểu dáng áo tay dài, cổ bẻ thời thượng cho phái mạnh phong cách thời trang mạnh mẽ, nam tính và lịch lãm.
Đặc biệt, áo được may từ chất liệu vải lụa trơn cao cấp, thấm hút mồ hôi tốt mang lại cảm giác thoải mái, tự tin và dễ chịu.
Gam màu hiện đại dễ dàng phối với nhiều trang phục, mang đến vẻ ngoại hiện đại và lịch lãm cho các chàng trai sành điệu với thiết kế ôm nhẹ cơ thể, giúp tôn lên đường nét săn chắc, gọn gàng và đầy cuốn hút.')






insert into [Admin] values('Admin','1',N'Nguyen Van Admin','hinh.png')



insert into blogs values('2019/4/5',N'Travel Blogger',N'What does it take to become a Travel Blogger?','inf9.jpg',N'1: Train your writing skills. Travel blogger requires sharing journeys, stories on social networks. In addition to images and videos, the word is an indispensable means of transmission.')














---------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------