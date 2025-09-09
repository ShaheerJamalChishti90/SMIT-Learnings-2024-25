-- Sub query basically wo query hoti hai jo doosri queries ke ander aati hai
SELECT
    order_id,
    order_date,
    customer_id
FROM
    sales.orders
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            sales.customers
        WHERE
            city = 'New York'
    )
ORDER BY
    customer_id;


select product_name, list_price from production.products where list_price > 2498 and list_price < 2800 order by list_price

SELECT
    order_id,
    order_date,
    (
        SELECT
            MAX (list_price)
        FROM
            sales.order_items i
        WHERE
            i.order_id = o.order_id
    ) AS max_list_price
FROM
    sales.orders o
order by order_date desc;


--SIMPLE SUB QUERY PRACTICE (IN/NOT IN)

--Find customers who have placed an order.
--Write a query to retrieve the first_name and last_name of all customers who have a record in the orders table.

select 
    customer_id
    , concat(first_name, ' ', last_name) as customer_name
from 
    sales.customers
where 
    customer_id in (
        select 
            customer_id
        from 
            sales.orders )


--Find products that have not been sold.
--Write a query to get the product_name of all products that do not appear in the order_items table.

select product_name from production.products p where p.product_id not in (select product_id from sales.order_items)

--Identify stores without any staff members.
--Write a query that lists the store_name of any stores that don't have a corresponding staff_id in the staffs table.
SELECT
    store_name
FROM
    sales.stores ss
WHERE
    ss.store_id NOT IN (
        SELECT
            store_id
        FROM
            sales.staffs
    );


--List products with a list price higher than the average price.
--Write a query to find the product_name and list_price for all products that have a price greater than the average list_price of all products
select 
    pp.product_name, pp.list_price  
from 
    production.products pp 
where 
    pp.list_price > ( select avg(list_price) from production.products)


--Find the oldest order date for each store.
--For each store, find the order_id, order_date, and store_id of the order that was placed earliest.
SELECT
    o.order_id,
    o.order_date,
    o.store_id
FROM
    sales.orders AS o
INNER JOIN
    (
        SELECT
            store_id,
            MIN(order_date) AS min_order_date
        FROM
            sales.orders
        GROUP BY
            store_id
    ) AS sub
ON
    o.store_id = sub.store_id AND o.order_date = sub.min_order_date;


--Find the most expensive product in each category.
--For each category, find the product_name and list_price of the product with the highest price.
SELECT
    pp.product_name,
    pp.list_price,
    (SELECT pc.category_name FROM production.categories pc WHERE pp.category_id = pc.category_id) AS category_name
FROM
    production.products pp
WHERE
    pp.list_price = (
        SELECT
            MAX(list_price)
        FROM
            production.products
        WHERE
            category_id = pp.category_id
    );




select category_name, product_name, list_price from production.categories pc join production.products pp on pc.category_id = pp.category_id
