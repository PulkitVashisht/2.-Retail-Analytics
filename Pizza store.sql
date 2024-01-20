create database pizza_db;
use pizza_db;
select * from pizza_sales;

-- KPI's

-- 1	Total Revenue  
select sum(total_price) 'total revenue' from pizza_sales ;


-- 2	Average order value
select sum(total_price)/count(distinct(order_id)) 'Average order value'from pizza_sales;


-- 3	Total Pizzas sold
select sum(quantity) from pizza_sales;


-- 4	Total Orders
select count(distinct(order_id)) from pizza_sales;


-- 5	Average pizzas per order
select cast(sum(quantity)/count(distinct(order_id))  as decimal (3,2)) 'Average pizzas per order' from pizza_sales;


-- 	CHARTS REQUIREMENT
update pizza_sales set order_date = str_to_date(order_date, '%Y-%m-%d');

-- 6	Daily trend for total orders
select dayname(order_date) 'day', count(distinct order_id) 'total orders' from pizza_sales group by day;


-- 7	Monthly trend for total orders
select monthname(order_date) 'month',  count(distinct order_id) 'total orders' from pizza_sales group by month;


-- 8	Hourly trend for total orders
select  hour(order_time) hour, count(distinct order_id) 'total_orders' from pizza_sales group by hour ;


-- 9	Sales by pizza category
select pizza_category, count(distinct order_id ) 'total orders' , cast( sum(total_price)*100 /(select sum(total_price) from pizza_sales  )as decimal(5,2) )  'sales'
 from pizza_sales  group by pizza_category;
 
 --  for month wise, use where month(order_date) = 1 in both queries
 
 
 -- 10	Sales by pizza size
select pizza_size, count(distinct order_id ) 'total orders' , cast(sum(total_price)  *100/(select sum(total_price) from pizza_sales  ) as decimal(5,2))  'sales'
 from pizza_sales  group by pizza_size;
 
 
 create database pizza_db;
use pizza_db;
select * from pizza_sales;

-- KPI's

-- 1	Total Revenue  
select sum(total_price) 'total revenue' from pizza_sales ;


-- 2	Average order value
select sum(total_price)/count(distinct(order_id)) 'Average order value'from pizza_sales;


-- 3	Total Pizzas sold
select sum(quantity) from pizza_sales;


-- 4	Total Orders
select count(distinct(order_id)) from pizza_sales;


-- 5	Average pizzas per order
select cast(sum(quantity)/count(distinct(order_id))  as decimal (3,2)) 'Average pizzas per order' from pizza_sales;


-- 	CHARTS REQUIREMENT
update pizza_sales set order_date = str_to_date(order_date, '%Y-%m-%d');

-- 6	Daily trend for total orders
select dayname(order_date) 'day', count(distinct order_id) 'total orders' from pizza_sales group by day;


-- 7	Monthly trend for total orders
select monthname(order_date) 'month',  count(distinct order_id) 'total orders' from pizza_sales group by month;


-- 8	Hourly trend for total orders
select  hour(order_time) hour, count(distinct order_id) 'total_orders' from pizza_sales group by hour ;


-- 9	Sales by pizza category
select pizza_category, count(distinct order_id ) 'total orders' , cast( sum(total_price)*100 /(select sum(total_price) from pizza_sales  )as decimal(5,2) )  'sales'
 from pizza_sales  group by pizza_category;
 
 --  for month wise, use where month(order_date) = 1 in both queries
 
 
 -- 10	Sales by pizza size
select pizza_size, count(distinct order_id ) 'total orders' , cast(sum(total_price)  *100/(select sum(total_price) from pizza_sales  ) as decimal(5,2))  'sales'
 from pizza_sales  group by pizza_size;
 
 
 -- 	11 Top 5 best seller pizza by Revenue, Total Quantity & Total orders
 
--  By Total Revenue
 select pizza_name,sum(total_price) 'revenue' from pizza_sales
 group by pizza_name order by revenue desc limit 5;
 
 --  By Total Quantity
 select pizza_name, sum(quantity) 'total_quantity' from pizza_sales 
 group by pizza_name order by total_quantity desc limit 5;
 
--  By Total Orders
 select pizza_name, count(distinct order_id) 'total_orders' from pizza_sales 
 group by pizza_name order by total_orders desc limit 5;
 
 
  -- 	12	Worst 5 best seller pizza by Revenue, Total Quantity & Total orders
  
 --  By Total Revenue  
   select pizza_name,sum(total_price) 'revenue' from pizza_sales
 group by pizza_name order by revenue  limit 5;
 
 --  By Total Quantity
 select pizza_name, sum(quantity) 'total_quantity' from pizza_sales 
 group by pizza_name order by total_quantity  limit 5;
 
--  By Total Orders
 select pizza_name, count(distinct order_id) 'total_orders' from pizza_sales 
 group by pizza_name order by total_orders  limit 5;