-- Use [Portfolio 1]
 -- select * from dbo.Ecommercedata

--Number of records
select count(*) As 'EcommerceData' from dbo.Ecommercedata


--Total Revenue for each invoice
select invoiceno, sum (quantity*unitprice) As revenue
from dbo.Ecommercedata
group by invoiceNo


--Top 10 products by revenue
select top 10 description, stockCode, sum (quantity*unitprice) As revenue
from dbo.Ecommercedata
group by description, stockCode
order by revenue desc


--Top 10 customers by Total Spending
select Top 10 customerId, sum (quantity*unitprice) As TotalSpending
from dbo.Ecommercedata
group by CustomerID
order by TotalSpending desc


-- Number of unique customers by country
Select country, count(distinct CustomerID) As UniqueCustomers
from dbo.Ecommercedata
group by country


-- Numbers of orders and total revenue by Month
SELECT YEAR(InvoiceDate) AS year, MONTH(InvoiceDate) AS month, COUNT(DISTINCT invoiceNo) AS orders, SUM(quantity*unitprice) AS revenue
FROM dbo.Ecommercedata
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate);


-- Top 5 countries by revenue:
select Top 5 Country, sum(quantity*unitprice) As TotalRevenue
from dbo.Ecommercedata
group by country
order by TotalRevenue desc


-- Total revenue for each year:
select Year(invoicedate) As year,
Sum(quantity*unitprice) As TotalRevenue
from dbo.Ecommercedata
group by (InvoiceDate)


-- Top 5 products by quantity (Sold):
select Top 10 description, Sum(quantity*unitprice) As TotalQuantitySold
from dbo.Ecommercedata
group by description
order by TotalQuantitySold desc


-- Top 5 products by revenue:
select Top 5 description, sum(quantity*unitprice) As TotalRevenue
from dbo.Ecommercedata
group by description
order by TotalRevenue DESC


--Average revenue per order by Month:
select year(InvoiceDate) AS Year,
month (InvoiceDate) as Month,
Avg(quantity*unitprice) As Average_revenue_per_order
from dbo.Ecommercedata
group by YEAR (InvoiceDate), Month(InvoiceDate) 


--Top 10 cutomers by order count:
select Top 10 customerId, count(distinct InvoiceNO) As OrderCount
from dbo.Ecommercedata
group by CustomerID
order by OrderCount Desc

