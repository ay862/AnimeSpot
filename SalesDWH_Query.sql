Create Database SalesDWH

Create Table Sales
(
SalesID int Primary Key Identity,
ProductID float,
OrderNumer nvarchar(255),
StoreID float,
RepID float,
Sold float,
Revenue2 float,
TransactionTime datetime,
ID nvarchar(255) NULL
)

CREATE TABLE Stores
(
StoreID float Primary Key,
StoreName nvarchar(255) ,
Region nvarchar(255)
)

CREATE TABLE Product(
ProductID float Primary Key,
ProductCode nvarchar(255),
[Description] nvarchar(255),
Category nvarchar(255),
Subcategory nvarchar(255),
Brand nvarchar(255)
)

CREATE TABLE Reps(
RepID float Primary Key,
RepName nvarchar(255)
)

alter table Sales
Add Constraint F_K1 FOREIGN KEY (RepID) REFERENCES Reps(RepID)

alter table Sales 
Add Constraint F_K2 FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)

alter table Sales 
Add Constraint F_K3 FOREIGN KEY (ProductID) REFERENCES Product(ProductID)

EXEC dbo.sp_changedbowner @loginame = N'sa'
