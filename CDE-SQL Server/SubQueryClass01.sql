select * from production.products where list_price > (select avg(list_price) from production.products);

select * from sales.customers c where c.city = 'New York';

select * from sales.orders o where o.customer_id in (
select customer_id from sales.customers c where c.city = 'New York');



-- Performing the same sub-query with the 
select o.order_id, o.order_date, c.customer_id
from sales.customers c
inner join 
	sales.orders o
	on o.customer_id = c.customer_id
where c.city = 'New York';


select pc.category_id from production.categories pc where pc.category_name = 'Mountain Bikes' or pc.category_name = 'Road Bikes';

--select pc.category_id from production.categories pc where pc.category_name = 'Mountain Bikes' or pc.category_name = 'Road Bikes';
select 
	product_id, product_name 
from 
	production.products 
where 
	list_price > (
	select avg(pp.list_price) 
	from 
		production.products pp 
	where 
		pp.category_id 
	in (select pc.category_id 
		from 
			production.categories pc 
		where 
			pc.category_name = 'Mountain Bikes' or pc.category_name = 'Road Bikes')
);

--select order_id, order_date, (select max(list_price) from production.products) as 

-- Checking the list price using any/all 
select avg(list_price) from production.products group by brand_id;

select product_name, list_price from production.products where list_price >= all  (
select avg(list_price) from production.products group by brand_id);


-- Exist or Not Exist 
select avg(order_count) from (
	select staff_id, count(order_id)  as order_count from sales.orders group by staff_id) as t;


