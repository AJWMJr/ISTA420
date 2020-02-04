/* 1. What is our highest priced product? Report the product id, product name, and unit price. Use a self-contained, scalar valued subquery. */
select productid, productName, unitprice 
from Production.Products 
where unitprice = (
	select max(unitprice) 
	from Production.Products); 

/* 2. What is our most popular product in terms of quantity sold? Report the product name and product
id. Use a self-contained, scalar valued subquery. */
select productid, productname from Production.Products where productid =(
	select top 1 productid 
	from Sales.OrderDetails 
	group by productid 
	order by sum(qty) desc);

/* 3. Who is our top salesperson overall? Include the employee id, title, first name, and last name. Use a
self-contained, scalar valued subquery. */
select empid, title + ' ' + firstname + ' ' + lastname as Employee
from HR.Employees
where empid = (
	select top 1 empid 
	from Sales.Orders 
	group by empid 
	order by count(orderid) desc);

/* 4. I want to examine the individual orders. Specifically, I want to look at each order and compare the
total of each order line with the average total of all order lines in the order. Report the order id, the
total of each order line, and the average of all order lines for each order. Use a correlated, scalar valued
subquery. */
select orderid, (unitprice * qty) as 'Line Total', (
	select avg(unitprice * qty)
	from sales.OrderDetails ood
	where od.orderid = ood.orderid
)as 'Order Average'
from Sales.OrderDetails od;

/* 5. What is the largest quantity ordered by a customer for every order? Report the order id, the product
id, and the quantity ordered. Use a correlated subquery in the WHERE clause. */
select od.orderid, od.productid, od.qty 
from Sales.OrderDetails od
where qty = (
	select max(ood.qty) 
	from Sales.OrderDetails ood
	where ood.orderid = od.orderid)
order by od.orderid;

/* 6. I need to see all orders placed on the first day of the month. Report the order id, the customer id, the
employee id, and the order date. Use a correlated, scalar valued subquery in the WHERE clause. */
select orderid, custid, empid,  DATENAME(month,orderdate) + ' ' + cast(year(orderdate) as varchar) as MonthOfOrder
from Sales.Orders O
where day(orderdate) = 1
order by orderdate;

/* 7. What orders requested beverages? Report the ordeer id and the product id. Use nested self-contained,
scalar valued subqueries in the WHERE clause. */
select od.orderid, od.productid 
from Sales.OrderDetails od
where od.productid in (
	select productid
	from Production.Products p
	where p.categoryid = (
		select c.categoryid 
		from Production.Categories c
		where c.categoryname like 'Bev%'))
order by orderid;

/* 8. I need a list of all our foreign suppliers, i.e., non-American. Include the supplier id, supplier name,
and country. Use a self-contained, list valued subquery. */
select supplierid, companyname, country 
from Production.Suppliers s
where s.country not in (
	select ss.country
	from Production.Suppliers ss
	where ss.country like 'USA');

/* Report the name of all meat and poultry products. Use nested subqueries. The outer nested subquery is
a self-contained, list valued subqueery. The inner subquery is a scalar valued, self-contained subquery. */
select productname 
from Production.Products p
where p.categoryid = (
	select c.categoryid
	from Production.Categories c
	where categoryname like 'meat%');