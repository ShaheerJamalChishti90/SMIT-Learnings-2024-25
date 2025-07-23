CREATE TABLE hr.candidates(
	id INT PRIMARY KEY IDENTITY,
	full_name VARCHAR(255) NOT NULL
);

CREATE TABLE hr.employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);

SELECT * FROM hr.candidates;
SELECT * FROM hr.employees;


INSERT INTO 
    hr.candidates(fullname)
VALUES
    ('John Doe'),
    ('Lily Bush'),
    ('Peter Drucker'),
    ('Jane Doe');



INSERT INTO 
    hr.employees(fullname)
VALUES
    ('John Doe'),
    ('Jane Doe'),
    ('Michael Scott'),
    ('Jack Sparrow');

SELECT * FROM hr.candidates;
SELECT * FROM hr.employees;

SELECT c.id as Cand_ID, c.fullname as Cand_FullName, e.id as Emp_ID, e.fullname as Emp_FullName FROM hr.candidates c INNER JOIN hr.employees e ON c.fullname = e.fullname;
-- Query: What category holds what product?
select c.category_id, c.category_name, p.product_id, p.product_name from production.products p inner join production.categories c on p.category_id = c.category_id;

-- Query: same as above query with some modifications
select
    top 10 b.brand_name, c.category_name, p.product_name ,p.list_price 
from   
    production.products p
inner join  
    production.categories c
on 
    c.category_id = p.category_id
inner join
    production.brands b
on
    p.brand_id = b.brand_id
order by
    product_name desc;


-- Query: What product was ordered by the customers, includes: Customer name and other essentials details
select 
    top 100 c.customer_id, concat(c.first_name, ' ', c.last_name) as Customer_Name,p.product_name as Product, o.order_date as Order_Date
from 
    sales.customers c
inner join 
    sales.orders o on c.customer_id = o.customer_id
inner join 
    sales.order_items ot on o.order_id = ot.order_id
inner join
    production.products p on ot.product_id = p.product_id
order by
    Customer_Name asc;

-- Query: Stores and their product quantity

select 
    ss.store_name, ps.quantity 
from 
    sales.stores ss
inner join 
    production.stocks ps 
on 
    ss.store_id = ps.store_id;