---------------------------------------------------------------------
-- Microsoft SQL Server T-SQL Fundamentals
-- Chapter 07 - Beyond the Fundamentals of Querying
-- Exercises
-- © Itzik Ben-Gan 
---------------------------------------------------------------------

-- All exercises for this chapter will involve querying the dbo.Orders
-- table in the TSQLV4 database that you created and populated 
-- earlier by running the code in Listing 7-1

-- 1
-- Write a query against the dbo.Orders table that computes for each
-- customer order, both a rank and a dense rank,
-- partitioned by custid, ordered by qty 

select custid, orderid, qty,
Rank() over(
	partition by custid
	order by qty) as Rank,
dense_rank() over(
	partition by custid
	order by qty) DenseRank
from dbo.orders;

-- Desired output:
custid orderid     qty         rnk                  drnk
------ ----------- ----------- -------------------- --------------------
A      30001       10          1                    1
A      40005       10          1                    1
A      10001       12          3                    2
A      40001       40          4                    3
B      20001       12          1                    1
B      30003       15          2                    2
B      10005       20          3                    3
C      10006       14          1                    1
C      20002       20          2                    2
C      30004       22          3                    3
D      30007       30          1                    1

-- 3
-- Write a query against the dbo.Orders table that computes for each
-- customer order:
-- * the difference between the current order quantity
--   and the customer's previous order quantity
-- * the difference between the current order quantity
--   and the customer's next order quantity.

select custid, orderid, qty, 
qty - lag(qty) over(
	partition by custid
	order by orderdate, orderid) as diffprev,
qty - lead(qty) over(
	partition by custid
	order by orderdate, orderid) as diffnext
from dbo.orders;

-- Desired output:
custid orderid     qty         diffprev    diffnext
------ ----------- ----------- ----------- -----------
A      30001       10          NULL        -2
A      10001       12          2           -28
A      40001       40          28          30
A      40005       10          -30         NULL
B      10005       20          NULL        8
B      20001       12          -8          -3
B      30003       15          3           NULL
C      30004       22          NULL        8
C      10006       14          -8          -6
C      20002       20          6           NULL
D      30007       30          NULL        NULL

-- 4
-- Write a query against the dbo.Orders table that returns a row for each
-- employee, a column for each order year, and the count of orders
-- for each employee and order year
-- Tables involved: TSQLV4 database, dbo.Orders table

select empid,
count(case when orderyear = 2014 then orderyear end) as Year2014,
count(case when orderyear = 2015 then orderyear end) as Year2015,
count(case when orderyear = 2016 then orderyear end) as Year2016
from (select empid, year(orderdate) as orderyear from dbo.Orders) as D
group by empid;

select
-- Desired output:
empid       cnt2014     cnt2015     cnt2016
----------- ----------- ----------- -----------
1           1           1           1
2           1           2           1
3           2           0           2

-- 5
-- Run the following code to create and populate the EmpYearOrders table:
USE TSQLV4;

DROP TABLE IF EXISTS dbo.EmpYearOrders;

CREATE TABLE dbo.EmpYearOrders
(
  empid INT NOT NULL
    CONSTRAINT PK_EmpYearOrders PRIMARY KEY,
  cnt2014 INT NULL,
  cnt2015 INT NULL,
  cnt2016 INT NULL
);

INSERT INTO dbo.EmpYearOrders(empid, cnt2014, cnt2015, cnt2016)
  SELECT empid, [2014] AS cnt2014, [2015] AS cnt2015, [2016] AS cnt2016
  FROM (SELECT empid, YEAR(orderdate) AS orderyear
        FROM dbo.Orders) AS D
    PIVOT(COUNT(orderyear)
          FOR orderyear IN([2014], [2015], [2016])) AS P;

SELECT * FROM dbo.EmpYearOrders;

-- Output:
empid       cnt2014     cnt2015     cnt2016
----------- ----------- ----------- -----------
1           1           1           1
2           1           2           1
3           2           0           2

-- Write a query against the EmpYearOrders table that unpivots
-- the data, returning a row for each employee and order year
-- with the number of orders
-- Exclude rows where the number of orders is 0
-- (in our example, employee 3 in year 2016)

-- Desired output:
empid       orderyear   numorders
----------- ----------- -----------
1           2014        1
1           2015        1
1           2016        1
2           2015        1
2           2015        2
2           2016        1
3           2014        2
3           2016        2

-- 6
-- Write a query against the dbo.Orders table that returns the 
-- total quantities for each:
-- employee, customer, and order year
-- employee and order year
-- customer and order year
-- Include a result column in the output that uniquely identifies 
-- the grouping set with which the current row is associated
-- Tables involved: TSQLV4 database, dbo.Orders table

-- Desired output:
groupingset empid       custid orderyear   sumqty
----------- ----------- ------ ----------- -----------
0           2           A      2014        12
0           3           A      2014        10
4           NULL        A      2014        22
0           2           A      2015        40
4           NULL        A      2015        40
0           3           A      2016        10
4           NULL        A      2016        10
0           1           B      2014        20
4           NULL        B      2014        20
0           2           B      2015        12
4           NULL        B      2015        12
0           2           B      2016        15
4           NULL        B      2016        15
0           3           C      2014        22
4           NULL        C      2014        22
0           1           C      2015        14
4           NULL        C      2015        14
0           1           C      2016        20
4           NULL        C      2016        20
0           3           D      2016        30
4           NULL        D      2016        30
2           1           NULL   2014        20
2           2           NULL   2014        12
2           3           NULL   2014        32
2           1           NULL   2015        14
2           2           NULL   2015        52
2           1           NULL   2016        20
2           2           NULL   2016        15
2           3           NULL   2016        40

(29 row(s) affected)

-- When you're done, run the following code for cleanup
DROP TABLE IF EXISTS dbo.Orders;
DROP TABLE IF EXISTS dbo.EmpYearOrders;
DROP TABLE IF EXISTS dbo.EmpCustOrders;
