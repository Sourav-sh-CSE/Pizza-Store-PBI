select * from pizza_sales

-- total order
select cast(count(distinct order_id) as decimal(10,2)) from pizza_sales

-- total order by weekday
select datename(dw,order_date) as Day_name,count(distinct order_id) as total_order 
from pizza_sales 
group by datename(dw,order_date)
order by Day_name

--hourly total_order
select datename(hh,order_time) as O_clock,count(distinct order_id) as total_order 
from pizza_sales 
group by datename(hh,order_time)
order by total_order desc

-- percentage of sales by pizza category
-- total price of each category*100/ total price

select pizza_category,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as total_pizza from pizza_sales group by pizza_category

-- rough query
select pizza_category,count(pizza_category)*100/(select count(pizza_category) from pizza_sales)  as total_pizza from pizza_sales group by pizza_category

select pizza_category,count(pizza_category) as total_pizza from pizza_sales group by pizza_category

select count(pizza_category) as total_pizza from pizza_sales

-- percentage of sales by pizza size

select pizza_size,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as sale_pct 
from pizza_sales 
group by pizza_size
order by sale_pct

-- top 5 pizza by revenue, qty, sales, total order 

select top 5 pizza_name, sum(total_price) as sales,sum(quantity) as qty, count(order_id) as total_order
from pizza_sales
group by pizza_name 
order by sales desc, qty desc,total_order desc

-- bottom 5 pizza by revenue, qty, sales, total order 
select top 5 pizza_name, sum(total_price) as sales,sum(quantity) as qty, count(order_id) as total_order
from pizza_sales
group by pizza_name 
order by sales, qty,total_order




