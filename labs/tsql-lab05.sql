-- Name: AJ McCray
-- File: tsql-lab05.sql
-- Date: February 4, 2020
use TSQLV4

/* 1. Write a report returning the order id, the shipper name, the order date and the city shipped to using
a derived table */
select orderid, shipper_name, orderdate, shipcity
from (
	select o.orderid, o.orderdate, o.shipcity, (
		select companyname
		from Sales.Shippers s
		where o.shipperid = s.shipperid) as shipper_name
	from Sales.Orders o) O;

/* 2. I need a report showing how many orders each customer made during each year. Return the customer
id, the year, and the number of orders the customer placed during that year. Use a derived table */
select o.custid, orderdate as OrderYear, numOrders
from (
	select custid, year(orderdate) as orderdate, count(orderid) as numOrders
	from Sales.Orders
	group by custid, year(orderdate)) o;

/* 3. What is the growth or decline in the number of orders taken year by year? Your report should contain
the year, this years order’s, last year’s orders, and the difference between the two. Join two derived
tables */
select orderyear, curorders, pastorders, curorders - pastorders as Growth
From (
	select year(orderdate) as orderyear, count(orderid) as curorders
	from Sales.Orders
	group by year(orderdate)) p
left join (
	select year(orderdate) as pastorderyear, count(orderid) as pastorders
	from Sales.Orders
	group by year(orderdate)
) p2
on p2.pastorderyear = p.orderyear - 1;

/* 4. Using a CTE, give e a list of all our non-American suppliers. I need the supplier id, the supplier name,
and the country. Alphabetize the countries. */
with sup as (
	select supplierid, companyname, country
	from Production.Suppliers
	where country not like '%USA%')
select supplierid, companyname, country
from sup
order by country;

/* 5. What is the growth or decline in the number of orders taken year by year? Your report should contain
the year, this years order’s, last year’s orders, and the difference between the two. Join two CTEs. */
with salesRepA as (
	)
with salesRepB as (
	)
select *
from salesRepA
join salesRepB
on;

/* 6. Create a view that aggregates the number of orders per customer per year. Then run a query against
the view sorting the customers by customer id. Don’t forget to drop the view if one exists before you
create it. Use the DBO schema. */
drop view if exists dbo.coy;
go
create view dbo.coy
as
select custid as customer, year(orderdate) as Oyear, count(orderid) as numorders
from Sales.Orders
group by custid, year(orderdate);
go
select customer, Oyear, numorders
from coy
order by customer;

/* 7. Create a view similar to the Production.Products table, but include the category name as a column.
Use the DBO schema. This is an example of denormalizing a database table. After going to all the
trouble of normalizing a database, can you think of a good reason to denormalize it? */
drop view if exists dbo.prod;
go
create view dbo.prod
as
select *, (
	select categoryname
	from Production.Categories c
	where c.categoryid = p.categoryid) as Category
from Production.Products p;
go
select productname, Category, unitprice from prod;

/* 8. Create an inline table valued function that takes a product id as an argument and returns the sales of
the product by month. Disregard the year. We want to see what products are more commonly sold
durig particular months. Use the DBO schema. Run a query against your TFV to see if it works. */
