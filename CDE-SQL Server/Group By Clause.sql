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

