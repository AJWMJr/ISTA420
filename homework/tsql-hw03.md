#### TSQL Homework 3

1. So that you can access data from both tables in a single query

2. functions like a cross join but uses predicate logic (often pairing to columns with each other) to filter the results.

3. uses predicate logic to append the the non preserved table's rows to the preserved table's rows and uses null placeholders to include rows in the preserved table where there wasn't a match to the non-preserved table rows.

4. Two tables are combined by adding every row of the second table to every row of the first table. This leads to excessively large tables

5. Objects have inner and outer join types 

6. FROM OrderDetails AS OD INNER JOIN OrderDetailsAudit AS ODA ON OD.orderid =ODA.orderid AND OD.productid = ODA.productid

7.  In query one the count function is called for all columns which will return the number of rows. While in query two the count function is called on orderid and will more acurately count the number of orders.

8. O.custid does not exist.
