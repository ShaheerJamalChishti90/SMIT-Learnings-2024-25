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

select 
	pb.brand_name, pc.category_name, pp.model_year, sum(ot.list_price * ot.quantity * (1 - ot.discount)) as sales INTO sales.sales_summary
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


select * from sales.sales_summary

--select sales_summary.brand_name, sales_summary.category_name, sum(sales_summary.sales) from sales.sales_summary group by sales_summary.brand_name, sales_summary.category_name
--union all
--select sales_summary.brand_name, null, sum(sales_summary.sales) from sales.sales_summary group by sales_summary.brand_name
--union all
--select null, sales_summary.category_name, sum(sales_summary.sales), null from sales.sales_summary group by sales_summary.category_name
--union all
--select null, null, sum(sales_summary.sales) as Total_Sales from sales.sales_summary;


SELECT brand_name, category_name, SUM(sales) AS total_sales
FROM sales.sales_summary
GROUP BY brand_name, category_name

UNION ALL

SELECT brand_name, NULL, SUM(sales) AS total_sales
FROM sales.sales_summary
GROUP BY brand_name

UNION ALL

SELECT NULL, category_name, SUM(sales) AS total_sales
FROM sales.sales_summary
GROUP BY category_name

UNION ALL

SELECT NULL, NULL, SUM(sales) AS total_sales
FROM sales.sales_summary;


-- Grouping Sets

select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by 
	grouping sets (
	(brand_name, category_name), 
	(brand_name), 
	(category_name), 
	()
);



-- Cube Clause
select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by  cube(brand_name, category_name);

-- Partial Grouping
select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by  brand_name, cube (category_name);

-- Rollup Clause
select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by  rollup(brand_name, category_name);

-- Partial Rollup Clause
select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by  brand_name, rollup(category_name);

-- (category)(null)
-- (brand)(category)


select brand_name, category_name, sum(sales) as total_sales from sales.sales_summary group by  category_name, rollup(brand_name);







