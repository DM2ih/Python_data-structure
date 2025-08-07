create database project;
use project;



/* q1. Create a table called employees with the following structure
 emp_id (integer, should not be NULL and should be a primary key)
 emp_name (text, should not be NULL)
 age (integer, should have a check constraint to ensure the age is at least 18)
 email (text, should be unique for each employee)
 salary (decimal, with a default value of 30,000).
 Write the SQL query to create the above table with all constraints.*/

CREATE TABLE employees (
    emp_id INTEGER NOT NULL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER CHECK (age >= 18),
    email varchar(100) UNIQUE,
    salary DECIMAL DEFAULT 30000
);

drop table employees;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* q6. You created a products table without constraints as follows:*/
 CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(50),
 price DECIMAL(10, 2));
 
 /*Now, you realise that
 The product_id should be a primary key
 The price should have a default value of 50.00*/
 
 /* answer 6:*/
 ALTER TABLE products
ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id),
ALTER COLUMN price SET DEFAULT 50.00;

select * from products;
drop table products;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* q7. You have two tables:
Write a query to fetch the student_name and class_name for each student using an INNER JOIN*/

-- Create the Students table
CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(255),
    class_id INT
);

-- Insert data into the Students table
INSERT INTO Students (student_id, student_name, class_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101);

-------------------------------------------------------------------

-- Create the Classes table
CREATE TABLE Classes (
    class_id INT,
    class_name VARCHAR(255)
);


-- Insert data into the Classes table
INSERT INTO Classes (class_id, class_name) VALUES
(101, 'Math'),
(102, 'Science'),
(103, 'History');

-- answer 7
SELECT s.student_name, c.class_name
FROM Students s
INNER JOIN Classes c ON s.class_id = c.class_id;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*  q8) Consider the following three tables:
 Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are 
listed even if they are not associated with an order 
Hint: (use INNER JOIN and LEFT JOIN)*/

create table orders(                                                       
order_id int,
order_date date,
customer_id int
);

insert into orders ( order_id , order_date , customer_id)                           
values
(1,"2024-01-01",101),
(2,"2024-01-03",102);

drop table orders;

create table customers(                                                       
customer_id int,
customer_name varchar(40)
);

INSERT INTO customers (customer_id , customer_name)
VALUES
(101, "Alice"),
(102, "Bob");

drop table customers;

create table products(                                                       
product_id int,
product_name varchar(40),
order_id int
);

INSERT INTO products (product_id , product_name, order_id)
VALUES
(1, "laptop",1),
(2, "phone",null);

drop table products;

-- answer 8

SELECT
    O.order_id,
    C.customer_name,
    P.product_name
FROM
    Products AS P
LEFT JOIN
    Orders AS O ON P.order_id = O.order_id
LEFT JOIN
    Customers AS C ON O.customer_id = C.customer_id;
    
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
-- q9)  Given the following tables:
-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function

CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    amount INT
);

INSERT INTO Sales (sale_id, product_id, amount)
VALUES
(1, 101, 500),
(2, 102, 300),
(3, 101, 700);


CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(255)
);

INSERT INTO Products (product_id, product_name)
VALUES
(101, 'Laptop'),
(102, 'Phone');

-- answer 9:

SELECT
    P.product_name,
    SUM(S.amount) AS total_sales_amount
FROM
    Sales AS S
INNER JOIN
    Products AS P ON S.product_id = P.product_id
GROUP BY
    P.product_name;
    
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 /*q10) You are given three tables:
 Write a query to display the order_id, customer_name, and the quantity of products ordered by each 
customer using an INNER JOIN between all three tables.
 Note - The above-mentioned questions don't require any dataset*/
 
 CREATE TABLE Orders (
    order_id INT,
    order_date DATE,
    customer_id INT
);

INSERT INTO Orders (order_id, order_date, customer_id)
VALUES
(1, '2024-01-02', 1),
(2, '2024-01-05', 2);
 
 
 CREATE TABLE Customers (
    customer_id INT,
    customer_name VARCHAR(255)
);

INSERT INTO Customers (customer_id, customer_name)
VALUES
(1, 'Alice'),
(2, 'Bob');

CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO Order_Details (order_id, product_id, quantity)
VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3);

SELECT
    O.order_id,
    C.customer_name,
    OD.quantity
FROM
    Orders AS O
INNER JOIN
    Customers AS C ON O.customer_id = C.customer_id
INNER JOIN
    Order_Details AS OD ON O.order_id = OD.order_id;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

