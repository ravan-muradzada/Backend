1) Group by - used to group rows that have the same values in specificed columns into summary rows. It is often used with aggregate functions.
Such us, if we group customers group by their countries, we can calculate sum of payments for each country.

Basic Syntax:
SELECT column1, aggregate_function(column2)
FROM table_name
WHERE condition
GROUP BY column1;

The GROUP BY clause collects the rows that have identical values in the specified columns and treats them as a single group.
Aggregate functions are then applied to each group to perform calculations like summing or averaging the grouped data.
Columns specified in the SELECT clause that are not aggregated must be included in the GROUP BY clause.

2) Having - he HAVING clause in SQL is used to filter groups of rows after they have been grouped by the GROUP BY clause. It allows you to specify conditions for aggregate functions and filter the results based on these conditions. This is similar to how the WHERE clause works for individual rows but operates on aggregated data.

The HAVING clause filters the results of a query after the rows have been grouped and aggregate functions have been applied. This allows you to include or exclude groups based on aggregate values.
The WHERE clause filters rows before any grouping or aggregation occurs. In contrast, HAVING filters after the aggregation.
The HAVING clause is commonly used with aggregate functions like SUM, COUNT, AVG, MIN, MAX to filter groups based on the results of these functions.

Example: SELECT salesperson_id, SUM(amount) AS total_sales
FROM sales
GROUP BY salesperson_id
HAVING SUM(amount) > 1000;





