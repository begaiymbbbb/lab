--CREATE DATABASE productsdb;

USE productsdb;
GO
/*
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price MONEY NOT NULL
);
CREATE TABLE History 
(
    Id INT IDENTITY PRIMARY KEY,
    ProductId INT NOT NULL,
    Operation NVARCHAR(200) NOT NULL,
    CreateAt DATETIME NOT NULL DEFAULT GETDATE(),
);
//
CREATE TRIGGER productsINSERT
ON Products
AFTER INSERT
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Add product' + ProductName + 'firm' + Manufacturer
FROM INSERTED
INSERT INTO Products (ProductName, Manufacturer, ProductCount, Price)
VALUES('iPhone X', 'Apple', 2, 79900)
SELECT * FROM History
 
//
CREATE TRIGGER products_DELETE
ON Products
AFTER DELETE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'Deleted product' + ProductName + 'firm' + Manufacturer
FROM 
DELETE FROM Products
WHERE Id=2
 
SELECT * FROM History
//
CREATE TRIGGER Products_UPDATE
ON Products
AFTER UPDATE
AS
INSERT INTO History (ProductId, Operation)
SELECT Id, 'updated product' + ProductName + 'firm' + Manufacturer
FROM INSERTED
INSERT INTO Products(ProductName, Manufacturer, ProductCount, Price)
VALUES('C350','Motorola',10,2100)
UPDATE Products SET Manufacturer='Moto'
WHERE Manufacturer='Motorola';
SELECT * FROM History;
---Tasks
--является ли цена товара положительным числом.
CREATE TRIGGER trg_BeforeInsert_Products
ON Products
BEFORE INSERT
AS
BEGIN
IF EXISTS(SELECT * FROM inserted WHERE Price < 0)
BEGIN
RAISERROR('Price cannot be negative number', 16, 1)
ROLLBACK TRANSACTION
END
END
--создать запись в таблице "History", когда товар обновляется.
CREATE TRIGGER trg_AfterUpdate_Products
ON Products
AFTER UPDATE
AS
BEGIN
INSERT INTO History(ProductId, Operation)
SELECT Id, 'Updated ' + ProductName
FROM inserted
END
SELECT * FROM History;
CREATE TABLE ArchivedProducts (
  Id INT PRIMARY KEY,
  ProductName VARCHAR(255),
  Manufacturer VARCHAR(255),
  ProductCount INT,
  Price DECIMAL(10, 2)
);
--перенести удаленные товары в таблицу "ArchivedProducts".
CREATE TRIGGER trg_InsteadOfDelete_Products
ON Products
INSTEAD OF DELETE
AS
BEGIN
INSERT INTO ArchivedProducts(Id, ProductName, Manufacturer, ProductCount, Price)
SELECT Id, ProductName, Manufacturer, ProductCount, Price
FROM deleted
END
*/
