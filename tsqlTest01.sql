.echo on
.headers on

-- Name: AJ McCray
-- File: tsqlTest01.sql
-- Date: January 22, 2020

-- 1. List the company name, the contact name and the country of all customers in Poland.
 select companyname, contactname, country from customers;
-- 2. List the order Id, the order date, and the destination city of all orders shipped to Berlin
 select orderid, orderdate, shipcity from orders where shipcity like 'berlin';
 -- 3. How many boxes of Filo Mix do we have in stock?
select productname, unitsinstock from products where productname like 'Filo Mix';
-- 4. List the telephone numbers of all of our shippers
select companyname, phone from shippers;
-- 5. Who is our oldest employee? Who is our youngest employee?
select firstname, lastname, birthdate from employees order by birthdate asc limit 1;
select firstname, lastname, birthdate from employees order by birthdate desc limit 1;
-- 6. List the suppliers where the owner of the supplier is also the sales contact.
select companyname, contactname, contacttitle from suppliers where contacttitle like 'owner';
