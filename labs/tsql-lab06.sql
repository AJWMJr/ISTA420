-- Name: AJ McCray
-- File: Tsql-lab06
-- Date: February 10, 2020

-- Write a query that returns customer and employee pairs that had order activity in January 2016 but not in February 2016
Select custid, empid, orderdate
from Sales.Orders
where month(orderdate) = 1
and year(orderdate) = 2016
except
Select custid, empid, orderdate
from Sales.Orders
where month(orderdate) = 2
and year(orderdate) = 2016
order by orderdate;

-- Write a query that returns customer and employee pairs that had order activity in both january 2016 and february 2016
Select custid, empid
from Sales.Orders
where month(orderdate) = 1
and year(orderdate) = 2016
intersect
Select custid, empid
from Sales.Orders
where month(orderdate) = 2
and year(orderdate) = 2016

-- Write a query that returns all customerand employee pairs that had activity in January, 2016 and February, 2016, but did not have activity in both Jan and Feb
(select custid, empid
from Sales.Orders
where month(orderdate) = 1
and year(orderdate) = 2016
union
select custid, empid
from Sales.Orders
where month(orderdate) = 2
and year(orderdate) = 2016)
except
(select custid, empid
from Sales.Orders
where month(orderdate) = 1
and year(orderdate) = 2016
intersect
select custid, empid
from Sales.Orders
where month(orderdate) = 2
and year(orderdate) = 2016);

-- Write a query that returns customer and empoyee pairs that had order activity in both January 2016 and Febrauary 2016 but not in 2015
(select custid, empid
from Sales.Orders
where month(orderdate) = 1
and year(orderdate) = 2016
intersect
select custid, empid
from Sales.Orders
where month(orderdate) = 2
and year(orderdate) = 2016)
except
select custid, empid
from Sales.Orders
where year(orderdate) = 2015;