SELECT
    customer_id,
    YEAR (order_date) order_year
FROM
    sales.orders
WHERE
    customer_id IN (1, 2)
ORDER BY
    customer_id;


select customer_id, year(order_date) from sales.orders where customer_id in (1, 2) group by customer_id, year(order_date) order by customer_id;

select customer_id, year(order_date) order_year, count(order_id) ordered_placed from sales.orders where customer_id in (1, 2) group by customer_id, year(order_date) order by customer_id;

select  
    c.city, 
    c.state,
    count(c.customer_id) customer_count 
from 
    sales.customers c 
group by 
    c.state,
    c.city 
order by 
    c.city,
    c.state;


select c.state, count(c.customer_id) total_cities from sales.customers c group by c.state;


select o.customer_id, year(o.order_date) from sales.orders o where o.customer_id in (1, 2) order by o.customer_id;

select 
    o.customer_id, year(o.order_date) order_year, count(o.order_id) order_placed
from 
    sales.orders o 
where 
    year(o.order_date) > 2017
group by 
    o.customer_id, year(o.order_date) 
order by 
    o.customer_id;

select 
    c.city, count(c.customer_id) customer_count
from 
    sales.customers c
group by
    c.city
order by
    c.city;


-- Show the total quantity of each product ordered across all orders. 
-- Display the product name and the total quantity ordered.

select 
    p.product_name, sum(ot.quantity) total_product_ordered
from
    sales.order_items ot
join
    production.products p 
    on p.product_id = ot.product_id
group by 
    p.product_name;

-- List all customers and the total number of orders they have placed. 
-- Show only those customers who have placed more than 2 orders.

select concat(first_name, ' ', last_name) customer, count(o.order_id) ordered_placed from sales.customers c inner join sales.orders o on c.customer_id = o.customer_id group by c.first_name, c.last_name having count(o.order_id) > 2; 

select 
    concat(c.first_name, ' ', c.last_name) as customer,
    count(o.order_id) as orders_placed
from 
    sales.customers c
inner join 
    sales.orders o on c.customer_id = o.customer_id
group by 
    c.first_name, c.last_name
having 
    count(o.order_id) > 2;
