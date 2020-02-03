select distinct RegionDescription, LastName + ', ' + FirstName as Employee, S.CompanyName as Supplier, ProductName from Orders as O
	join [Order Details] as OD on O.OrderID = OD.OrderID
	join Products as P on OD.ProductID = P.ProductID
	join Employees as E on E.EmployeeID = O.EmployeeID
	join Suppliers as S on P.SupplierID = S.SupplierID
	join EmployeeTerritories as ET on E.EmployeeID = ET.EmployeeID
	join Territories as T on ET.TerritoryID = T.TerritoryID
	join Region as R on R.RegionID = T.RegionID
	where S.Country = 'Germany'
	order by RegionDescription;
