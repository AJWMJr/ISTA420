# TSQL Homework 2B

#### --AJ McCray

1. A data type specifies the values it can contain. They are used to inform the processor on how they should be handled

2. A property of character data  that determines how the database engine should treat character data at the server, database, or column level. language support, sort order, case sensitivity, and accent sensitivity

3. By using both the LTRIM and RTRIM functions

4. SELECT collegename FROM college WHERE collegename LIKE N'%university%';

5. SELECT PATINDEX('% %', 'string with spaces');

6. SELECT LEFT(Presidents, charindex(' ', Presidents) - 1);

7. from highest to lowest: !, &&, ||

8. From highest to lowest: ++/--, +/-, (*, /, %)

9. simple CASE evaluate a single expression against values while a searched CASE evaluates multiple booleans

10. concatenate the strings with an expression like: SELECT firstname + N' ' + lastname AS fullname From HR.employees;

11. You would split and then re-merge the strings with an expression like: SELECT SUBSTRING(fullname, 1, CHARINDEX(' ', fullname) - 1) AS firstname, SUBSTRING(fullname, CHARINDEX(' ', fullname) + 1, 8000) AS lastname, SUBSTRING (firstname +N' ' + lastname) AS fullnamereversed from employees;