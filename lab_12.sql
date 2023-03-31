--CREATE DATABASE Lab_12;

USE Lab_12;

/*
CREATE TABLE  products (
  product_id int not null primary key identity(1,1),
  title varchar(255),
  created_at datetime
);
 
CREATE TABLE product_options (
  option_id int not null primary key identity(1,1),
  name varchar(255)
);
 
CREATE TABLE product2options (
  product_id int foreign key  references products(product_id) not null,
  option_id int foreign key  references  product_options(option_id) not null,
  value int
INSERT INTO products (title, created_at) VALUES
        ('Cup', '2009-01-17 20:00:00'),
        ('Loffel', '2009-01-18 20:00:00'),
        ('Plate', '2009-01-19 20:00:00');
INSERT INTO product_options ( name) VALUES
        ( 'Weight'),
        ( 'Vol');
INSERT INTO product2options (product_id, option_id, value) VALUES
        (1, 1, 200),
        (1, 2, 250),
        (2, 1, 35),
        (2, 2, 15),
        (3, 1, 310),
        (3, 2, 300),
        (2, 1, 45),
        (2, 2, 25);
		
 SELECT p.*, po1.name 'P1', p2o1.value, po2.name 'P2', p2o2.value    
 
FROM products p      
 
INNER JOIN product2options p2o1 ON p.product_id = p2o1.product_id
INNER JOIN product_options po1  ON po1.option_id = p2o1.option_id
 
INNER JOIN product2options p2o2 ON p.product_id = p2o2.product_id
INNER JOIN product_options po2  ON po2.option_id = p2o2.option_id
 
WHERE p.created_at > '2009-01-17 21:00'
  AND (
  p2o1.option_id = 1 AND p2o1.value = 310
  AND p2o2.option_id = 2 AND p2o2.value = 300
  OR 
  p2o1.option_id = 1 AND p2o1.value = 35
  AND p2o2.option_id = 2 AND p2o2.value = 15          
  OR  
  p2o1.option_id = 1 AND p2o1.value = 45
  AND p2o2.option_id = 2 AND p2o2.value = 25  
  OR  
  p2o1.option_id = 2 AND p2o1.value = 250
  AND p2o2.option_id = 1 AND p2o2.value = 200
  )  
;
*/