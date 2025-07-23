select * from hr.candidates;
select * from hr.employees;

select * from hr.employees e left join hr.candidates c on e.fullname = c.fullname;

select * from hr.employees e right join hr.candidates c on e.fullname = c.fullname;

select p.product_name, ot.order_id, p.list_price from production.products p left join  sales.order_items ot on ot.product_id = p.product_id order by ot.order_id;

select p.product_name, ot.order_id, ot.item_id, o.order_date from production.products p left join  sales.order_items ot on ot.product_id = p.product_id left join sales.orders o on o.order_id = ot.order_id order by ot.order_id;

-- Following up on the same above query; solving to only get the result which has the order_id = 100 
select p.product_id, p.product_name, ot.order_id from production.products p left join  sales.order_items ot on ot.product_id = p.product_id left join sales.orders o on o.order_id = ot.order_id where o.order_id = 100 order by ot.order_id;

