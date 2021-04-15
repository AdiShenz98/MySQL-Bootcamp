-- Relationships between tables
CREATE DATABASE customers_orders;
-- 1:MANY

-- Creating the Customers Table
USE customers_orders;

CREATE TABLE Customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
    );

CREATE TABLE Orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)
    );
    

DESC Orders;

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
	   ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

-- CROSS JOINS
-- not used much in real world
SELECT * FROM customers,orders;

-- orders placed by Boy George
-- #using subquery
SELECT
	*
FROM
	orders
WHERE 
	customer_id = ( SELECT id
					FROM customers
                    WHERE last_name = 'George');

-- Implicit INNER JOIN

SELECT *
FROM customers, orders
WHERE customers.id = orders.customer_id;

SELECT 
	first_name,
    last_name,
    order_date,
    amount
FROM 
	customers, orders
WHERE 
	customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN

SELECT 
	first_name,
    last_name,
    order_date,
    amount
FROM
	customers 
JOIN -- can also use INNER JOIN
	orders
ON 
	customers.id = orders.customer_id;

-- Biggest spender

SELECT
	first_name,
    last_name,
    SUM(amount) AS total_amount
FROM
	customers
JOIN
	orders
ON 
	customers.id = customer_id
GROUP BY 
	customer_id
ORDER BY
	3 DESC;
    
-- LEFT JOIN

SELECT
	*
FROM
	customers
LEFT JOIN 
	orders
ON 
	customers.id = customer_id;

-- IFNULL

SELECT
	first_name,
    last_name,
    IFNULL(SUM(amount),0) AS Amount_Spent
FROM
	customers
LEFT JOIN 
	orders
ON 
	customers.id = customer_id
GROUP BY	
	customer_id
ORDER BY
	Amount_Spent DESC
;

-- RIGHT JOIN

SELECT
	first_name,
    last_name,
    order_date,
    amount
FROM
	orders
RIGHT JOIN
	customers
ON 
	orders.customer_id = customers.id; 
    
-- ON DELETE CASCADE
-- IF WE HAVE A FOREIGN KEY RELATIONSHIP AND IF WE DELETE THEN ALL RELATED ROWS GETS DELETED

DROP TABLE orders;

CREATE TABLE Orders(
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES Customers(id)
    ON DELETE CASCADE
    );
    
SELECT *
FROM customers;

SELECT * 
FROM orders;

DELETE FROM 
	customers
WHERE
	email = 'george@gmail.com';
    

    