# TSQL Homework 6

#### --AJ McCray

1. set operators are used to combine two result set returned by two seperate queries

2. the result sets to be combined can not have order by clauses. the two sets must have the same number of columns and the columns must have compatible data types.

3. a diagram representing mathematical or logical sets pictorially as circles with the common elements of the sets being represented by the areas of overlap among the circles.

4. returns rows for every occurance in either the first or the second set

5. also returns the rows for every occurance in either the first or the second set but does not attempt to remove duplicates

6. returns only distinct rows that occur in both the first and second set

7. it would return all intersecting rows not removing duplicates.

8. it returns all rows from the first set that do not appear in the second set

9. returns occurances of a row from the first set that do not have a corresponding row in the second set

10. intersect precedes union and except. Union and except have equal precedence and are therefore evaluated in order of occurance.

11. select (select number from A except select number from B), (select number from B except select number from A) from A join B on number;
