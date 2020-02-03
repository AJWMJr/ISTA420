.echo on
.headers on
-- Name: AJ McCray
-- FIle: sql-lab02b.sql
-- Date: January 22, 2020

-- 1. Who are our customers in North America?
select customerid, companyname, country from customers where country in("Canada","USA","Mexico");
-- 2. What orders were placed in April, 1998?
select orderid, customerid, orderdate from orders where orderdate
like "1998-04%";
-- 3. What sauces do we sell?
select productname from products where productname like '%sauce%';
-- 4. You sell some kind of dried fruit that I liked very much. What is its name?
select productname from products where productname like '%dried%';
-- What employees ship products to Germany in December?
select employeeid, shippeddate, shipcountry from orders where shipcountry
like "germany" and shippeddate like "%-12-%";
/* 6. We have an issue with product 19. I need to know the total amount and the net
amount of all orders for product 19 where the customer took a discount. */
select productid, orderid, unitprice * quantity as totalprice, discount * unitprice * quantity
as amountDiscounted, (unitprice * quantity) - (discount * unitprice *quantity) as net
from order_details where productid = 19 and discount > 0;
/* 7. I need a list of employees by title,rst name, and last name, with the
employee's position under their names, and a line separating each employee. */
select titleofcourtesy || ' ' || firstname || ' ' || lastname || '
 ' || title || '
 ' from employees;
 -- 8. I need a list of our customers and thefirst name only of the customer representative.
 select companyname, substr(contactname, 1, instr(contactname, " ")) from customers;
 -- 9. Give me a list of our customer contacts alphabetically by last name.
 select substr(contactname, instr(contactname, " ") + 1) || ", " ||
 substr(contactname, 1, instr(contactname, " "))
 from customers order by substr(contactname, instr(contactname, " ") + 1);
