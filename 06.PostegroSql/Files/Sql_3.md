1) IN - used to filter the result set based on whether a column's value matches any value in a specified list of values. It’s a shorthand for multiple OR conditions and is commonly used in WHERE clauses.

Basic Syntax: (SELECT column1, column2, ...
FROM table_name
WHERE column_name IN (value1, value2, value3, ...); )

The IN operator checks if the value of a column is equal to any value in a given list.

The list of values can also be the result of a subquery, allowing you to compare the column against a dynamically generated list.

Example: (SELECT id, name
FROM employees
WHERE department_id IN (SELECT id FROM departments WHERE location = 'New York');)
Here, we check department_id's of people who work in departments located in New York.

2) LIKE, ILIKE - used for pattern matching within text fields. They allow you to search for text strings that match a specified pattern using wildcards. LIKE is case-sensitive, while ILIKE is case-insensitive.

Basic syntax: (SELECT column1, column2, ...
FROM table_name
WHERE column_name LIKE pattern;)

%: Represents zero or more characters.
_: Represents a single character.


Example: (SELECT name
FROM employees
WHERE name LIKE 'A%';)
This query returns all employees whose names start with 'A'. The % wildcard matches zero or more characters following 'A'.

Example: (SELECT name
FROM employees
WHERE name LIKE 'J_n';)
This query returns all employees whose names are three characters long and start with 'J' and end with 'n', with any single character in between (e.g., 'Jan', 'Jen').

Example: (SELECT name
FROM employees
WHERE name LIKE '%a%';)
This query returns all employees whose names contain the letter 'a' anywhere in the string.










