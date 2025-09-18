--Find categories with a total of more than 10 products.
--Write a query that displays the category_id and the total number of products for each category, 
--but only for those categories that have more than 10 products.

select 
	category_id, 
	count(product_id) as total_products
from 
	production.products p
group by 
	category_id
having
	count(product_id) > 10;


select 
	p.category_id, c.category_name,  
	count(p.product_id) as total_products
from 
	production.products p
join 
	production.categories c 
	on c.category_id = p.category_id
group by 
	p.category_id, c.category_name
having
	count(p.product_id) > 10;


--	Identify customers who have placed at least 5 orders.
--Write a query that returns the customer_id and the total count of orders for customers 
--who have made 5 or more orders.

select
	o.customer_id, count(o.order_id) orders_placed
from 
	sales.orders o
group by 
	o.customer_id 
having 
	count(o.order_id) >= 3;

select
	o.customer_id, concat(c.first_name, ' ', c.last_name) customer_name,count(o.order_id) orders_placed
from 
	sales.orders o
join 
	sales.customers c
	on c.customer_id = o.customer_id
group by 
	o.customer_id, 
	c.first_name, 
	c.last_name
having 
	count(o.order_id) = 2;


--List stores where the total quantity of products in stock is less than 500.
--Write a query that shows the store_id and the sum of quantity for each store, 
--but only for stores where the total quantity is less than 500.

select s.store_id, sum(quantity) stock_qunatity from production.stocks s  group by s.store_id having sum(s.quantity) < 4500;
 
select s.store_id, ss.store_name ,sum(quantity) stock_qunatity from production.stocks s  join sales.stores ss on s.store_id = ss.store_id group by ss.store_name, s.store_id having sum(s.quantity) < 4500;
 
