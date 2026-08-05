/* Creating database */
Create database Blinkit;
USE blinkit;

/* Creating table*/
Create Table Blinkit(
Item_Fat_content VARCHAR(20),
Item_Identifier VARCHAR(20),
Item_type VARCHAR(50),
Outlet_Establishment_Year INT,
Outlet_Identifier VARCHAR(20),
Outlet_Location_Type VARCHAR(20),
Outlet_Size VARCHAR(20),
Outlet_type VARCHAR(50),
Item_Visibility DECIMAL(10,9),
Item_Weight DECIMAL (10,5),
Sales DECIMAL (10,5),
Rating DECIMAL (5,4)
);

/* Showing data in the table */
SELECT * FROM Blinkit;

/* Basic queries */
SELECT COUNT(*) FROM BLINKIT;

/* Find total sales*/
SELECT ROUND(sum(Sales),2) as Total_sales
FROM blinkit;

/* Find average sales*/
SELECT ROUND(Avg(Sales),2) as Avg_sales
FROM blinkit;

/* Maximum Sales*/
SELECT max(sales) as Highest_sales
FROM blinkit;

/* Minimum sales*/
SELECT min(sales) as Lowest_sales
FROM blinkit;

/* show uniques item_types*/
SELECT DISTINCT Item_type
FROM blinkit;

/* Find Top 10 highest-selling products*/
SELECT Item_identifier, Sales
FROM blinkit
ORDER BY sales desc
LIMIT 10;

/* Total sales by Item Type*/
SELECT Item_type,
ROUND(SUM(Sales),2) as Total_sales
FROM blinkit
GROUP BY Item_type
ORDER BY Total_sales DESC; 

/* Total sales by Outlet Type*/
SELECT Outlet_type,
ROUND(SUM(sales),2) as Total_sales
FROM blinkit
GROUP BY Outlet_type;

/*Average rating by Outlet Type */
SELECT Outlet_type,
ROUND(Avg(rating),2) as Avg_rating
FROM blinkit
GROUP BY Outlet_type;

/* Item Types with sales greater than 100000 */
SELECT Item_type,
ROUND(SUM(sales),2) as Total_sales
FROM BLINKIT
GROUP BY Item_type
HAVING SUM(Sales) > 100000;

/* Number of products in each Item Type */
SELECT Item_type,
COUNT(*) as Total_items
FROM blinkit
GROUP BY Item_type;

/* Create Healthy/Regular category using CASE */
SELECT Item_identifier, Item_fat_content,
CASE
WHEN Item_fat_content = 'Low Fat' THEN 'Healthy'
ELSE 'Regular'
END AS Category
FROM blinkit;

/* Rank products by Sales */
SELECT Item_identifier, Sales,
RANK() OVER( ORDER BY Sales DESC) as Ranking
FROM Blinkit;

/* Dashboard KPI Query*/
SELECT
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(AVG(Sales),2) AS Average_Sales,
COUNT(*) AS Total_Items,
ROUND(AVG(Rating),2) AS Average_Rating
FROM Blinkit;

/* Top 5 Item Types by Total Sales */
SELECT Item_type,
SUM(Sales) as Total_sales
FROM blinkit
GROUP BY Item_type
ORDER BY Total_sales DESC
LIMIT 5;

/* Average Weight by Item Type */
SELECT Item_type,
ROUND(Avg(Item_weight),2) as Avg_Weight
FROM blinkit
GROUP BY Item_type;

/* Highest Rated Products */
SELECT Item_identifier, Rating
FROM blinkit
ORDER BY Rating desc;

/* Count Products in Each Outlet */
SELECT Outlet_identifier,
COUNT(*) as Product_count
FROM blinkit
GROUP BY Outlet_identifier
ORDER BY Product_count DESC;