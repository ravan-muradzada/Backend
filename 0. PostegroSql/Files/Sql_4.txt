Aggregate functions - min, max, avg, sum, round.

min - The MIN function returns the smallest value in a set of values.

Example: SELECT MIN(column_name)
FROM table_name
WHERE condition;

----------------

max - The MAX function returns the largest value in a set of values.

Example:
SELECT MAX(column_name)
FROM table_name
WHERE condition;

----------------

avg - The AVG function calculates the average (mean) of a set of numeric values.

Example:
SELECT AVG(column_name)
FROM table_name
WHERE condition;

------------------


sum - The SUM function calculates the total sum of a numeric column.

Example:
SELECT SUM(column_name)
FROM table_name
WHERE condition;

--------------------

round - The ROUND function rounds a numeric value to the specified number of decimal places.

SELECT ROUND(AVG(salary), 2) AS average_salary_rounded
FROM employees;
















