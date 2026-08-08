-- ================================================
-- RETAIL SALES – COMPLETE SQL PIPELINE (SQLite)
-- ================================================

-- 1. View sample data
SELECT * FROM retail_sales LIMIT 10;

-- 2. Row count
SELECT COUNT(*) AS total_rows FROM retail_sales;

-- 3. NULL check
SELECT
    SUM(CASE WHEN SALES IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN ORDERDATE IS NULL THEN 1 ELSE 0 END) AS null_dates,
    SUM(CASE WHEN QUANTITYORDERED IS NULL THEN 1 ELSE 0 END) AS null_quantity
FROM retail_sales;

-- 4. Fix missing values
UPDATE retail_sales
SET QUANTITYORDERED = 0
WHERE QUANTITYORDERED IS NULL;

UPDATE retail_sales
SET PRICEEACH = 0
WHERE PRICEEACH IS NULL;

UPDATE retail_sales
SET SALES = QUANTITYORDERED * PRICEEACH
WHERE SALES IS NULL;

-- 5. Remove duplicates
DELETE FROM retail_sales
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM retail_sales
    GROUP BY ORDERNUMBER, PRODUCTCODE, ORDERLINENUMBER
);

-- 6. Fix date format BEFORE aggregation
UPDATE retail_sales
SET ORDERDATE =
    substr(ORDERDATE, 7, 4) || '-' ||
    substr(ORDERDATE, 1, 2) || '-' ||
    substr(ORDERDATE, 4, 2)
WHERE ORDERDATE LIKE '%/%';

-- 7. Verify date range
SELECT
    MIN(ORDERDATE) AS min_date,
    MAX(ORDERDATE) AS max_date
FROM retail_sales;

-- 8. Monthly Revenue
SELECT
    strftime('%Y-%m', ORDERDATE) AS Month,
    SUM(SALES) AS MonthlyRevenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- 9. 3-Month Moving Average
SELECT
    Month,
    MonthlyRevenue,
    AVG(MonthlyRevenue) OVER (
        ORDER BY Month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAvg_3Months
FROM (
    SELECT
        strftime('%Y-%m', ORDERDATE) AS Month,
        SUM(SALES) AS MonthlyRevenue
    FROM retail_sales
    GROUP BY Month
);

-- 10. Forecast-ready table
DROP TABLE IF EXISTS monthly_sales;

CREATE TABLE monthly_sales AS
SELECT
    strftime('%Y-%m', ORDERDATE) AS Month,
    SUM(SALES) AS MonthlyRevenue
FROM retail_sales
GROUP BY Month
ORDER BY Month;

SELECT * FROM monthly_sales;

-- 11. Revenue by Product Line
SELECT
    PRODUCTLINE,
    ROUND(SUM(SALES), 2) AS Revenue,
    ROUND(100.0 * SUM(SALES) / (SELECT SUM(SALES) FROM retail_sales), 1) AS RevenuePct
FROM retail_sales
GROUP BY PRODUCTLINE
ORDER BY Revenue DESC;

-- 12. Revenue by Territory
SELECT
    TERRITORY,
    ROUND(SUM(SALES), 2) AS Revenue,
    ROUND(100.0 * SUM(SALES) / (SELECT SUM(SALES) FROM retail_sales), 1) AS RevenuePct
FROM retail_sales
GROUP BY TERRITORY
ORDER BY Revenue DESC;

-- 13. Revenue by Deal Size
SELECT
    DEALSIZE,
    ROUND(SUM(SALES), 2) AS Revenue,
    ROUND(100.0 * SUM(SALES) / (SELECT SUM(SALES) FROM retail_sales), 1) AS RevenuePct
FROM retail_sales
GROUP BY DEALSIZE
ORDER BY Revenue DESC;
