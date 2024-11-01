1) Select (SELECT first_name FROM actor;) - it helps us to retrieve columns from the tables. We can use it to show exact specific rows in the tables. Instead of, the coulmn names, if we use '*', it will show all columns.

2) Distinct (SELECT DISTINCT (last_update) FROM city;) - a keyword used to remove duplicate rows from the result set of a query.

When you use DISTINCT, the query will return only unique rows based on the columns specified. This applies to the entire row, not just individual columns.
If you use DISTINCT with a single column, it returns unique values for that column.
The keyword can impact performance, especially with large datasets, as it requires sorting and comparison operations.

3) COUNT - used to count the number of rows that match a specified condition. It can be applied to a single column or to all rows, depending on how it's used.

To count all rows in a table, regardless of column values, you use COUNT(*). This counts every row, including rows with NULL values. Example: (SELECT COUNT(*) FROM employees;).
This query returns the total number of rows in the employees table.

To count only the rows where a specific column has a non-NULL value, you use COUNT(column_name).
Example: (SELECT COUNT(name) FROM employees;)
This query returns the number of non-NULL values in the name column of the employees table. If among the names, there is null column member, it will not be returned.

To count the number of unique values in a column, you use COUNT(DISTINCT column_name).
Example: (SELECT COUNT(DISTINCT department) FROM employees;)
This query returns the number of distinct departments in the employees table. This just returns the number of rows with not-null and distinct department names.

4) Where - used to filter records in a query based on specified conditions. It is one of the most commonly used clauses in SQL because it allows you to retrieve only those rows that meet certain criteria.
Example: (SELECT name, department
FROM employees
WHERE department = 'IT';)

We can use "AND" and "OR" here.

Some logical operators which can be used here:

1.NOT: Negates a condition.
Returns TRUE if the condition is FALSE.
Example: (SELECT * FROM employees
WHERE NOT department = 'HR';)

2. BETWEEN: Checks if a value is within a range (inclusive).
Often used with numeric, date, or time values.
Example: (SELECT * FROM employees
WHERE salary BETWEEN 4500 AND 6000;)

3. IN: Checks if a value matches any value in a list.
Often used to filter by a set of values.
Example: (SELECT * FROM employees
WHERE department IN ('HR', 'IT');)

4. LIKE: Used for pattern matching with string data.
% matches any sequence of characters.
_ matches a single character.

Example: (SELECT * FROM employees
WHERE name LIKE 'A%';)

5. IS NULL / IS NOT NULL:
Checks if a value is NULL or not.
Example: (SELECT * FROM employees
WHERE department IS NULL;)

6. <> : This is the standard SQL operator for "not equal." Instead, (!=) can be used, too.

