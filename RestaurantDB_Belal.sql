------------------------------------------------------
--------Create Database On Deafault Location
------------------------------------------------------
Use master
Create database RestaurantDB
Go


Use RestaurantDB
Alter database RestaurantDB
modify file(Name=N'RestaurantDB',size=10MB,maxsize=200MB,filegrowth=10%)
GO
Alter database RestaurantDB
modify file(Name=N'RestaurantDB_log',size=9MB,maxsize=100MB,filegrowth=5%)
Go


------------------------------------------------------
--------Create Database On Different Location
------------------------------------------------------

/*USE MASTER
CREATE DATABASE RestaurantDB
ON PRIMARY(NAME=N'RestaurantDB_Data', FILENAME=N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RestaurantDB.mdf', SIZE=10MB, MAXSIZE=200MB, FILEGROWTH=10%)
LOG ON(NAME=N'RestaurantDB_Log', FILENAME=N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RestaurantDB.ldf', SIZE=9MB, MAXSIZE=100MB, FILEGROWTH=5%)
GO*/


--==============================
/*
use master
Drop Database RestaurantDB
Go
*/
--=============================

------------------------------------------------------
-------Create Schema
------------------------------------------------------
CREATE SCHEMA Belal
Go
--------------------------------------------------------

------------------------------------------------------
--------- Create Table 1
------------------------------------------------------
use RestaurantDB
Create Table Belal.Supplier													
(
	SupplierID     int         primary key identity,
	CompanyName    Varchar(30),
	ContactName    varchar(20),
	Phone          Varchar(20),
	[Address]      Varchar(30)
)
Go
-----------------------------------------------------------
---Insert Into Table
-----------------------------------------------------------
Insert Into Belal.Supplier Values  ('Admiral Craft','Zahed Hasan','01815716388','CTG'),
								('Amana Group','Kamrul Hasan','01739563664','Cumilla'),
								('Akers Industries','Belal Hasan','01932175628','Dhaka'),
								('American Dish Service','Kamrul','01790420080','Sylhet'),
								('Axis','Kamrul','01790420080','Sylhet'),
								('Bakers Pride','Jashim','01790420080','Jessore'),
								('Barkel','Helal','01839536645','Gazipur'),
								('Brown Papers Goods','Rashed','01932145628','Sylhet'),
								('Magic kitchen','Awal Khan','01790420080','Comilla'),
								('Chef Master','Raju','01790420080','Ctg'),
								('Fisher Company','Rahim','01932175682','Khulna')

GO



--==========================================================================
--Select * From Belal.Supplier;
--Drop Table Belal.Supplier;
--Truncate Table Belal.Supplier
--Go
--==========================================================================

------------------------------------------------------
-----------Create Table 2
------------------------------------------------------
use RestaurantDB
Create Table Belal.Product													
(
	ProductID      int          primary key identity,
	ProductName    Varchar(30)   Not Null,
	Unit		   Varchar(10)
	
)
Go

-------------------------------------------------------------------------
----------Insert Into Table
-------------------------------------------------------------------------
Insert Into Belal.Product Values   ('Rice','Kg'),
								   ('Chicken','Kg'),
								   ('Spices','Kg'),
								   ('Vegetables','Kg'),
								   ('Chilli','Kg'),
								   ('Sunflower Oil','Lt'),
								   ('Milk','Lt'),
								   ('Onion','Kg'),
								   ('Garlic','Kg'),
								   ('Lemon','Pcs'),
								   ('Sugar','Kg'),
								   ('Cumin','Kg'),
								   ('Fresh Water','Case'),
								   ('Cool Drink','Case'),
								   ('Cucumber','Kg'),
								   ('Mashroom','Kg'),
								   ('Peppers','Kg'),
								   ('Meat','Kg'),
								   ('Juice','Case'),
								   ('Eggs','Pcs')
GO





--==========================================================================
--Select * From Belal.Product;
--Drop Table Belal.Product;
--Truncate Table Belal.Product
--Go
--===========================================================================

------------------------------------------------------
-----------Create Table 3
------------------------------------------------------
use RestaurantDB
Create Table Belal.Department
(
DeptID int primary key identity,
DeptName Varchar(20)
)
Go
---------------------------------------------------------------
---------Insert Into Table
---------------------------------------------------------------
Insert Into Belal.Department Values ('Administration'),
							  ('Reception'),
							  ('Kitchen'),
							  ('Acounts'),
							  ('Store'),
							  ('Security'),
							  ('Pentry'),
							  ('ManageMent'),
							  ('Wait'),
							  ('Labour')
Go
--==========================================================================
--Select * From Belal.Department;
--Drop Table Belal.Department;
--Truncate Table Belal.Department;
--==========================================================================
------------------------------------------------------
----------------Create Table 4
------------------------------------------------------
use RestaurantDB
create table Belal.Employee
(
EmployeeID int primary key identity,
[Name] varchar(20) Not Null,
DeptID int Foreign key References Belal.Department(DeptID),
Sex Varchar(10),
Designation varchar (20) Not Null,
Salary money,
BirthDate Date,
JoiningDate date,
Age As (Datediff(Year,BirthDate,GetDate())),
Phone varchar (20),
[Address] varchar (50),
IsActive bit
)
Go
-------------------------------------------------------
-----------------------Insert Into Table
-------------------------------------------------------
Insert Into Belal.Employee Values ('Monirul Islam',1,'Male','Admin',50000,'01/05/1990','01/25/2011','01815716388','Ctg',1),
                                    ('Hafijul Islam',1,'Male','Admin',52000,'01/05/1993','01/25/2009','01815716389','Comilla',0),
                                    ('Belal Hossain',1,'Male','Admin',55000,'01/05/1991','01/25/2008','01815716388','Dhaka',1),
                                    ('Riduan Islam',2,'Male','Receptionist',20000,'01/05/1991','01/25/2021','01815716388','Ctg',0),
                                    ('Monjurul Alam',2,'Male','Relationship Officer',30000,'01/05/1994','01/25/2013','01715716388','Dhaka',1),
                                    ('Azim Mahmud',3,'Male','Head Cashier',50000,'01/05/1980','01/25/2007','01815716388','Khulna',0),
                                    ('Nasir Hossain',3,'Male','Assist Cashier',40000,'01/05/1991','01/25/2011','01915716388','Chadpur',1),
                                    ('Naznin Sultana',2,'Female','Receptionist',20000,'01/05/1992','01/25/2011','01815716388','Jessore',0),
                                    ('Taslima Begum',2,'Female','Receptionist',20000,'01/05/1993','01/25/2011','01815716388','Barishal',1),
                                    ('Abdus Salam',5,'Male','SuperVisor',30000,'01/05/1991','01/25/2011','01815716388','Ctg',1),
                                    ('Mamun Bhuiyan',5,'Male','Store Manager',40000,'01/05/1985','01/25/2011','01715716388','Ctg',0),
                                    ('Mehedi Hasan',6,'Male','Pentry men',30000,'01/05/1989','01/25/2011','01815716388','Cumilla',1),
                                    ('Khasru Noman',6,'Male','Head pentry men',35000,'01/05/1992','01/25/2011','01815716388','Ctg',1),
                                    ('Faisal Abir',7,'Male','Discipline',20000,'01/05/1991','01/25/2011','01815716389','Ctg',0),
                                    ('Abdul Kaium',7,'Male','Manager',55000,'01/05/1993','01/25/2011','01815716388','Dhaka',1),
                                    ('Mahmudur Rahman',8,'Male','Senior Waiter',25000,'01/05/1997','01/25/2011','01815716388','Ctg',0),
                                    ('Zunaed Zamshed',8,'Male','Waiter',20000,'01/05/1991','01/25/2011','01815716388','Gazipur',1),
                                    ('Hasan Zamil',9,'Male','Waiter',20000,'01/05/1995','01/25/2011','01815716390','Ctg',1),
                                    ('Nilufar Zaman',9,'Male','Senior Waiter',25000,'01/05/1991','01/25/2015','01915716388','Ctg',1),
                                    ('Rashid Latif',10,'Male','Head Cleaner',15000,'01/05/1993','01/25/2011','01515716388','Nasirnogor',1),
                                    ('Jahid Sardar',10,'Male','Junior Cleaner',10000,'01/05/1992','01/25/2014','01815716388','Ctg',0),
                                    ('Nowrin Jahan',2,'Female','Relationship officer',40000,'01/05/1992','01/25/2011','01815716388','Pavna',1),
                                    ('Tajul Islam',5,'Male','Product Buyer',45000,'01/05/1994','01/25/2012','01815716388','Monshigong',1)
Go


--==========================================================================
--Select * From Belal.Employee;
--Drop Table Belal.Employee;
--Truncate Table Belal.Employee;
--==========================================================================

------------------------------------------------------
----------------Create Table 5
------------------------------------------------------
use RestaurantDB
Create Table Belal.Purchase
(
	PurchaseID int,
	SupplierID int Foreign key References Belal.Supplier(SupplierID),
	ProductID int Foreign key References Belal.Product(ProductID),
	EmployeeID int Foreign Key references Belal.Employee(EmployeeID),
	Quantity int,
	UnitPrice Money,
	TotalPrice AS (Quantity*UnitPrice)
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------

Insert into Belal.Purchase Values (1,1,1,10,5000,50),
                                    (2,2,2,11,3000,130),
									(3,2,2,10,5000,130),
									(4,3,3,10,100,150),
									(5,3,3,11,200,150),
									(6,4,4,11,300,20),
									(7,5,5,11,100,120),
									(8,5,6,10,200,70),
									(9,5,4,10,200,20),
									(10,6,6,10,100,70),
									(11,6,1,10,100,50),
									(12,7,7,11,200,50),
									(13,7,8,11,500,30),
									(14,8,9,10,500,70),
									(15,1,10,10,300,5)
Go

--							

--==========================================================================
--Select * From Purchase;
--Drop Table Purchase;
--Truncate Table Purchase;
--==========================================================================

------------------------------------------------------
----------------Create Table 6
------------------------------------------------------
use RestaurantDB
Create Table Belal.StockInfo
(
	StockID int primary key identity,
	ProductID int Foreign key References Belal.Product(ProductID),
	AvailableQTY int
)
Go

--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------

Insert Into Belal.StockInfo Values      (1,500),
										 (2,100),
										 (3,200),
										 (4,300),
										(5,140),
										(6,110),
										(7,180),
										(8,250),
										(9,100),
										(10,500),
										(11,200),
										(12,400),
										(13,500),
										(14,100),
										(15,200)

Go
							  

--==========================================================================
/*Select * From StockInfo;
Drop Table StockInfo;
Truncate Table StockInfo;*/
--===========================================================================

------------------------------------------------------
----------------Create Table 7
------------------------------------------------------
use RestaurantDB
Create Table Belal.PurchaseInvoice
(
InvoiceID int,
PurchaseID int,
InvoiceDate DateTime
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------
Insert Into Belal.PurchaseInvoice Values (1,1,'01/02/2017'),
										(1,2,'01/05/2017'),
										(2,3,'01/25/2018'),
										(3,4,'01/02/2012'),
										(4,4,'01/02/2014'),
										(6,4,'01/02/2012'),
										(5,2,'01/02/2012'),
										(7,7,'01/02/2014'),
										(8,7,'01/02/2014'),
										(9,9,'01/02/2011')
Go

--============================================================
--Select * From PurchaseInvoice;
--Drop Table PurchaseInvoice;
--Truncate Table PurchaseInvoice;
--============================================================

------------------------------------------------------
----------------Create Table 8
------------------------------------------------------
use RestaurantDB
Create Table Belal.RestaurantTable
(
	RTableID int primary key identity,
	TableNo Varchar(20)
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------
Insert Into Belal.RestaurantTable Values      ('Table 1'),
											   ('Table 2'),
											   ('Table 3'),
											   ('Table 4'),
											   ('Table 5'),
											   ('Table 6'),
											   ('Table 7'),
											   ('Table 8'),
											   ('Table 9'),
											   ('Table 10'),
											   ('Table 11'),
											   ('Table 12'),
											   ('Table 13'),
											   ('Table 14'),
											   ('Table 15'),
											   ('Table 16'),
											   ('Table 17'),
											   ('Table 18'),
											   ('Table 19'),
											   ('Table 20')
Go

--==========================================================================
--Select * From RestaurantTable;
--Drop Table RestaurantTable;
--Truncate Table RestaurantTable;
--==========================================================================

------------------------------------------------------
----------------Create Table 9
------------------------------------------------------
use RestaurantDB
create table Belal.Customers
(
  CustomerID int primary key identity,
  FirstName varchar (20),
  LastName varchar (20),
  ContactNumber varchar (20),
  [Address] varchar (50)
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------
Insert Into Belal.Customers Values      ('Belal','Hossain','01739536645','Cumilla'),
										('Monju','Hasan','01739536645','MirSharai'),
										('Azim','Bhuiyan','01739536645','Ctg'),
										('Helal','Hossain','01739536645','Cumilla'),
										('Kamal','Hasan','01739536645','Dhaka'),
										('Mamun','Bhuiyan','01739536645','Ctg'),
										('Helal','Uddin','01739536645','Sylhet'),
										('Nasir','Hasan','01739536645','Rajshahi'),
										('Belal','Bhuiyan','01739536645','Ctg'),
										('Helal','Hasan','01739536645','Cumilla'),
										('Hafij','Hasan','01539536645','MaymonSing'),
										('Kamal','Bhuiyan','01739536645','Ctg'),
										('Ahsan','Hossain','01819536645','Cumilla'),
						                ('Maimuna','Hasan','01739536645','Dhaka'),
										('Kalam','Bhuiyan','01739536645','Ctg'),
										('Anjuman','Hossain','01739536644','Cumilla')
GO
--==========================================================================
/*Select * From Belal.Customers;
Drop Table Belal.Customers;
Truncate Table Belal.Customer;*/
--=========================================================================


------------------------------------------------------
----------------Create Table 10
------------------------------------------------------
use RestaurantDB
create table Belal.Category
(
	CategoryID int Primary key identity,
	CategoryName Varchar (30) Not Null
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------

Insert Into Belal.Category Values   ('Chinese Food'),
									('Indian Food'),
									('Thai Food'),
									('Bangla Food'),
									('Afghani Food'),
									('Cool Drinks'),
									('Hot & Spicey'),
									('Dry Food'),
									('Family Pack'),
									('Party meal'),
									('BirthDay Special'),
									('Snacks')

Go


--==========================================================================
--Select * From Category;
--Drop Table Category;
--Truncate Table Category;
--===========================================================================

------------------------------------------------------------
----------------Create Table 11
-------------------------------------------------------------
use RestaurantDB
create table Belal.FoodItems
(
  ItemID int primary key identity,
  CategoryID int Foreign key References Belal.Category(CategoryID),
  ItemName varchar (30),
  Picture Image,
  Price money,
  IsActive bit
)
Go

--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------

Insert Into Belal.FoodItems Values  (1,'Chicken Masala','D:\R38_Belal Hossain\1245968',320,1),
									(1,'Beef Byranee','D:\R38_Belal Hossain\1245968',350,1),
									(2,'Hilsa Fish','D:\R38_Belal Hossain\1245968',520,1),
									(2,'Hilsa Fish','D:\R38_Belal Hossain\1245968',520,1),
									(2,'Mola Fish','D:\R38_Belal Hossain\1245968',220,1),
									(4,'Hilsa Fish','D:\R38_Belal Hossain\1245968',220,1),
									(2,'Kural Fish','D:\R38_Belal Hossain\1245968',220,1),
									(2,'Kaski Fish','D:\R38_Belal Hossain\1245968',320,1),
									(5,'Chiken soup','D:\R38_Belal Hossain\1245968',120,1),
									(4,'Chiken Mutton','D:\R38_Belal Hossain\1245968',520,0),
									(5,'Beef','D:\R38_Belal Hossain\1245968',420,1),
									(6,'Chicken jal fry','D:\R38_Belal Hossain\1245968',320,1),
									(7,'Chicken Roast','D:\R38_Belal Hossain\1245968',120,0),
									(8,'Plain Rice','D:\R38_Belal Hossain\1245968',520,1),
									(5,'Chicken Byranee','D:\R38_Belal Hossain\1245968',220,1),
									(5,'Borhani','D:\R38_Belal Hossain\1245968',210,1),
									(6,'Fanta','D:\R38_Belal Hossain\1245968',510,0),
									(1,'7Up','D:\R38_Belal Hossain\1245968',100,1),
									(3,'Coffee','D:\R38_Belal Hossain\1245968',220,0),
									(7,'Tea','D:\R38_Belal Hossain\1245968',820,1)

GO

--==========================================================================
--Select * From Belal.FoodItems;
--Drop Table Belal.FoodItems;
--Truncate Table Belal.FoodItems;
--==========================================================================

------------------------------------------------------------
----------------Create Table 12
-------------------------------------------------------------
use RestaurantDB
Create Table Belal.[Order]
(
	OrderID int,
	CustomerID int foreign key references Belal.Customers(CustomerID),
	EmployeeID int foreign key references Belal.Employee(EmployeeID),
	RTableID int foreign key references Belal.RestaurantTable (RTableID),
	ItemID int Foreign key references Belal.FoodItems(ItemID),
	OrderDate date,
	Quantity int,
	UnitPrice money,
	TotalPrice As (UnitPrice*Quantity)
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------
Insert Into Belal.[Order] Values( 1,1,16,1,2,Getdate(),5,50),
								( 2,2,16,1,5,Getdate(),10,120),
								( 3,3,17,5,7,Getdate(),1,150),
								( 3,4,17,10,2,Getdate(),8,210),
								( 5,5,16,15,8,Getdate(),3,140),
								( 6,6,18,14,15,Getdate(),8,100),
								( 7,7,18,4,8,Getdate(),3,20),
								( 8,8,19,5,1,Getdate(),4,140),
								( 1,9,19,5,5,Getdate(),2,120),
								( 8,10,17,6,9,Getdate(),10,200)

Go


--==========================================================================
--Select * From Belal.[Order];
--Drop Table Belal.[Order];
--Truncate Table Belal.[Order];
--=========================================================================

------------------------------------------------------------
----------------Create Table 13
-------------------------------------------------------------
use RestaurantDB
Create Table Belal.Invoice
(
InvoiceID int,
OrderID int
)
Go
--------------------------------------------------------
-------------Insert Into Table
--------------------------------------------------------
Insert Into Belal.Invoice Values( 1, 1),
								( 2, 2),
								( 2, 3),
								( 2, 4),
								( 3, 6),
								( 4, 7),
								( 5, 8),
								( 5, 9),
								( 7, 10),
								( 8, 11),
								( 9, 12),
								( 10, 13),
								( 11, 14),
								( 12, 15)
GO


--==========================================================================
/*Select * From Belal.Invoice;
Drop Table Belal.Invoice;
Truncate Table Belal.Invoice;*/
--==========================================================================



-----Creating INDEX


 --Create Clustered Index IX_PurInvoiceClus On Belal.PurchaseInvoice(InvoiceID)
 --Create NonClustered Index IX_InvoiceNONClus On Belal.Invoice(InvoiceID)

--=====================================================
--========================Try Catch On Customer Table
--=====================================================
Select * From Belal.Customers
Go
---------------------------------------------------------------
Create PROC sp_InsertCustomers

@firstname				varchar(30) ,
@Lastname		varchar(25) ,
@Contactnumber			Varchar(20),
@Address             Varchar(20),
@message			varchar(60)		output --For Something Out Message(out parameter)
as
BEGIN
	SET NOCOUNT ON
	BEGIN	TRY
		BEGIN TRAN
			INSERT INTO Belal.Customers(FirstName,LastName,ContactNumber,Address)
			VALUES(@firstname,@Lastname,@Contactnumber,@Address)
			SET @message='Execllent! You Inserted Data Successfully!!!'
		COMMIT TRAN -- Permanently Stored
	END TRY
		
	BEGIN	CATCH
		ROLLBACK TRAN -- RollBack Data From The Table
		PRINT 'Sorry You are passing something Wrong!!!!'
	END CATCH
END
GO
---------------------------------------------------------
------Qurey
Declare @message Varchar(60)
Exec sp_InsertCustomers 'Raju','Bhuiyan','01815716388','Rangamati', @message output
Print @message
GO

---------------------UDF-----------------------------------
--==========================================================
-------Scaler Function Total Salary of Employee Table-4
--==========================================================


/*Create Function Fn_ScalerTotalSalary
 (
		@Salary Varchar(20)
	)
	Returns Money
	As 
	Begin
	Declare @total int
    Select @total= Sum(Salary) From Belal.Employee
			
        Return @total
		End

------------------------------------------------------------
Select dbo.Fn_ScalerTotalSalary ('Salary') AS TotalSalary
Go*/
------------------------------------------------------------

--==========================================================
-------Tabular Function Total Salary of Employee Table-4
--==========================================================


Create Function Fn_TabularCtgEmployee
(
	@City varchar(20)
)
Returns Table
As
  Return
  Select Name, Designation, Salary,Address From Belal.Employee 
  Where Address=@City
  Go


  ---==========================================================
  Select * From dbo.Fn_TabularCtgEmployee('Dhaka')
  Go
  --===========================================================


--=========================================================
---------CREATING View on EmployeeTable-4
--=========================================================

Select * From Belal.Employee
GO
----------------------------------
Create View VW_CtgEmployee

AS
Select Name,Designation,Salary,Address
From Belal.Employee
Where Address='Ctg'
Go
------------------------
--Drop View VW_CtgEmployee
--Go
-----------------------------
Select * From VW_CtgEmployee
GO
--------------------------------
Insert into VW_CtgEmployee  Values ('Rashida','Receptionist',22000,'Cumilla')
Go
------===================================================================================
Create View VW_Employee------view With encryption
With Encryption
AS
Select *
From Belal.Employee
Go
--------------------
Exec Sp_helpText VW_Employee
Go
-----------------------------------

---------------------View With SchemaBinding
Create View VW_Order_CustomersTable
With SchemaBinding
AS
Select C.CustomerID,o.OrderDate,c.FirstName,c.LastName,c.ContactNumber,o.TotalPrice,c.Address
From Belal.Customers c
Full Join Belal.[Order] o
On c.CustomerID=o.CustomerID
Where o.TotalPrice<>0
Go
---------------------------------------
 /*   Alter Table Belal.Customers ----We Can't Drop This becoz of Schemabinding Between Two Tables
Drop Column FirstName
Go   */
-----------------------------
---=============================================================================
--==================Six Clause in One Statement(Select, From, Where , Group By , Having , Order By) 
  Select Address,Count(CustomerID) AS RegionCustomers
  From Belal.Customers 
  Where CustomerID <20
  Group By Address
  Having Count(CustomerID)>2
  Order By Address Desc

  ---------------------------------------------------------------------------------------------
---=========================Subquery 
  Select Address,Count(CustomerID) AS RegionCustomers
  From Belal.Customers 
  Where CustomerID >(Select CustomerID From Belal.Customers Where CustomerID=2)---------SubQuery
  Group By Address
  Having Count(CustomerID)>2
  Order By Address Desc


  --====================================Derived Table 
  Select Address,TotalCustomers
From	(Select Address,count(*) as TotalCustomers
		From Belal.Customers
		Group By Address) AS TotalCustomersCount  ------Derived Table
Where TotalCustomers>=2
Order By Address Desc
 ----------------------------------------------------------------------------------------

 --========================================Derived Table With Join

Select * From Belal.Department
Select * From Belal.Employee
--------------------------------------------------------------------
Select DeptName,TotalEmployees
From		(
			    Select d.DeptName,d.DeptID, Count(*) As TotalEmployees From Belal.Employee e
				Join Belal.Department d on d.DeptID=e.DeptID
				Group By DeptName,d.DeptID
			)
			AS TotalEmployeeCount

Where TotalEmployees>=2
-------------------------------------------------------------------------------------------

----==================================================================================================
---=======Join on Customers Table-8 And Order Table-12(Left+Right+Inner+Full+Cross+Self)
--====================================================================================================

Select * From Belal.Customers
Select * From Belal.[Order]
-----------------------------------------------------------------------------------------------------
------Inner Join

Select C.CustomerID,o.OrderDate,c.FirstName,c.LastName,c.ContactNumber,o.TotalPrice,c.Address
From Belal.Customers c
Join Belal.[Order] o
On c.CustomerID=o.CustomerID
Order By c.FirstName,o.TotalPrice

-------Left Join
Select C.CustomerID,o.OrderDate,c.FirstName,c.LastName,c.ContactNumber,o.TotalPrice,c.Address
From Belal.Customers c
Left Join Belal.[Order] o
On c.CustomerID=o.CustomerID


--------Right Join
Select C.CustomerID,o.OrderDate,c.FirstName,c.LastName,c.ContactNumber,o.TotalPrice,c.Address
From Belal.Customers c
Right Join Belal.[Order] o
On c.CustomerID=o.CustomerID

---------------Full Join 
Select C.CustomerID,o.OrderDate,c.FirstName,c.LastName,c.ContactNumber,o.TotalPrice,c.Address
From Belal.Customers c
Full Join Belal.[Order] o
On c.CustomerID=o.CustomerID
Where o.TotalPrice<>0

----------------Cross Join
Select C.CustomerID,c.FirstName,c.LastName,o.TotalPrice,c.Address
From Belal.Customers c
Cross Join Belal.[Order] o
Where TotalPrice<>0


--------------------------Self Join On Customers Table-8

Select A.CustomerID,A.FirstName,A.LastName,B.Address
From Belal.Customers A
Join Belal.Customers B
On  A.CustomerID=B.CustomerID
Where B.Address Not IN ('Ctg') And A.CustomerID>10
Go

---------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------
--------(((Table-9 Customers Store Procedure))))
---------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
---=====Insert,Update,Delete Values With Store Procedure ON Customers Table
-------------------------------------------------------------------------------------------------							
---====Insert Into Single Table
Create Procedure SPInsertIntoCustomers
 ( @FirstName varchar (20),
  @LastName varchar (20),
  @ContactNumber varchar (20),
  @Address varchar (50))
  As
		Begin
		Insert Into Belal.Customers (FirstName,LastName,ContactNumber,Address) 
		Values (@FirstName,@LastName,@ContactNumber, @Address)
		Select * From Belal.Customers
		End
  Go
  	---===============================================================
	Exec SPInsertIntoCustomers'Muhammad','Hossain','01719516388','Dhaka'
	GO	
	---=================================================================

	--=====Update
Create Procedure SPUpdateCustomers
 (
 @CustomerID int,
 @FirstName varchar (20),
  @LastName varchar (20),
  @ContactNumber varchar (20),
  @Address varchar (50))
  As                                                               

  Begin
  Set NoCount ON
   Update Belal.Customers
   Set FirstName=@FirstName,
   LastName=@LastName,
  ContactNumber=@ContactNumber,
  Address=@Address
  Where CustomerID=@CustomerID
  End
  Go
--======================================================================
Exec SPUpdateCustomers 19,'Mehedi','Hasan','01932175628','Rangpur'
GO
--=======================================================================
--===Delete 
	Create Procedure SPDelereCustomers
 (
 @CustomerID int
 )
  As
Begin
Delete From Belal.Customers Where CustomerID=@CustomerID
Select * From Belal.Customers
End
Go

--==============================================
Exec SPDelereCustomers 18
Go
--==============================================
			

--==================================================================================================
/* Insert Into Multiple Table (Table-9 Customers Table-8RestaurantTable)With Store Procedure */
---================================================================================================
Create Procedure Sp_InsertCustomersAndRestaurantTable
@FirstName Varchar(20),
@LastName Varchar(20),
@ContactNumber Varchar(20),
@Address Varchar (20),
@TableNo Varchar(10)
AS
Begin
Insert Into Belal.Customers Values(@FirstName,@LastName,@ContactNumber,@Address);
Insert Into Belal.RestaurantTable Values (@TableNo);
End
GO

Exec Sp_InsertCustomersAndRestaurantTable 'Robi','Bopara','01932175628','Brahmanpara','Table 22'
Go


--Select * From Belal.Customers
--Select * From Belal.RestaurantTable
--================================================================================================================				

---------(((Table 5 After Trigger On Purchase Table)))))-------------
Use RestaurantDB
Create Table Belal.AuditPurchase
(
 PurchaseID int,
 ProductID int,
 EmployeeID int,
 AuditAction Varchar(50),
 ActionTime Date
)
Go

------Insert Trigger

Create Trigger Trigger_AfterInsert on Belal.Purchase 
For Insert
as

Declare @purchaseID int,@ProductID int,@employeeID int,@auditaction Varchar(50),@actiontime date;
Select @purchaseID=i.purchaseid     From inserted i;
Select @productID=i.productid     From inserted i;
Select @employeeID=i.employeeid     From inserted i;
set @auditaction= 'After Data insert Trigger Fired!!!!!'
Insert into Belal.AuditPurchase(PurchaseID,ProductID,EmployeeID,AuditAction,ActionTime) Values (@purchaseID,@ProductID,@employeeID,@auditaction,GETDATE());
print 'You Are Effected on Trigger!!!!!'
GO


Insert into Belal.Purchase Values (2,5,6,12,150,70)
Go

--Drop Trigger Belal.Trigger_AfterInsert

--Select * From Belal.Purchase;
--Select * From Belal.AuditPurchase;

---------------------------------------------------------------------------------------------------------------------------

--Drop Trigger Belal.Trigger_AfterInsert
--GO
---------------------------------------------------------------------------------------------------------------------------
----------Update Trigger

Create Trigger Trigger_AfterUpdate on Belal.Purchase 
For Update
as

Declare @purchaseID int,@ProductID int,@employeeID int,@auditaction Varchar(50),@actiontime date;
Select @purchaseID=i.purchaseid     From inserted i;
Select @productID=i.productid     From inserted i;
Select @employeeID=i.employeeid     From inserted i;
 If UPDATE (Quantity)
set @auditaction= 'After Data UPDATE Trigger Fired!!!!!'

If UPDATE (UnitPrice)
set @auditaction= 'After Data UPDATE Trigger Fired!!!!!'

If UPDATE (employeeID)
set @auditaction= 'After Data UPDATE Trigger Fired!!!!!'

Insert into Belal.AuditPurchase(PurchaseID,ProductID,EmployeeID,AuditAction,ActionTime) Values (@purchaseID,@ProductID,@employeeID,@auditaction,GETDATE());
print 'You Are Effected on Trigger Bcoz of Updating!!!!!'
GO


--Drop Trigger Belal.Trigger_AfterUpdate
--GO

-------------------------------------------------------------------------------
Update Belal.Purchase Set Quantity= 500,EmployeeID=15 Where PurchaseID=1
Go
-------------------------------------------------------------------------------
--Select * From Belal.Purchase;
--Select * From Belal.AuditPurchase;
--Go
----------------------------------------------------------------------------
--------Delete Trigger


Create Trigger Trigger_AfterDelete on Belal.Purchase  
For Delete
AS
Declare 
@purchaseID int,@ProductID int,@employeeID int,@auditaction Varchar(50),@actiontime date;
Select @purchaseID=d.purchaseid     From deleted d;
Select @productID=d.productid     From deleted d;
Select @employeeID=d.employeeid     From deleted d;
set @auditaction='Trigger Fired After Delete';

Insert into Belal.AuditPurchase(PurchaseID,ProductID,EmployeeID,AuditAction,ActionTime) Values (@purchaseID,@ProductID,@employeeID,@auditaction,GETDATE());
Print 'You Are Fall in Trigger On Current Action'
go


--Drop Trigger Belal.Trigger_AfterDelete
--GO
------------------------------------------------------------------------------------------------
--Delete From Belal.Purchase Where PurchaseID=1
--Go
------------------------------------------------------------------------------------------------

--Select * From Belal.Purchase;
--Select * From Belal.AuditPurchase;
--Go

-----------------------------------------------------------------------------------------------

--------Instead of Insert Trigger On purchase Table

Create Trigger Trigger_InsteadofInsert on Belal.Purchase  
Instead of Insert
AS
Declare 
@purchaseID int,@supplierID int,@ProductID int,@employeeID int,@quantity int,@unitprice int,@auditaction Varchar(50),@actiontime date;
Select @purchaseID=i.purchaseid     From inserted i;
Select @supplierID=i.supplierid     From inserted i;
Select @productID=i.productid     From inserted i;
Select @quantity=i.quantity       From inserted i;
Select @unitprice=i.unitprice     From inserted i;
Select @employeeID=i.employeeid     From inserted i;
set @auditaction='Instead of Insert Trigger Fired(Because of Trying)';

Begin
	Begin Transaction
	Set Nocount On
	If (@quantity>=100)
	Begin 						
		Begin Tran
			Raiserror('NO Permission',16,1);			
			RollBack Transaction;
			Insert into Belal.AuditPurchase(PurchaseID,ProductID,EmployeeID,AuditAction,ActionTime) 
			Values (@purchaseID,@ProductID,@employeeID,@auditaction,GetDate());
			Print 'You Are Already On Track (Instead of Trigger)'
		Commit Tran
 End
	Else
		Begin 
			Insert Into Belal.Purchase(PurchaseID,SupplierID,ProductID,EmployeeID,Quantity,UnitPrice) 
			Values (@purchaseID,@supplierID,@ProductID,@employeeID,@quantity,@unitprice);

			Insert into Belal.AuditPurchase(PurchaseID,ProductID,EmployeeID,AuditAction,ActionTime) 
			Values (@purchaseID,@ProductID,@employeeID,@auditaction,GetDate());
			Print 'You Are Already On Track (Instead of Trigger)'

		End
	Commit Transaction		
End
GO

--Drop Trigger Belal.Trigger_InsteadofInsert
--GO
----------------------------------------------------------------------------------------------

Insert Into Belal.Purchase Values (1,6,7,11,500,70)                                
Go

Insert Into Belal.Purchase Values (2,5,7,11,50,50)                                 
Go
----------------------------------------------------------------------------------------------

Select * From Belal.Purchase;
Select * From Belal.AuditPurchase;

Truncate Table Belal.Purchase;
Truncate Table Belal.AuditPurchase;


