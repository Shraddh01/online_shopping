--Creating table & Inserting data--

CREATE TABLE Users(
         user_id INT PRIMARY KEY,
		 name VARCHAR(30),
		 email VARCHAR(30),
		 city VARCHAR(30),
		 created_date date DEFAULT CURRENT_DATE
);

INSERT INTO Users(user_id,name,email,city)
        VALUES (1,'Shraddha','shraddha@gmail.com','Pune'),
		(2,'Shruti','shruti@gmail.com','Hyderbad'),
		(3,'Vanita','vanita@gmail.com','Nagpur'),
		(4,'Pratiksha','pratiksha@gmail.com','Latur');
		
SELECT * FROM Users;

CREATE TABLE Products(
       product_id INT PRIMARY KEY,
		product_name VARCHAR(30),
		category VARCHAR(30),
		price NUMERIC(10,2)
);

 INSERT INTO Products(product_id,product_name,category,price)
         VALUES (101,'Laptop','Electronic',50000),
		         (102,'Dress','Fashion',2000),
                 (103,'Mobile ','Electronic',15000),
                  (104,'Shoes','Fashion',1000);

SELECT * FROM Products;

CREATE TABLE Orders(
      order_id INT PRIMARY KEY,
	  user_id INT,
	  order_date DATE DEFAULT CURRENT_DATE,
	  total_amount NUMERIC (10,2)
);

INSERT INTO Orders(order_id,user_id,total_amount)
      VALUES(11,1,50000),
             (12,2,2000),
			 (13,3,15000),
			 (14,4,1000);
			 
SELECT * FROM Orders;

CREATE TABLE Payments(
        payment_id INT PRIMARY KEY,
         order_id INT ,
		 payment_menthod VARCHAR(30),
		 payment_status VARCHAR(30) ,
		 payment_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO Payments(payment_id,order_id,payment_menthod,payment_status)
VALUES(01,11,'UPI','Completed'),
       (02,12,'CASH','Pending'),
	   (03,13,'UPI','Completed'),
	   (04,14,'CASH','Completed');
	   
SELECT *FROM Payments;

CREATE TABLE Order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT ,
    product_id INT,
    quantity INT,
    price NUMERIC(10,2)
);

INSERT INTO Order_details(order_detail_id,order_id,product_id,quantity,price)
VALUES(1,11,101,1,50000),
       (2,12,102,2,2000),
	   (3,13,103,3,15000),
	   (4,14,104,4,1000);

	SELECT *FROM Order_details;
	
--  FOR JOINS --

--1:Inner join--

SELECT u.user_id,u.name,u.email,u.city,   --1st table info
       o.order_id,o.total_amount         --2nd table info
FROM Users u      --1st table name
INNER JOIN
   Orders o   --2nd table name
ON
u.user_id = o.user_id;  --connections between two tables

--2: Left join--

SELECT u.user_id,u.name,u.email,u.city,   
       o.order_id,o.total_amount         
FROM Users u      
LEFT JOIN
   Orders o   
ON
u.user_id = o.user_id;  

--3: Right join--

SELECT u.user_id,u.name,u.email,u.city,   
       o.order_id,o.total_amount         
FROM Users u      
RIGHT JOIN
   Orders o   
ON
u.user_id = o.user_id;  

--4:Full join--

SELECT u.user_id,u.name,u.email,u.city,   
       o.order_id,o.total_amount         
FROM Users u      
FULL JOIN
   Orders o   
ON
u.user_id = o.user_id;

--5: Cross join--

SELECT u.email,u.city,o.total_amount
FROM Users u
CROSS JOIN 
Orders o;

--6: Self join--

SELECT u1.name as users1, u2.name as user2,u1.city
FROM Users u1 
JOIN Users u2
ON
u1.city = u2.city;
--AND u1.user_id <> u2.user_id; --u1 and u2 is not same 

--Foreign key--
--1.Users-Order--

ALTER TABLE Orders
ADD CONSTRAINT fk_orders_users
FOREIGN KEY (user_id)
REFERENCES Users(user_id);

--2.Order-Order_deatils--

ALTER TABLE Order_details
ADD CONSTRAINT fk_Order_details_order
FOREIGN KEY (order_id)
REFERENCES Orders(order_id);

--3. Order_deatils-Products--

ALTER TABLE Order_details
ADD CONSTRAINT fk_orderdetails_products
FOREIGN KEY (product_id)
REFERENCES Products(product_id);

--4. Order-Payment--

ALTER TABLE Payments
ADD CONSTRAINT fk_order_payment
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

-- Operators--
--1.For AND & OR--

SELECT *FROM Users 
WHERE city = 'Pune' AND name = 'Shraddha';

--2.For Not--

SELECT *FROM Paymentsha
WHERE NOT payment_status='Pending';

--Functions--

SELECT COUNT(*) FROM Users;
SELECT SUM(total_amount) FROM Orders;
SELECT MIN(price) FROM Products;
SELECT UPPER(name) FROM Users;
SELECT LENGTH(product_name) FROM Products;
SELECT CONCAT(name,' - ',city) FROM Users;
SELECT SUBSTRING(email,1,5) FROM Users;





	