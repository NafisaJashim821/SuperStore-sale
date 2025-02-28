
# Superstore Sales Analysis





## Project Objective
This project analyzes Superstore Sales Data to gain valuable customer insights using Recency, Frequency, and Monetary (RFM) Segmentation. The goal is to understand purchasing behavior, optimize marketing strategies, and improve customer retention.
## 📂 Project Structure

📁 File Name : 

data_cleaning.sql : 
Cleans and formats data to ensure consistency and accuracy.

EDA.sql: Performs Exploratory Data Analysis (EDA) to uncover trends.

rfm_segmentation.sql: Implements RFM Segmentation to classify customers based on their purchase behavior.
## 🛠 Database Setup

🏦 1. Create Database :
CREATE DATABASE superstore;

📊 2. Create Table : 
USE superstore;

CREATE TABLE `Superstore Sales Data - Sheet1`

📥 3. Insert Data :

✅ Used Method: Used RebaseData (Convert XLS to MySQL) for data insertion.

✅ Alternative: Bulk Insertion can also be used for efficiency .
## 🔎 Methodology
🔹 1. Data Cleaning & Preprocessing :

✔ Remove missing/duplicate values

✔ Standardize data formats

✔ Fix incorrect data types

📊 2. Exploratory Data Analysis (EDA) :

The EDA process involves extracting insights and identifying trends in the sales data. Below are the key analyses performed:
📌 1. Distinct Values
✔ Identifies unique values in categorical fields (e.g., Region,Manager).

💰 2. Total Sales
✔ Calculates all sales.

📅 3. Yearly Sales Trend
✔ Aggregates total sales for each year to identify annual performance trends.

📊 4. Sales by Order Date
✔ Computes daily sales totals to analyze seasonality and peak sales periods.

🏆 5. Best-Selling Products
✔ Identifies top-selling products based on sales volume.

🌍 6. Sales Distribution by Region
✔ Analyzes sales performance across different geographic locations.

🚚 7. Customer Count by Ship Mode
✔ Counts the number of customers using each shipping method.

📈 8. Most Profitable Product Categories
✔ Determines which product categories generate the highest profits.

🏅 9. Top 10 Customers with the Highest Orders
✔ Lists the top 10 customers who placed the most orders.

📦 10. Average Order Value (AOV)
✔ Computes the average value of each customer’s order.

🔁 11. Repeat vs. One-Time Customers
✔ Categorizes customers into repeat buyers and one-time purchasers to assess customer loyalty.

🏷 3. RFM Segmentation :

RFM (Recency, Frequency, and Monetary) Segmentation helps categorize customers based on their purchasing behavior. This segmentation allows businesses to identify high-value customers, retain existing ones, and re-engage inactive buyers.


📊 1. RFM Base Table

✔ Extracts customer purchase history with details on the latest purchase date, total number of purchases(Frequency), and spending(Monetary).

📆 2. Recency, Frequency, and Monetary Values : 
✔ Calculates:

Recency (R): Days since last purchase.

Frequency (F): Total number of purchases.

Monetary (M): Total spending per customer.

🔢 3. RFM Scores :

✔ Assigned a score (1-5) for Recency, Frequency, and Monetary using quantile-based ranking.

🎯 4. Customer Segmentation : 

✔ Customers are classified based on their RFM scores into Best Customers, Loyal Customers, Big Spenders, and Lost Customers.

🏷 Segment :
🏆 Best Customers:	Most engaged, frequent buyers with high spending.

💎 Loyal Customers:	Frequent buyers with a strong purchase history.

💰 Big Spenders	Customers: who make large purchases but not frequently.

⚠️ Lost Customer:	Inactive buyers with low engagement.

📌 Others	:Customers that don’t fit into the above categories.




## 📈 Project Outcomes
🔹 Data Preparation

✔ Structured sales data and ensured accuracy.

🔍 EDA

✔ Analyzed trends, demand, and customer behavior.

🏷 RFM Segmentation

✔ Segmented customers by Recency, Frequency, and Monetary values to prioritize high-value clients and re-engage lost ones.

📊 Business Impact
✔ Improved marketing, retention, and profitability
