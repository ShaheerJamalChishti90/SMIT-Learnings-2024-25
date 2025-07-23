select * from hr.candidates;
select * from hr.employees;

select * from hr.employees e left join hr.candidates c on e.fullname = c.fullname;

select * from hr.employees e right join hr.candidates c on e.fullname = c.fullname;

select p.product_name, ot.order_id, p.list_price from production.products p left join  sales.order_items ot on ot.product_id = p.product_id order by ot.order_id;

select p.product_name, ot.order_id, ot.item_id, o.order_date from production.products p left join  sales.order_items ot on ot.product_id = p.product_id left join sales.orders o on o.order_id = ot.order_id order by ot.order_id;
