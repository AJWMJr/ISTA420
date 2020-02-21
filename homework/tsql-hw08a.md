# TSQL Homework 8a

#### --AJ McCray

1. It is not technically as the insert command will run without them, but it is safer to input the columns so that you are not relying on the order in the create statement to insure the values are assigned to the correct columns

2. yes. when you want to add an entire table

3. A stored procedure/function

4. Select into can generate new tables in an efficient manner

5. File Type, field terminator, and row terminator

6. No. Use a sequence.

7. CREATE SEQUENCE *NAME* AS *TYPE* *PARAMATERS*

8. create a variable that gets its value from the sequence object

9. ALTER SEQUENCE *NAME* *PARAMATERS*

10. Delete takes parameters and can delete only some rows. Truncate deletes all rows and  takes no parameters (truncate also resets seed value of identity columns)

11. A Delete will clear, potentially all of the, rows but leave the table structure intact. Drop Table removes the table entirely
