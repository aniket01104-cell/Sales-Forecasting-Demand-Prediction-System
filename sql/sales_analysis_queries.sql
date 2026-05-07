-- ============================================================
-- PROJECT : Sales Forecasting & Demand Analysis
-- AUTHOR : Aniket Pingle
-- DATABASE : sales_db
-- TOOL : MySQL 8.0
-- DATASET : Retail Sales Dataset (~100+ records)
-- PURPOSE : Analyze sales performance, identify trends,
-- track growth patterns, and generate business insights
-- for decision-making and forecasting
-- ============================================================


-- ============================================================
-- SECTION 1: DATABASE & TABLE SETUP
-- ============================================================
CREATE DATABASE sales_db;
USE sales_db;
-- Sales table stores transactional retail data
-- including customer, product, region, and revenue details

-- Creating Table and importing dataset in the table.
CREATE TABLE sales (
    OrderID VARCHAR(50),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(50),
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Region VARCHAR(50),
    ProductID VARCHAR(50),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(255),
    Sales DECIMAL(10,2));
-- NOTE:
-- Data imported using MySQL Workbench Import Wizard

 
-- ============================================================
-- SECTION 2: DATA VALIDATION
-- ============================================================
-- Check total records
SELECT * FROM sales;
-- Preview dataset
SELECT * FROM sales LIMIT 5;


-- ============================================================
-- SECTION 3: BUSINESS ANALYSIS QUERIES
-- ============================================================

-- ------------------------------------------------------------
-- QUERY 1 : Total Revenue
-- ------------------------------------------------------------
-- Business Question:
-- What is the total revenue generated from all sales?
SELECT ROUND(SUM(Sales),2) AS Total_Revenue FROM sales;
-- INSIGHT:
-- The business generated total revenue of 26,330.93.
-- This represents the overall sales performance and serves as
-- a baseline metric for further analysis and forecasting.


-- ------------------------------------------------------------
-- QUERY 2 : Total Orders
-- ------------------------------------------------------------
-- Business Question:
-- How many unique orders were placed?
SELECT COUNT(DISTINCT OrderID) AS Total_Orders FROM sales;
-- INSIGHT:
-- A total of 66 unique orders were recorded.
-- This indicates the volume of transactions and helps
-- measure customer purchasing activity.


-- ------------------------------------------------------------
-- QUERY 3 : Average Order Value
-- ------------------------------------------------------------
-- Business Question:
-- What is the average value of a order?
SELECT ROUND(SUM(Sales)/COUNT(DISTINCT OrderID),2) AS Avg_Order_Value FROM sales;
-- INSIGHT:
-- The average order value is 398.95, indicating that
-- customers typically spend around 400 per transaction.
-- This metric is crucial for pricing and upselling strategies.

 
-- ------------------------------------------------------------
-- QUERY 4 : Yearly Sales Trend
-- ------------------------------------------------------------
-- Business Question:
-- What are the sales of past few years?
SELECT YEAR(OrderDate) AS Year,
ROUND(SUM(Sales),2) AS Yearly_Sales 
FROM sales
GROUP BY Year 
ORDER BY Year;
-- INSIGHT:
-- Sales peaked in 2016 and declined afterward.
-- This indicates possible demand fluctuation or
-- reduced customer activity in later years.

 
-- ------------------------------------------------------------
-- QUERY 5 : Monthly Sales (Seasonality Analysis)
-- ------------------------------------------------------------
-- Business Question:
-- What are the monthly sales and which month has the most sales?
SELECT MONTH(OrderDate) AS Month,
ROUND(SUM(Sales),2) AS Monthly_Sales
FROM sales
GROUP BY Month 
ORDER BY Month;
-- INSIGHT:
-- Sales are highest in months 9 and 12, indicating strong
-- seasonal demand toward the end of the year.
-- Lower sales in early months suggest slower business cycles.

 
-- ------------------------------------------------------------
-- QUERY 6 : Daily Sales Performance
-- ------------------------------------------------------------
-- Business Question:
-- Which day of the week generates the highest revenue?
-- This helps identify peak business days for staffing,
-- promotions, and operational planning.
SELECT DAYNAME(OrderDate) AS Day,
ROUND(SUM(Sales),2) AS Daily_Revenue
FROM sales
GROUP BY Day
ORDER BY Daily_Revenue DESC;
-- INSIGHT:
-- Tuesday generates the highest revenue at 8480.51,
-- followed by Saturday at 6756.51, indicating strong mid-week
-- and weekend demand. Thursday shows the lowest sales at 530.35,
-- suggesting weak customer activity. Business can increase
-- promotions or discounts on low-performing days like Thursday
-- to balance revenue distribution across the week.


-- ------------------------------------------------------------
-- QUERY 7 : Month-over-Month Growth Rate
-- ------------------------------------------------------------
-- Business Question:
-- What are the monthly sales of past few years?
-- NOTE:
-- Some months are missing due to no sales transactions.
-- Growth is calculated only for available months.
SELECT Year,Month,Monthly_Sales,COALESCE(
ROUND((Monthly_Sales - LAG(Monthly_Sales) 
OVER (ORDER BY Year,Month)) / NULLIF(LAG(Monthly_Sales) 
OVER(ORDER BY Year,Month),0) * 100,2),0) AS Growth_percentage
FROM (SELECT YEAR(OrderDate) AS Year,
MONTH(OrderDate) AS Month,
SUM(Sales) AS Monthly_Sales
FROM sales
GROUP BY Year,Month) t;
-- INSIGHT:
-- Sales show extreme volatility with sharp spikes and drops.
-- Growth exceeds 6000% in some months due to very low base values,
-- indicating inconsistent demand patterns and irregular sales cycles.

 
-- ------------------------------------------------------------
-- QUERY 8 : Top 10 Products by Sales
-- ------------------------------------------------------------
-- Business Question:
-- What are the top 10 most selling products?
SELECT ProductName,ROUND(SUM(Sales),2) AS Total_Sales
FROM sales
GROUP BY ProductName
ORDER BY Total_Sales DESC
LIMIT 10;
-- INSIGHT:
-- A few products contribute significantly to total revenue,
-- indicating a strong product concentration effect.
-- These products should be prioritized in inventory and marketing.

 
-- ------------------------------------------------------------
-- QUERY 9 : Sales by Category
-- ------------------------------------------------------------
-- Business Question:
-- How much sales each category generates and which category genrate the highest sales?
SELECT Category,ROUND(SUM(Sales),2) AS Sales
FROM  sales
GROUP BY Category
ORDER BY Sales DESC;
-- INSIGHT:
-- Furniture generates the highest revenue, followed by Office Supplies.
-- Technology contributes the least, suggesting potential growth opportunity.


-- ------------------------------------------------------------
-- QUERY 10 : Sales by Sub-Category
-- ------------------------------------------------------------
-- Business Question:
-- Which specific product sub-categories contribute the most revenue?
-- This helps identify high-performing product segments
-- and optimize inventory and marketing focus.
SELECT SubCategory,ROUND(SUM(Sales),2) AS Sales
FROM sales
GROUP BY SubCategory
ORDER BY Sales DESC;
-- INSIGHT:
-- Tables and Phones are the top-performing sub-categories,
-- generating the highest revenue, followed by Bookcases and Chairs.
-- Lower-performing categories like Fasteners and Supplies contribute
-- minimal revenue, indicating low demand. Business should prioritize
-- stocking and promoting high-performing sub-categories while
-- reconsidering strategy for low-performing ones.


-- ------------------------------------------------------------
-- QUERY 11 : Top Customers by Revenue
-- ------------------------------------------------------------
-- Business Question:
-- Which are the top customers contributing the most to the sales?
SELECT CustomerName,ROUND(SUM(Sales),2) AS Revenue
FROM sales 
GROUP BY CustomerName
ORDER BY Revenue DESC
LIMIT 10;
-- INSIGHT:
-- A small group of customers contributes a large share of revenue,
-- indicating dependency on high-value customers.
-- Retention strategies should focus on these key clients.


-- ------------------------------------------------------------
-- QUERY 12 : Sales by Customer Segment
-- ------------------------------------------------------------
-- Business Question:
-- Which customer segment contributes the most revenue?
-- This helps understand the primary revenue-driving audience
-- and enables targeted marketing strategies.
SELECT Segment,ROUND(SUM(Sales),2) AS Sales
FROM sales
GROUP BY Segment;
-- INSIGHT:
-- The Consumer segment dominates with 17789.10 in revenue,
-- significantly higher than Corporate and Home Office segments.
-- This indicates that individual customers are the primary
-- revenue drivers. Business should focus on consumer-focused
-- marketing campaigns while also exploring growth opportunities
-- in corporate and home office segments.


-- ------------------------------------------------------------
-- QUERY 13 : Sales by Region
-- ------------------------------------------------------------
-- Business Question:
-- Which geographic region contributes the most to revenue?
-- This helps in regional performance analysis and expansion planning.
SELECT Region,ROUND(SUM(Sales),2) AS Sales
FROM sales
GROUP BY Region
ORDER BY Sales DESC;
-- INSIGHT:
-- The West region generates the highest revenue at 9310.83,
-- followed by Central and East regions. The South region has
-- the lowest sales at 4153.69, indicating weaker market performance.
-- Business should strengthen marketing and distribution strategies
-- in the South region to improve sales performance.


-- ------------------------------------------------------------
-- QUERY 14 : Top 10 States by Sales
-- ------------------------------------------------------------
-- Business Question:
-- Which states generate the highest revenue?
-- This helps identify high-performing markets for targeted expansion.
SELECT State,ROUND(SUM(Sales),2) AS Sales
FROM sales
GROUP BY State
ORDER BY Sales DESC
LIMIT 10;
-- INSIGHT:
-- California generates the highest revenue at 5140.88,
-- followed by Texas and Pennsylvania. These states represent
-- the strongest markets for the business. Expanding operations,
-- increasing inventory, and running targeted campaigns in these
-- regions can further boost revenue.

 
 -- ============================================================
-- FINAL SUMMARY & CONCLUSION
-- ============================================================
-- Key Findings:
-- The business shows strong revenue concentration in specific areas,
-- with a few products, customers, and regions driving the majority
-- of total sales. Sales performance varies significantly across
-- time, categories, and geography.
-- Sales Trends:
-- Revenue is highly seasonal, with peak performance in later months
-- and significant fluctuations in growth rates, indicating unstable
-- demand patterns.
-- Customer Insights:
-- The Consumer segment contributes the majority of revenue,
-- highlighting dependence on individual buyers rather than businesses.
-- Product Insights:
-- Tables, Phones, and Bookcases are the top-performing sub-categories,
-- while several low-performing categories contribute minimal revenue,
-- suggesting opportunities for optimization.
-- Regional Insights:
-- The West region dominates sales, while the South region underperforms,
-- indicating a need for regional strategy improvement.
-- Operational Insight:
-- Tuesday and Saturday generate the highest revenue, while Thursday
-- performs the worst, suggesting opportunities for weekday promotions.
-- Business Conclusion:
-- The company should focus on high-performing products and regions,
-- strengthen low-performing areas through targeted strategies,
-- and stabilize demand fluctuations using better forecasting
-- and promotional planning.
-- ============================================================
-- END OF PROJECT
-- ============================================================