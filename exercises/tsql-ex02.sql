.echo on
.headers on
-- Name: AJ McCray
-- FIle: sql-lab02b.sql
-- Date: January 22, 2020

/* 1. Mailing Labels
From the Northwind database we used in class and SQLite, create mailing labels for customer represen-
tatives. Each label should consist of six, and exactly six, lines. The mailing labels should be suitable
for printing on sticky label paper, specically Avery 8160 labels. The format should be as follows: */
select contactname || '
 ' || companyname || '
 ' || address || '
 ' || city || ' ' || region || postalcode || '
 ' || '
 ' from customers;
 /* 2. Telephone Book
From the Northwind database we used in class and SQLite, create a telephone book for customer repre-
sentatives. Each line in the telehone book should consist of the representative last name, representative
first name, company name, and telephone number. Each row should look like this. */
select substr(contactname, instr(contactname, " ") + 1) || ', ' || substr(contactname, 1, instr(contactname, " "))
 || '       ' || companyname || '           ' || phone from customers;
/* 3. Shipping Lag Report
From the Northwind database, create a report from Orders showing the shipping lag between order
date and shipped date. The report should contain four columns: the order umber, the order date, the
shipped date, and the dierence in days between the order date and the shipped date. */
select orderid, orderdate, shippeddate, julianday(shippeddate) - julianday(orderdate) from orders where shippeddate like '%-%';
/* 4. Your Age
How old are you, in years, months, weeks, and days, today? If you know the time of your birth, add
hours, minutes, and seconds. Use Sqlite to calculate this. Notes: (a) If you don't know the time of
your birth, you cn assume that it is 00:00:00. (b) You may assume that each year contains 12 months
and 365 day exactly, so you don't have to take leap years (and other oddities) into account. */
select julianday('2020-01-22') - julianday('1991-06-11'); --days
select (julianday('2020-01-22') - julianday('1991-06-11')) / 7; -- weeks
select (julianday('2020-01-22') - julianday('1991-06-11')) / 30.4; -- months
select (julianday('2020-01-22') - julianday('1991-06-11')) / 365;  -- years
