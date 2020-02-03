# TSQL Homework-2C

#### --AJ McCray

1. time, date, smalldatetime, datetime, datetime2, datetimeoffset

2. As a character string

3. to describe how date data interpreted

4. SET LANGUAGE British

5. cast does not take a format argument, converts takes a numerical format argument and parse takes a text defined language format.

6. CURRENT_TIMESTAMP or GETDATE()

7. Using DATEADD([year, month, week, or day key phrase], 1, SYSDATETIME());

8. select DATEDIFF(year, '20200122', '19910611');

9. TRY_CAST(date)

10. Returns the date for the last day of the month in the date specified. In a situation where you are dealing with date stamped data you could return only the data that falls on the last day of the month. This could be especially useful for inventory purposes.

11. select DATEADD(day, 30, functiondate); 

12. select julianday(nextbirthday) - julianday(SYSDATETIME());