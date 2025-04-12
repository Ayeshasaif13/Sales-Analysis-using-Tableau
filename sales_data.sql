-- Full dataset preview
SELECT * 
FROM [dbo].[sales_data_sample];


-- Unique values across important columns

SELECT DISTINCT status 
FROM [dbo].[sales_data_sample]; 

SELECT DISTINCT year_id 
FROM [dbo].[sales_data_sample]; 

SELECT DISTINCT PRODUCTLINE 
FROM [dbo].[sales_data_sample]; 

SELECT DISTINCT COUNTRY 
FROM [dbo].[sales_data_sample]; 

SELECT DISTINCT TERRITORY 
FROM [dbo].[sales_data_sample]; 

SELECT DISTINCT MONTH_ID 
FROM [dbo].[sales_data_sample] 
WHERE year_id = 2003;

SELECT DISTINCT DEALSIZE 
FROM [dbo].[sales_data_sample]; 



-- ==== ANALYSIS ==== --

SELECT YEAR_ID, SUM(sales) Revenue
FROM [dbo].[sales_data_sample]
GROUP BY YEAR_ID
ORDER BY Revenue DESC;

SELECT DEALSIZE, SUM(sales) Revenue
FROM [PortfolioDB].[dbo].[sales_data_sample]
GROUP BY DEALSIZE
ORDER BY Revenue DESC;

SELECT PRODUCTLINE, SUM(sales) Revenue
FROM [dbo].[sales_data_sample]
GROUP BY PRODUCTLINE
ORDER BY Revenue DESC;

SELECT MONTH_ID, SUM(sales) Revenue, COUNT(ORDERNUMBER) Frequency
FROM [PortfolioDB].[dbo].[sales_data_sample]
WHERE YEAR_ID = 2004
GROUP BY MONTH_ID
ORDER BY Revenue DESC;

SELECT MONTH_ID, PRODUCTLINE, SUM(sales) Revenue, COUNT(ORDERNUMBER) Orders
FROM [PortfolioDB].[dbo].[sales_data_sample]
WHERE YEAR_ID = 2004 AND MONTH_ID = 11
GROUP BY MONTH_ID, PRODUCTLINE
ORDER BY Revenue DESC;


-- ==== EXTRA INSIGHTS ==== --

SELECT CITY, SUM(sales) Revenue
FROM [PortfolioDB].[dbo].[sales_data_sample]
WHERE COUNTRY = 'UK'
GROUP BY CITY
ORDER BY Revenue DESC;

SELECT COUNTRY, YEAR_ID, PRODUCTLINE, SUM(sales) Revenue
FROM [PortfolioDB].[dbo].[sales_data_sample]
WHERE COUNTRY = 'USA'
GROUP BY COUNTRY, YEAR_ID, PRODUCTLINE
ORDER BY Revenue DESC;
