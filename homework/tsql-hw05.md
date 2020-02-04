# TSQL Homework 5

#### --AJ McCray

1. a query expression that represents a valid relational table
2. The FROM clause
3. their scope of existence extends into but not beyond the outer query
4. WITH
5. yes
6. yes
7. yes
8. protects a view from invalid inputs
9. protects a view from removal of referenced objects. it helps ensure the integrity of the view
10. a paramaterized view
11. a join for table expressions
12. cross apply: from sales.shippers as s cross apply hr.employees as e; and outer apply: sales.customers as c outer apply (select top 3 orderid, empid from sales,orders as O where o.custid = c.custid)as a
