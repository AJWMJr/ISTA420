-- 1. What is the order number and the date of each order sold by each employee?
select FirstName + ' ' + LastName as Employee, OrderID, OrderDate from Orders as O join Employees as E on O.EmployeeID = E.EmployeeID;

-- 2. List each territory by region.

select RegionDescription, TerritoryDescription from Region as R join Territories as T on R.RegionID = T.RegionID order by RegionDescription;

-- 3. What is the supplier name for each product alphabetically by supplier?

select CompanyName, ProductName from Suppliers as S join Products as P on S.SupplierID = P.SupplierID order by CompanyName;

-- 4. For every order on May 5, 1998, how many of each item was ordered, and what was the price of the item?

select ProductName, sum(Quantity) as TotalSold, sum(OD.UnitPrice * Quantity) as Price
	from [Order Details] as OD 
	join Orders as O on OD.OrderID = O.OrderID
	join Products as P on OD.ProductID = P.ProductID
	where OrderDate = ('1998-05-05')
	group by OD.ProductID, ProductName;

-- 5. For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and what was the price of the item?select ProductName, sum(Quantity) as TotalSold, avg(OD.UnitPrice) as Price
	from [Order Details] as OD 
	join Orders as O on OD.OrderID = O.OrderID
	join Products as P on OD.ProductID = P.ProductID
	where OrderDate = ('1998-05-05')
	group by OD.ProductID, ProductName;

-- 6. For every order in May, 1998, what was the customer’s name and the shipper’s name?select OrderID, ShipName as Customer, S.CompanyName as Shipper 	from Orders as O join Shippers as S on O.ShipVia = S.ShipperID 	where cast(OrderDate as varchar) like '%5 1998%'; -- 7. What is the customer’s name and the employee’s name for every order shipped to France?select OrderID, LastName + ', ' + FirstName as Employee, ShipName as Customer 	from Orders as O join Employees as E on O.EmployeeID = E.EmployeeID 	where ShipCountry like 'France' order by LastName;-- 8. List the products by name that were shipped to Germanyselect ProductName from Products as P 	join [Order Details] as OD on P.ProductID = OD.ProductID 	join Orders as O on OD.OrderID = O.OrderID 	where ShipCountry = 'Germany' 	group by ProductName;select LastName + ', ' + FirstName as Employee, count(O.OrderID) as Sales, format(Sum(UnitPrice * Quantity), 'N0')	from Orders as O join Employees as E on O.EmployeeID = E.EmployeeID	join [Order Details] as OD on O.OrderID = OD.OrderID 	where ShippedDate is not null;	Group by LastName, FirstName order by LastName;