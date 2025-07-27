select customer_id, year(order_date) from sales.orders where customer_id in (1, 2) group by customer_id, year(order_date) order by customer_id;

-- Union merge the table vertically
select ss.first_name, ss.last_name from sales.staffs ss
union all
select sc.last_name, sc.first_name from sales.customers sc
join 
	sales.staffs ss
	on sc.first_name = ss.first_name; 

select concat(ss.first_name,'', ss.last_name), concat(sc.first_name,'', sc.last_name) from sales.customers sc join sales.staffs ss on concat(sc.first_name,'', sc.last_name) = concat(ss.first_name,'', ss.last_name);



select concat(sc.first_name,'', sc.last_name) customer_name from sales.customers sc group by sc.first_name, sc.last_name having count(*) > 1;

select pb.brand_name, pc.category_name, pp.model_year, sum(ot.list_price * ot.quantity * (1 - ot.discount)) as sales from production.products pp inner join production.categories pc on pp.category_id = pc.category_id inner join production.brands pb on pp.brand_id = pb.brand_id inner join sales.order_items ot  on ot.product_id = pp.product_id group by pb.brand_name, pc.category_name, pp.model_year order by pb.brand_name ;





