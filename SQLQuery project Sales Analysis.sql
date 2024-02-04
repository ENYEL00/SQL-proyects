USE [Sales Analysis];
SELECT * FROM Superstore;	--General view of the data

SELECT COUNT(*) FROM Superstore;	--Looking for duplicate values
SELECT DISTINCT COUNT(*) FROM Superstore;	--There is not duplicate data

--	Analysis Queries


SELECT Order_Date, Ship_date, Datediff(DAY,Order_Date,Ship_Date) AS Diff_date FROM Superstore
GROUP BY Order_Date, Ship_Date;
--Answer time since Order Date


SELECT AVG(Datediff(Day,Order_Date,Ship_Date)) AS AVG_diff_date FROM Superstore;
--Average of days since Order date until ship date


select Ship_Mode, COUNT(*) AS orders_per_ShipMode FROM Superstore
GROUP BY Ship_Mode;		--Count of orders per ship mode


SELECT Ship_Mode, AVG(DATEDIFF(Day,Order_Date,Ship_Date)) FROM Superstore
GROUP BY Ship_Mode;	--Average of days of ship per Ship mode


SELECT YEAR(Ship_Date) AS Ship_year, DateName(MONTH,Ship_Date) AS Ship_Month, Ship_Mode, COUNT(*) AS number_oders FROM Superstore
Group BY Ship_Mode, YEAR(Ship_Date), DateName(MONTH,Ship_Date);	--Number of orders per Ship mode, Ship month and yeaR




SELECT DISTINCT States FROM Superstore;	--Get know how many states there are


SELECT States, COUNT(*) AS Segment_consumer from Superstore
WHERE Segment = 'Consumer'
GROUP BY States;		--How many segment consumer there are per state

SELECT States, COUNT(*) AS Segment_corporate From Superstore
WHERE Segment = 'Corporate'
GROUP BY States;		--How many segment Corporate there are per state

SELECT States, COUNT(*) AS Segment_Office From Superstore
WHERE Segment = 'Home Office'
GROUP BY States;		--How many segment Home Office there are per state

SELECT Region, SUM(Profit) AS Sum_profit FROM Superstore 
GROUP BY Region;	--See the region profitable


SELECT DISTINCT Category FROM Superstore;	--Different Categories

SELECT States, SUM(Sales) AS SUM_SALES FROM Superstore
WHERE Category = 'Office Supplies'
GROUP BY States;	--Sum of sales of Office Supplies Category per state

SELECT States, SUM(Sales) AS SUM_SALES FROM Superstore
WHERE Category = 'Furniture'
GROUP BY States;	--Sum of sales of Furniture Category per state

SELECT States, SUM(Sales) AS SUM_SALES FROM Superstore
WHERE Category = 'Technology'
GROUP BY States;	--Sum of sales of Technology Category per state


--Sales sum of category per region
SELECT Region, Category, SUM(Sales) AS Sales FROM Superstore
Where Region = 'South'
GROUP BY Region,Category;

SELECT Region, Category, SUM(Sales) AS Sales FROM Superstore
Where Region = 'West'
GROUP BY Region,Category;

SELECT Region, Category, SUM(Sales) AS Sales FROM Superstore
Where Region = 'East'
GROUP BY Region, Category;

SELECT Region, Category, SUM(Sales) AS Sales FROM Superstore
Where Region = 'North'
GROUP BY Region, Category;

SELECT Region, Category, SUM(Sales) AS Sales FROM Superstore
Where Region = 'Central'
GROUP BY Region, Category;


--Sales and percentage sum of subcategory per region and state
sELECT DISTINCT Sub_Category From Superstore;

SELECT Category, Sub_Category, SUM(Sales) as SUM_SALES, CONCAT(ROUND(Cast(COUNT(*) as float)/
(SELECT CAST(COUNT(*) AS float) FROM Superstore) * 100, 2),'%') AS porcentaje from Superstore
GROUP BY Category, Sub_Category;    --Sum of sales and its percentage representing

SELECT States ,Sub_category, SUM(Sales) AS Sum_Sales, CONCAT(ROUND(SUM(Sales)/
(SELECT Sum(Sales) FROM Superstore) * 100,2),'%') as percentages
FROM Superstore
GROUP BY States, Sub_Category;    --Sum of sales and its percentage representing per state

SELECT Region, Sub_category, SUM(Sales) AS Sum_Sales, CONCAT(ROUND(SUM(Sales)/
(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') as percentages
FROM Superstore
GROUP BY Region, Sub_Category;    --Sum of sales and its percentage representing per Region



--SUM of sales and its percentage representing against its category and total


SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' and YeaR(Order_Date) = '2014') * 100),2),'%') AS Percentages_Furniture_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2014'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Furniture category in 2014 per month


SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' and YeaR(Order_Date) = '2015') * 100),2),'%') AS Percentages_Furniture_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2015'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Furniture category in 2016 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' and YeaR(Order_Date) = '2016') * 100),2),'%') AS Percentages_Furniture_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2016'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Furniture category in 2016 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' and YeaR(Order_Date) = '2017') * 100),2),'%') AS Percentages_Furniture_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2017'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Furniture category in 2017 per month



SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2014') * 100),2),'%') AS Percentages_OfficeSupplies_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2014'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Office Supplies category in 2014 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2015') * 100),2),'%') AS Percentages_OfficeSupplies_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2015'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Office Supplies category in 2015 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2016') * 100),2),'%') AS Percentages_OfficeSupplies_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2016'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Office Supplies category in 2016 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2017') * 100),2),'%') AS Percentages_OfficeSupplies_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2017'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Office Supplies category in 2017 per month



SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' AND YEAR(Order_Date) = '2014') * 100),2),'%') AS Percentages_Technology_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Technology' AND YEAR(Order_Date) = '2014'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Technology category in 2014 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' AND YEAR(Order_Date) = '2015') * 100),2),'%') AS Percentages_Technology_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Technology' AND YEAR(Order_Date) = '2015'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Technology category in 2015 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' AND YEAR(Order_Date) = '2016') * 100),2),'%') AS Percentages_Technology_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Technology' AND YEAR(Order_Date) = '2016'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Technology category in 2016 per month

SELeCT Category, DATENAME(YEAR,Order_Date) as YEARS, DATENAME(MONTH,Order_Date) AS MONTHS, SUM(Sales) AS Sum_Sales, 
CONCAT(round((SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' AND YEAR(Order_Date) = '2017') * 100),2),'%') AS Percentages_Technology_category,
CONCAT(round(SUM(SALES)/(SELECT SUM(Sales) FROM Superstore) * 100,2),'%') AS Percentage_total
FROM Superstore
WHERE Category = 'Technology' AND YEAR(Order_Date) = '2017'
GROUP BY Category, DATENAME(MONTH,Order_Date), DATENAME(YEAR,Order_Date), MONTH(Order_Date); --Sum of sales and percentages of Technology category in 2017 per month



--SUM of sales and its percentage per quater of category and total

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES,SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2014'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);       --SUM of sales Office Supplies category per quarter in 2014

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2015'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);       --SUM of sales per category per quarter in 2015

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2016'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);      --SUM of sales per category per quarter in 2016

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Office Supplies' AND YEAR(Order_Date) = '2017'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2017



SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' AND  YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2014'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2014

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' AND  YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2015'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2015

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' AND  YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2016'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2016

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Furniture' AND  YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Furniture' AND YEAR(Order_Date) = '2017'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2017



SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' and YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Technology' and year(Order_Date) = '2014'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2014

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' and YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Technology' and year(Order_Date) = '2015'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2015

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' and YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Technology' and year(Order_Date) = '2016'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2016

SELECT Category, Datename(YEAR,Order_Date) AS YEAR_SALES,
CONCAT('Q',DATENAME(QUARTER,Order_Date)) AS QUARTER_SALES, SUM(Sales) AS SUM_SALES,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore WHERE Category = 'Technology' and YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentage_OfficeSupplies_category,
CONCAT(ROUND(SUM(Sales)/(SELECT SUM(Sales) FROM Superstore)*100, 2),'%') AS Percentage_total_in_quarter
FROM Superstore
WHERE Category = 'Technology' and year(Order_Date) = '2017'
GROUP BY Category, Datename(YEAR,Order_Date),DATENAME(QUARTER,Order_Date);	--SUM of sales per category per quarter in 2017



--Sum of sales and it percentages per month and year of every subcategory

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Supplies in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS percentages
FROM Superstore
WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Supplies in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Supplies in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Supplies' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Supplies in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Storage in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Storage in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Storage in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Storage' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Storage in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Phones in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Phones in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Phones in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Phones' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Phones in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Fasteners in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Fasteners in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Fasteners in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Fasteners' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Fasteners in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Copiers in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Copiers in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Copiers in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Copiers' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Copiers in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Chairs in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2015') * 100,2),'%') as Percentages
FROM Superstore
WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Chairs in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Chairs in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Chairs' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Chairs in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Bookcases in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Bookcases in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Bookcases in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Bookcases' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Bookcases in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Machines in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Machines in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Machines in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Machines' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Machines in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Art in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Art in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Art in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Art' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Art in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Envelopes in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Envelopes in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Envelopes in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2017') * 100,2),'%') as Percentages
FROM Superstore
WHERE Sub_Category = 'Envelopes' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Envelopes in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2014') * 100,2),'%') as Percentages
FROM Superstore
WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Binders in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Binders in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2016') * 100,2),'%') as Percentages
FROM Superstore
WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Binders in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Binders' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Binders in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2014') * 100,2),'%') as Percentages
FROM Superstore
WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Labels in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Labels in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2016') * 100,2),'%') as Percentages
FROM Superstore
WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Labels in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Labels' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Labels in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Furnishings in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Furnishings in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Furnishings in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Furnishings' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Furnishings in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Accesories in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Accesories in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Accesories in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Accesories' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Accesories in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Paper in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Paper in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Paper in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Paper' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Paper in 2017



SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2014') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2014'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Tables in 2014

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2015') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2015'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Tables in 2015

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2016') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2016'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Tables in 2016

SELECT Sub_Category, DATENAME(YEAR, Order_Date) AS Years, DATENAME(MONTH, Order_Date) AS Months,
SUM(Sales) AS Sum_sales, 
CONCAT(ROUND(SUM(Sales)/(SELECT Sum(Sales) FROM Superstore WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2017') * 100,2),'%') AS Percentages
FROM Superstore
WHERE Sub_Category = 'Tables' AND YEAR(Order_Date) = '2017'
GROUP BY Sub_Category, DATENAME(YEAR, Order_Date), DATENAME(MONTH, Order_Date), MONTH(Order_Date);    --Sales per month of subcategory Tables in 2017

