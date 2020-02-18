.echo on
.headers on
-- Name: AJ McCray
-- File: tsql-quiz03
-- Date: February 4, 2020

/* 1. Write a report giving the employee id, first name, last name, and the average amount of all orders by
that employee. */
select o.EmployeeID, FirstName || ' ' || LastName as Employee, avg(unitprice * Quantity) as AverageOrders
from Orders o
join Employees e
on o.employeeid = e.employeeid
join order_details od
on o.orderid = od.orderid
group by o.EmployeeID, FirstName, LastName;

/* 2. Write a report that lists our product categories and the average price of all products of that category.
Include the category id, the category name, and the average price. */
select c.CategoryID, categoryname, avg(unitprice) as AveragePrice
from categories c
join products p
on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName;

/* 3. In some cities, we have customers, suppliers, and employees. Write a report that lists the customer’s
contact name, the supplier’s contact name, the employee’s name, and the city in which all three are
located. */
select c.contactname as 'Customer Contact', s.contactname as 'Supplier Contact', firstname || ' ' || lastname as Employee, c.city
from Customers c
join Employees e
on c.city = e.city
join Suppliers s
on s.city = c.city;
