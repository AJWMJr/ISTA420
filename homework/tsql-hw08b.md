# TSQL Homework 8b

#### --AJ McCray

1. update dbo.taxrate set rate = *new rate* where state like 'specific state'

2. by creating a backup sales table and replacing the tax rate in all rows and then recalculating

3. the update takes a stored value(in a seperate table) and assigns it to a variable that then can be used to update tables

4. it allows you to express complex modification logic in a single sttement. stands for extract, transform and load; and it is a system for compiling data into a database.

5. after spcifying the tables, you specify a predicate to evaluate and then provide instruction for what to do when rows match and then what to do when rows do not match

6. insert into dbo.Pesidents(id, firstname, lastname, middlename, etc.) output  inserted.id, inserted.firstname etc. select lastname from dbo.famousPeople where occupation like 'President';

7. update dbo.OrderDetails set discount += 0.05 output inserted.orderid, inserted productid, deleted.discount as olddiscount, inserted.discount as newdiscount where productid = 51;

8. delete from dbo.Presidents output deleted.id, deleted.LastName, deleted.FirstName, deleted.MiddleName, deleted.OrderOfPresidency, deleted.DateOfBirth, deleted.DateOfDeath, deleted.TownOfBirth, deleted.StateOfBirth, deleted.HomeState, deleted.PartyAffiliation, deleted.DateTookOffice, deleted.DateLeftOffice, deleted.AssassinationAttempt, deleted.Assassinated, deleted.ReligiousAffiliation where ID = 'ID';

9. merge into dbo.customers as tgt using dbo.customersStage as src on tgt.custid = src.custid when matched then update set tgt.companyname = src.companyname, tgt.phone = src.phone, tgt.address = src.address when not matched then insert (custid, companyname, phone, address) values (src.custid, src.companyname, src.phone, src.address) output $action as theaction, inserted.custid, deleted.companyname as oldcompanyname, inserted.companyname as newcompanyname, etc

10. method of modifying output clauses to return only a subset of modified rows

11. alter table PERSON add DayOfBirth varchar(20) not null;

12. alter table PERSON add constraint DayOfWeek check(DayOfBirth like '[monday, tuesday, wednesday, thursday, friday, saturday, sunday]');

13. alter table PERSON add constraint FK_PERSON foreign key (DayOfWeek) reference WEEK(ValidDay);
