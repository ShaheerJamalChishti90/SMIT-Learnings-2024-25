-- SELECT * FROM production.brands;

SELECT first_name, last_name FROM sales.customers;

--Order By Clause
SELECT product_name, brand_id, category_id FROM production.products ORDER BY brand_id, category_id ASC;

SELECT staff_id, CONCAT(first_name, ' ', last_name) AS staff_name, active FROM sales.staffs ORDER BY staff_id ASC;

SELECT staff_id, CONCAT(first_name, ' ', last_name) AS staff_name, , active FROM sales.staffs  WHERE active = 1 ORDER BY staff_id ASC;

--Where Clause
SELECT 
	*
FROM 
	sales.customers 
WHERE 
	state = 'NY' or state = 'CA';

SELECT  * FROM  sales.customers  WHERE state = 'NY' and city = 'Buffalo';

SELECT product_id, product_name, list_price FROM production.products ORDER BY list_price DESC;


SELECT product_id, product_name, model_year, list_price FROM production.products ORDER BY model_year DESC, list_price DESC;
