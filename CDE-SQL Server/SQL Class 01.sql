-- SELECT * FROM production.brands;

SELECT 
	first_name, last_name 
FROM 
	sales.customers;

--Order By Clause
SELECT product_name, brand_id, category_id FROM production.products ORDER BY brand_id, category_id ASC;

SELECT staff_id, CONCAT(first_name, ' ', last_name) AS staff_name, active FROM sales.staffs ORDER BY staff_id ASC;

SELECT staff_id, CONCAT(first_name, ' ', last_name) AS staff_name, active FROM sales.staffs  WHERE active = 1 ORDER BY staff_id ASC;

SELECT product_id, product_name, list_price FROM production.products ORDER BY list_price DESC;

SELECT product_id, product_name, model_year, list_price FROM production.products ORDER BY model_year DESC, list_price DESC;

SELECT CONCAT(first_name, ' ', last_name) AS Customer_Name FROM sales.customers  ORDER BY LEN(first_name) DESC;

--Where Clause
SELECT 
	*
FROM 
	sales.customers 
WHERE 
	state = 'NY' or state = 'CA';

SELECT  * FROM  sales.customers  WHERE state = 'NY' and city = 'Buffalo';

-- TOP Clause (It is always gonna be use with ORDER BY Clause)
SELECT  TOP 10 product_name, list_price FROM  production.products ORDER BY list_price DESC;

-- AYAN BHAI CLASS QUESTION
SELECT  TOP 500 product_id, quantity FROM  production.stocks ORDER BY quantity ASC;

SELECT  product_id, quantity FROM  production.stocks WHERE quantity < 60 ORDER BY product_id ASC, quantity ASC;

SELECT  product_id, quantity FROM  production.stocks WHERE product_id = 202;

-- AYAN BHAI CLASS QUESTION
SELECT  TOP 10 customer_id, order_id, order_status, order_date FROM  sales.orders ORDER BY order_date DESC;

-- OFFSET AND FETCH ALL Clauses
-- OFFSET: It removes the starting rows defined by the user
-- FETCH NEXT: It Fetch those rows which are defined by the user

SELECT * FROM  sales.orders ORDER BY order_id OFFSET 10 ROWS;
SELECT * FROM  sales.orders ORDER BY order_id OFFSET 10 ROWS FETCH NEXT 1600 ROWS ONLY;

-- Filtering Data: Distinct Clause
SELECT DISTINCT city, state FROM sales.customers ORDER BY city;

SELECT DISTINCT state, city FROM sales.customers;

SELECT DISTINCT phone, CONCAT(first_name, ' ' , last_name) AS customer, city, state FROM sales.customers ORDER BY state ASC;

SELECT DISTINCT phone FROM sales.customers;

-- Between Clause
SELECT product_id, product_name, list_price FROM production.products WHERE list_price BETWEEN 1400 and 1500 ORDER BY list_price;
SELECT product_id, product_name, list_price FROM production.products WHERE list_price BETWEEN 1400 and 1500 ORDER BY product_id;

-- IN + NOT IN Clause
SELECT product_id, product_name, list_price FROM production.products WHERE list_price IN(89.99, 109.99, 159.99) ORDER BY product_id;
SELECT product_id, product_name, list_price FROM production.products WHERE list_price IN (999.99) ORDER BY list_price;
SELECT product_id, product_name, list_price FROM production.products WHERE list_price = 999.99 OR list_price = 599.99 ORDER BY list_price;

SELECT product_id, product_name, list_price FROM production.products WHERE list_price NOT IN (999.99, 209.99, 289.99, 229.99) ORDER BY list_price;
