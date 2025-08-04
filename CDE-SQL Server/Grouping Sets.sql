-- Grouping Sets

select 
	pb.brand_name,
	pc.category_name,
	pp.model_year,
	sum(ot.list_price * ot.quantity * (1 - ot.discount)) as sales INTO sales.sales_summary
from 
	production.products pp 
inner join 
	production.categories pc 
	on pp.category_id = pc.category_id 
inner join 
	production.brands pb 
	on pp.brand_id = pb.brand_id 
inner join 
	sales.order_items ot  
	on ot.product_id = pp.product_id 
group by 
	pb.brand_name, pc.category_name, pp.model_year 
order by 
	pb.brand_name;

select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by 
	grouping sets (
	(brand_name, category_name), 
	(brand_name), 
	(category_name), 
	()
);
