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

select o.order_id, o.order_date, o.customer_id from sales.orders o join sales.customers c on o.customer_id = c.customer_id where c.city = 'New York' order by c.customer_id;

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




--Subqueries in the WHERE clause
--Find all products that have a list price greater than the average list price of all products.
--Write a query that uses a subquery to calculate the average price and then filters the products based on that value.
select 
     p.product_id, p.product_name, p.list_price
from 
    production.products p
where
    p.list_price > (
    select 
        avg(p.list_price)
        from production.products p)
order by
    p.list_price desc



--Identify all staff members who have placed an order.
--Write a query that lists the first_name and last_name of any staff member whose staff_id exists in the orders table as staff_id.

select 
    --st.store_name,
    s.staff_id,
    concat(s.first_name, ' ', s.last_name) staff_name
    --o.order_id
    --pp.product_name
from 
    sales.staffs s
--join 
--    sales.stores st
--    on st.store_id = s.store_id
--join 
--    sales.orders o
--    on o.staff_id= st.store_id
--join 
--    production.stocks ps
--    on ps.store_id = st.store_id
--join 
--    production.products pp
--    on ps.product_id = pp.product_id
where 
    s.staff_id in (
    select o.staff_id from sales.orders o)
order by 
    s.staff_id


select ss.staff_id, concat(ss.first_name, ' ', ss.last_name ) from sales.staffs ss join sales.orders o on o.staff_id = ss.staff_id group by ss.staff_id, ss.first_name, ss.last_name order by ss.staff_id



--Find the most expensive product in each category.
--Write a query that uses a correlated subquery to find the product_name 
--and list_price of the most expensive product for each category.
SELECT
    product_name,
    list_price,
    category_id
FROM
    production.products p1
WHERE
    list_price IN (
        SELECT
            MAX (p2.list_price)
        FROM
            production.products p2
        WHERE
            p2.category_id = p1.category_id
        GROUP BY
            p2.category_id
    )
ORDER BY
    category_id,
    product_name;





--Subqueries in the FROM clause
--Calculate the total number of orders placed in the year 2017.
--Use a subquery in the FROM clause to first get all orders from 2017, and then count the number of orders in the outer query.
select count(order_id) total_orders_16 from (select * from sales.orders o where year(o.order_date) = 2016) t;
select count(order_id) total_orders_17 from (select * from sales.orders o where year(o.order_date) = 2017) t;
select count(order_id) total_orders_18 from (select * from sales.orders o where year(o.order_date) = 2018) t;

--Find the total sales amount for each store.
--Create a subquery that calculates the sales amount for each order (quantity * list_price). 
--Then, in the outer query, group the results by store_id and sum the total sales amount.

select ot.order_id, (ot.quantity * ot.list_price) sales_amount from sales.order_items ot group by ot.order_id
