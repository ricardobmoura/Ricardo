-- lets create two new tables and delve into the
-- join operations

CREATE TABLE Staff(
ID INT NOT NULL PRIMARY KEY,
Name VARCHAR(50),
Age INT,
Salary DECIMAL(10,2)
)
drop table Staff
/*
 Salary DECIMAL(10, 2): in this query 10 represents
 the total number of digits and 2 represents the number
 of digits after the floating points.

 Example 7890.85
 Example 123454678.29
*/