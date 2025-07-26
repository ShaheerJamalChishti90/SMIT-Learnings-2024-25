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

