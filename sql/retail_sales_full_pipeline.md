

#  ***RETAIL SALES – COMPLETE SQL PIPELINE (SQLITE)***





**-- 1. View sample data**

SELECT \* FROM retail\_sales LIMIT 10;



**-- 2. Row count**

SELECT COUNT(\*) AS total\_rows FROM retail\_sales;



**-- 3. NULL check**

SELECT

&nbsp;   SUM(CASE WHEN SALES IS NULL THEN 1 ELSE 0 END) AS null\_sales,

&nbsp;   SUM(CASE WHEN ORDERDATE IS NULL THEN 1 ELSE 0 END) AS null\_dates,

&nbsp;   SUM(CASE WHEN QUANTITYORDERED IS NULL THEN 1 ELSE 0 END) AS null\_quantity

FROM retail\_sales;



**-- 4. Fix missing values**

UPDATE retail\_sales

SET QUANTITYORDERED = 0

WHERE QUANTITYORDERED IS NULL;



UPDATE retail\_sales

SET PRICEEACH = 0

WHERE PRICEEACH IS NULL;



UPDATE retail\_sales

SET SALES = QUANTITYORDERED \* PRICEEACH

WHERE SALES IS NULL;



**-- 5. Remove duplicates**

DELETE FROM retail\_sales

WHERE rowid NOT IN (

&nbsp;   SELECT MIN(rowid)

&nbsp;   FROM retail\_sales

&nbsp;   GROUP BY ORDERNUMBER, PRODUCTCODE, ORDERLINENUMBER

);



**-- 6. Fix date format BEFORE aggregation**

UPDATE retail\_sales

SET ORDERDATE =

&nbsp;   substr(ORDERDATE, 7, 4) || '-' ||

&nbsp;   substr(ORDERDATE, 1, 2) || '-' ||

&nbsp;   substr(ORDERDATE, 4, 2)

WHERE ORDERDATE LIKE '%/%';



**-- 7. Verify date range**

SELECT

&nbsp;   MIN(ORDERDATE) AS min\_date,

&nbsp;   MAX(ORDERDATE) AS max\_date

FROM retail\_sales;



**-- 8. Monthly Revenue**

SELECT

&nbsp;   strftime('%Y-%m', ORDERDATE) AS Month,

&nbsp;   SUM(SALES) AS MonthlyRevenue

FROM retail\_sales

GROUP BY Month

ORDER BY Month;



**-- 9. Moving Average**

SELECT

&nbsp;   Month,

&nbsp;   MonthlyRevenue,

&nbsp;   AVG(MonthlyRevenue) OVER (

&nbsp;       ORDER BY Month

&nbsp;       ROWS BETWEEN 2 PRECEDING AND CURRENT ROW

&nbsp;   ) AS MovingAvg\_3Months

FROM (

&nbsp;   SELECT

&nbsp;       strftime('%Y-%m', ORDERDATE) AS Month,

&nbsp;       SUM(SALES) AS MonthlyRevenue

&nbsp;   FROM retail\_sales

&nbsp;   GROUP BY Month

);



# **-- 10. Forecast-ready table**

DROP TABLE IF EXISTS monthly\_sales;



CREATE TABLE monthly\_sales AS

SELECT

&nbsp;   strftime('%Y-%m', ORDERDATE) AS Month,

&nbsp;   SUM(SALES) AS MonthlyRevenue

FROM retail\_sales

GROUP BY Month

ORDER BY Month;



SELECT \* FROM monthly\_sales;



