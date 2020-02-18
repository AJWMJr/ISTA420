select custid, companyname, contactname
from Sales.Customers
where custid in (
	(select custid
	from Sales.Orders
	where year(orderdate) = 2015
	intersect
	select custid
	from Sales.Orders
	where year(orderdate) = 2016)
	except
	select custid
	from Sales.Orders
	where year(orderdate) = 2014);