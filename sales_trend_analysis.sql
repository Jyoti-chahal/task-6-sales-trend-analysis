******** TASK 6: Sales Trend Analysis Using Aggregations  ************

******** Objective: Analyze monthly revenue and order volume. ********



SELECT * FROM online_sales_orders


--Check for Missing or Invalid Data

SELECT * FROM online_sales_orders WHERE order_date IS NULL OR amount IS NULL



--  Main Monthly Sales Trend
-- This query calculates total monthly revenue and order volume
-- Grouped by year and month using SQL Server functions

SELECT
    YEAR(order_date) AS order_year,  -- Extract year from order_date
    MONTH(order_date) AS order_month,  -- Extract month from order_date
    SUM(amount) AS total_revenue,  -- Total revenue (sum of 'amount')
    COUNT(DISTINCT order_id) AS order_volume  -- Count of unique orders
FROM
    online_sales_orders
WHERE
    order_date BETWEEN '2022-01-01' AND '2022-12-31'  -- Filter data for 2022
GROUP BY
    YEAR(order_date),  -- Group by year
    MONTH(order_date)  -- Group by month
ORDER BY
    order_year, order_month;  -- Sort by year and month  
    
    
-- Highest Revenue Month
-- This query finds the month with the highest total revenue

SELECT TOP 1
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM
    online_sales_orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    total_revenue DESC    
    
    
-- Lowest Order Volume Month
-- This query finds the month with the lowest number of distinct orders

SELECT TOP 1
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales_orders
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_volume ASC    