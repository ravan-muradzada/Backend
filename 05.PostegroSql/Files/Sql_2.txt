1) ORDER BY - used for sort the result set of query ascending or descending order according to the specificed column.
If you do not specify ASC or DESC, PostgreSQL will sort the results in ascending order by default.

You can sort by multiple columns by listing them separated by commas. The sorting is done first by the first column, then by the second, and so on.

Example: (SELECT first_name, last_name, age
FROM employees
ORDER BY last_name ASC, age DESC;)
This query sorts the results by last_name in ascending order. If multiple rows have the same last_name, those rows are further sorted by age in descending order.

Instead of specifying column names, you can use the position of the column in the SELECT statement.
Example: (SELECT first_name, last_name, age
FROM employees
ORDER BY 2, 3 DESC;)
Here, the results are sorted first by last_name (the second column in the SELECT list) in ascending order and then by age in descending order.

By default, NULL values are sorted last when using ASC and first when using DESC.
You can control this behavior with NULLS FIRST or NULLS LAST.

Example: (SELECT first_name, last_name
FROM employees
ORDER BY last_name ASC NULLS FIRST;)
This query sorts last_name in ascending order, placing NULL values at the beginning of the result set.


2) LIMIT - used to restrict the number of rows returned by a query. This is particularly useful when you want to preview a subset of the data, paginate results, or limit the output to a manageable size.

Example: (SELECT id, name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;)
This query returns the top 5 employees with the highest salaries.


"OFFSET" is often used in conjunction with "LIMIT" to skip a certain number of rows before starting to return rows.
This is commonly used for pagination.


Example: (SELECT id, name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 10;)
This query skips the first 10 rows and then returns the next 5 rows. It’s useful for fetching a specific "page" of results in a larger dataset.


The LIMIT clause can help improve performance when you only need a small number of rows, as it reduces the amount of data that needs to be processed and returned.
However, if you use LIMIT with a high OFFSET value, performance might degrade because PostgreSQL has to skip over many rows before returning the results.

3) BETWEEN - used to filter the result set within a specific range. It is commonly used in WHERE clauses to select rows where a column's value falls within a specified range, inclusive of the boundary values.

Basic syntax: (SELECT column1, column2, ...
FROM table_name
WHERE column_name BETWEEN lower_bound AND upper_bound; )

The BETWEEN operator is inclusive, meaning it includes the lower_bound and upper_bound values in the results.

BETWEEN is also very useful for filtering by date or time ranges.
Example: (SELECT id, order_date, total_amount
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'; )
This query returns orders placed within the entire year of 2024.

BETWEEN can be used with text values, but it compares the values lexicographically (i.e., based on alphabetical order).
Example: (SELECT id, last_name
FROM employees
WHERE last_name BETWEEN 'A' AND 'M';)
This query selects employees whose last names start with letters between 'A' and 'M'.

Example: (select * from actor;
select actor_id, first_name, last_name from actor
where first_name between 'B' and 'd';)





