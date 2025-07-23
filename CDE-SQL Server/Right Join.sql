-- Right Join

-- Right ANTI-JOIN; Data for those products which does not have any sales(sales order id = null)
select ot.order_id, p.product_name from sales.order_items ot right join  production.products p on ot.product_id = p.product_id where ot.order_id is null order by ot.order_id;

-- Data for those products which does have any sales(sales order id = not null)
select ot.order_id, p.product_name from sales.order_items ot right join  production.products p on ot.product_id = p.product_id where ot.order_id is not null order by ot.order_id;
