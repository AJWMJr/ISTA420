/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [custid]
      ,[ordermonth]
      ,[qty]
  FROM [TSQLV4].[Sales].[CustOrders]
SELECT O.empid, O.orderdate, O.orderid, O.custid
FROM Sales.Orders AS O
INNER JOIN (SELECT empid, MAX(orderdate) AS maxorderdate
FROM Sales.Orders
GROUP BY empid) AS D
ON O.empid = D.empid
AND O.orderdate = D.maxorderdate;