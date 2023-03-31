--CREATE DATABASE flower_shop;
USE flower_shop;
GO
/*
CREATE TABLE clients (
  client_id INT NOT NULL PRIMARY KEY identity(1,1),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20)
);
CREATE TABLE orders (
  order_id INT NOT NULL PRIMARY KEY identity(1,1),
  client_id INT,
  order_date DATE,
  order_total DECIMAL(10, 2),
  FOREIGN KEY (client_id) REFERENCES clients(client_id)
);
INSERT INTO clients (first_name, last_name, email, phone_number)
VALUES 
  ('Johny', 'Depp', 'johny766@example.com', '555-6789'),
  ('Bred', 'Pitt', 'bredi@example.com', '555-5693'),
  ('Leo', 'Smith', 'lsmith@example.com', '555-4321'),
  ('Kylie', 'Johnson', 'liejohnson@example.com', '555-8776');
-- Insert data into orders table
INSERT INTO orders (client_id, order_date, order_total)
VALUES
  (1, '2022-03-06', 29.99),
  (1, '2022-03-07', 49.99),
  (2, '2022-03-08', 19.99),
  (3, '2022-03-09', 99.99),
  (4, '2022-03-10', 39.99);
--Вставить данные в таблицу клиентов, если не заполнена фамилия клиента – откат транзакции
BEGIN TRANSACTION
INSERT INTO clients (first_name, last_name, email, phone_number)
VALUES ('Johny', NULL, 'johny766@example.com', '1234567890')
IF @@ERROR <> 0
BEGIN
    ROLLBACK TRANSACTION
    PRINT 'Missing last name'
END
ELSE
BEGIN
    COMMIT TRANSACTION
    PRINT 'Transaction committed successfully'
END
-- declare @a int = 10, @b int = 15, @c  int =0. Если @c >= 0 то вычислить сумму чисел, иначе откат транзакции   
BEGIN TRANSACTION;
DECLARE @a int = 10, @b int = 15, @c int = 0;
IF @c >= 0
BEGIN
  SELECT @a + @b AS SumOfNumbers;
END
ELSE
BEGIN
  ROLLBACK TRANSACTION;
END
COMMIT TRANSACTION;
-- Вставить данные в таблицу заказов, если есть задолженность по предыдущим заказам, откатить транзакцию 
BEGIN TRANSACTION;
DECLARE @clientId int = 1;
DECLARE @orderDate date = '2023-03-30';
DECLARE @orderTotal decimal(10,2) = 100.00;
IF EXISTS (
  SELECT *
  FROM orders
  WHERE client_id = @clientId
  AND order_total > 0
)
BEGIN
  PRINT 'Client has unpaid orders. Rolling back transaction.';
  ROLLBACK TRANSACTION;
END
ELSE
BEGIN
  INSERT INTO orders (client_id, order_date, order_total)
  VALUES (@clientId, @orderDate, @orderTotal);
  
  PRINT 'Order inserted successfully.';
  COMMIT TRANSACTION;
END
*/