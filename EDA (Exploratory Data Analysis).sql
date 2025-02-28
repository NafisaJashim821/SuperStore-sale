use superstore;

-- EDA (Exploratory Data Analysis)


SELECT COUNT(*) AS total_rows FROM `Superstore Sales Data - Sheet1`;
-- Distinct Values
select distinct Region  from  `Superstore Sales Data - Sheet1` ;
SELECT DISTINCT Manager FROM `Superstore Sales Data - Sheet1`;

-- total sales

SELECT YEAR(DATE_ADD('1899-12-30', INTERVAL Order_Date DAY)) AS year, 
       SUM(Sales) AS total_sales
FROM `Superstore Sales Data - Sheet1`
GROUP BY year
ORDER BY year;

-- Year and Sales

SELECT YEAR(DATE_ADD('1899-12-30', INTERVAL Order_Date DAY)) AS year, 
       SUM(Sales) AS total_sales
FROM `Superstore Sales Data - Sheet1`
GROUP BY year
ORDER BY year;

-- total sales for each order date

SELECT DATE_FORMAT(DATE_ADD('1899-12-30', INTERVAL Order_Date DAY), '%m/%d/%Y') AS formatted_date,
       SUM(Sales) AS total_sales
FROM `Superstore Sales Data - Sheet1`
GROUP BY formatted_date
ORDER BY STR_TO_DATE(formatted_date, '%m/%d/%Y');




-- Best-Selling Products

select product_name  , sum(sales) as total_sales  
from `Superstore Sales Data - Sheet1`
group by product_name 
order by total_sales desc;

-- Sales Distribution by Region

SELECT Region, SUM(Sales) AS total_sales
FROM `Superstore Sales Data - Sheet1`
GROUP BY Region
ORDER BY total_sales DESC;

-- Customer Count by Ship Mode
SELECT count(customer_name), ship_mode
FROM `Superstore Sales Data - Sheet1`
GROUP BY ship_mode;

-- Most Profitable Product Categories
SELECT Product_Category, SUM(Profit) AS total_profit
FROM `Superstore Sales Data - Sheet1`
GROUP BY Product_Category
ORDER BY total_profit DESC;

-- Customers with the Highest Order (top 10 )

SELECT Customer_Name, COUNT(Order_ID) AS total_orders
FROM `Superstore Sales Data - Sheet1`
GROUP BY Customer_Name
ORDER BY total_orders DESC
LIMIT 10;

-- Average Order Value

SELECT AVG(Sales) AS avg_order_value
FROM `Superstore Sales Data - Sheet1`;

-- Repeat and  One-Time Customers
SELECT COUNT(DISTINCT Customer_Name) AS total_customers,
       SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
       SUM(CASE WHEN order_count = 1 THEN 1 ELSE 0 END) AS one_time_customers
FROM (
    SELECT Customer_Name, COUNT(Order_ID) AS order_count
    FROM `Superstore Sales Data - Sheet1`
    GROUP BY Customer_Name
) AS customer_orders;




