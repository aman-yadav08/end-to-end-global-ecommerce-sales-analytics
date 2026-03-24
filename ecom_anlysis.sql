/*
E-Commerce Sales Analysis using SQL

This SQL script analyzes the ecommerce_data dataset to evaluate sales performance,
profitability, customer behavior, product performance, and regional trends.
The queries use aggregation, grouping, filtering, and window functions to
identify top products, high-value customers, discount impact, shipping costs,
and profit margins to generate business insights.
*/


-- What is the total sales and total profit generated?
SELECT 
SUM(Sales) AS TOTAL_SALES, 
SUM(Profit) AS TOTAL_PROFIT
FROM ecommerce_data;

-- Which region generates the highest sales?
SELECT 
Region,
SUM(Sales) AS TOTAL_SALES
FROM ecommerce_data
Group by Region
Order by TOTAL_SALES Desc;

-- Which product categories generate the most revenue?
SELECT 
Category,
Sum(Sales) AS Total_sales
from ecommerce_data
group by Category
order by Total_sales Desc;

-- What are the top 10 best-selling products?
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM ecommerce_data
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Which products generate the highest profit?
SELECT 
`Product Name`,
Sum(Profit) As Most_Profitable
From ecommerce_data
group by `Product Name`
order by Most_Profitable Desc;

-- Which products are causing losses?
SELECT
`Product Name`,
Sum(Profit) As Total_Profit
From ecommerce_data
group by `Product Name`
Having Total_Profit < 0
order by Total_Profit; 

-- Which cities generate the highest sales?
Select
City,
Sum(Sales) As Total_sales
from ecommerce_data
group by City
order by Total_sales Desc;

-- Which customer segment generates the most sales?
Select
Segment,
Sum(Sales) as Total_sales
from ecommerce_data
Group by Segment
order by Total_sales Desc;

-- Which payment method is used most frequently?
Select
`Payment Method`,
count(*) AS Total_Orders
from ecommerce_data
group by `Payment Method`
order by Total_Orders Desc;

-- What is the monthly sales trend?
Select 
Month(`Order Date`) As Month,
sum(Sales) As Monthly_Sales
from ecommerce_data
Group by Month
Order by Month;

-- How many unique customers exist in the dataset?
Select
Count(distinct `Customer ID`) as Total_Customers
from ecommerce_data;

-- What is the average shipping cost per region?
Select
Region,
Avg(`Shipping Cost`) As Avg_Shipping_Cost
from ecommerce_data
group by region
order by Avg_Shipping_Cost Desc;

-- Which shipping priority is used most frequently?
Select 
`Order Priority`,
count(*) As Most_Order_Priority
from ecommerce_data
Group by `Order Priority`
Order by `Order Priority` Desc;

-- What is the average delivery time (Ship Date – Order Date)?
SELECT 
    AVG(DATEDIFF(STR_TO_DATE(`Ship Date`, '%Y-%m-%d'),
                 STR_TO_DATE(`Order Date`, '%Y-%m-%d'))) AS Avg_Delivery_Days
FROM ecommerce_data;

-- Does higher discount increase sales?
SELECT 
    Discount,
    SUM(Sales) AS Total_Sales
FROM ecommerce_data
GROUP BY Discount
ORDER BY Discount;

-- Which category receives the highest discount?
Select 
Category,
avg(Discount) As Avg_discount
from ecommerce_data
group by Category
order by Avg_discount Desc;

-- Which products give discount but still make profit?
SELECT 
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Discount) AS Avg_Discount
FROM ecommerce_data
WHERE Discount > 0
GROUP BY `Product Name`
HAVING Total_Profit > 0
ORDER BY Total_Profit DESC;

-- Which product is the top seller in each region?
SELECT Region, `Product Name`, Total_Sales
FROM (
    SELECT 
        Region,
        `Product Name`,
        SUM(Sales) AS Total_Sales,
        RANK() OVER (PARTITION BY Region ORDER BY SUM(Sales) DESC) AS rnk
    FROM ecommerce_data
    GROUP BY Region, `Product Name`
) ranked_products
WHERE rnk = 1;


-- Which customers purchased in multiple categories?
SELECT 
`Customer Name`,
COUNT(DISTINCT Category) AS Categories_Purchased
FROM ecommerce_data
GROUP BY `Customer Name`
HAVING Categories_Purchased > 1
ORDER BY Categories_Purchased DESC;


-- What is the profit margin by category?
SELECT 
Category,
SUM(Profit) AS Total_Profit,
SUM(Sales) AS Total_Sales,
(SUM(Profit) / SUM(Sales)) * 100 AS Profit_Margin_Percentage
FROM ecommerce_data
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;


-- Which cities generate high sales but low profit?
SELECT 
City,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY City
ORDER BY Total_Sales DESC;


-- Which countries generate the highest sales?
SELECT 
Country,
SUM(Sales) AS Total_Sales
FROM ecommerce_data
GROUP BY Country
ORDER BY Total_Sales DESC;


-- Which sub-category generates the most profit?
SELECT 
`Sub Category`,
SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY `Sub Category`
ORDER BY Total_Profit DESC;


-- Which cities have the highest shipping costs?
SELECT 
City,
AVG(`Shipping Cost`) AS Avg_Shipping_Cost
FROM ecommerce_data
GROUP BY City
ORDER BY Avg_Shipping_Cost DESC;


-- Which products sell the highest quantity?
SELECT 
`Product Name`,
SUM(Quantity) AS Total_Quantity_Sold
FROM ecommerce_data
GROUP BY `Product Name`
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;


-- Which regions generate the highest profit?
SELECT 
Region,
SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY Region
ORDER BY Total_Profit DESC;


-- Which customer spends the most money?
SELECT 
`Customer Name`,
SUM(Sales) AS Total_Spent
FROM ecommerce_data
GROUP BY `Customer Name`
ORDER BY Total_Spent DESC
LIMIT 10;