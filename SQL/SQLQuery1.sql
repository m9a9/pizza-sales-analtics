-- Calculate Revenue 
select sum(total_price) as Total_Revenue from pizza_sales

-- Claculate Total pizza Sold

select sum(quantity) as Total_pizza_sold from pizza_sales

--calculate average order value 
select (sum(total_price)/ count(Distinct order_id)) as AVG_ORDER_VALUE
from pizza_sales

-- select total orders
select count(Distinct order_id) as total_orders 
from pizza_sales

--select average pizzas per order
select cast (cast (sum(quantity) as decimal (10,2)) / 
cast(count(Distinct order_id) as decimal (10,2)) as decimal (10,2))
as average_pizzas_per_order
from pizza_sales

-- calculate Daily number of orders 
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)


-- calculate number of order by hour 
SELECT DATEPART(HOUR, order_time) as order_hours, COUNT(DISTINCT order_id) as total_orders
from pizza_sales
group by DATEPART(HOUR, order_time)
order by DATEPART(HOUR, order_time)

-- calculate pizza categoy sales by revenue and percentage 
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCR
FROM pizza_sales
GROUP BY pizza_category
-- calculate pizza by size 
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

--total quantity sold by category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--. Top 5 Best Sellers by Total Pizzas Sold
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

-- Bottom 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC





