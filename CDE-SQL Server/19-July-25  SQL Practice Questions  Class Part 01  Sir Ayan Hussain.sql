-- SQL Practice Problems:

-- List all the orders along with the customers fullname, staff fullname who handled the orders, 

--select 
--	concat(c.first_name, ' ', c.last_name) as Cust_FullName,
--	o.order_id,
--	p.product_name,
--	--p.product_name,
--	concat(s.first_name, ' ', s.last_name) as Emp_FullName 
--from	
--	production.products p,
--	sales.orders o
--inner join 
--	sales.customers c
--	on c.customer_id = o.customer_id
--inner join 
--	sales.staffs s
--	on o.staff_id = s.staff_id
--inner join 
--	sales.order_items ot
--	on o.order_id = ot.order_id;




select 
	concat(c.first_name, ' ', c.last_name) as Cust_FullName,
	o.order_id,
	p.product_name,
	year(o.order_date) as Order_Year,
	concat(s.first_name, ' ', s.last_name) as Emp_FullName 
from	
	sales.orders o
inner join 
	sales.customers c
	on c.customer_id = o.customer_id
inner join 
	sales.staffs s
	on o.staff_id = s.staff_id
inner join 
	sales.order_items ot
	on o.order_id = ot.order_id
inner join 
	production.products p
	on ot.product_id = p.product_id;



-- Get all products and show stock quantities in different stores, include products if they dont exist in stocks anywhere

select 
    p.product_id, 
    p.product_name, 
    s.quantity as stock_quantity, 
    st.store_name, 
    st.city
from 
    production.products p
left join 
    production.stocks s
    on p.product_id = s.product_id
left join 
    sales.stores st
    on s.store_id = st.store_id;


-- List all orders, including customers name, products name, order id, store name and quantity ordered
-- customer name | order id | product name | quantity orderd | store name


select 
	concat(sc.first_name, ' ', sc.last_name) as Cust_Name,
	so.order_id, pp.product_name, ot.quantity as quantity_ordered, ss.store_name
from 
	sales.orders so
inner join 
	sales.customers sc
	on so.customer_id = sc.customer_id
inner join 
	sales.order_items ot
	on so.order_id = ot.order_id
inner join
	sales.stores ss
	on so.store_id = ss.store_id
inner join
	production.products pp 
	on pp.product_id = ot.product_id;
