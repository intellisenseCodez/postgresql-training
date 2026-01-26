# PostgreSQL Bootcamp – Day 04 (JOINS)


## Overview
This session focused on understanding and applying SQL JOIN operations in PostgreSQL using both sample tables and the dvdrental database.


---


## JOIN Types Covered


### 1. INNER JOIN
Returns only records with matching values in both tables.
```sql
SELECT *
FROM table_a
INNER JOIN table_b ON condition;
```

### 2. LEFT JOIN
Returns all records from the left table and matched records from the right table.
```sql
SELECT *
FROM table_a
LEFT JOIN table_b ON condition;
```

### 3. RIGHT JOIN
Returns all records from the right table and matched records from the left table.
```sql
SELECT *
FROM table_a
RIGHT JOIN table_b ON condition;
```

### 4. FULL OUTER JOIN
Returns all records when there is a match in either table.
```sql
SELECT *
FROM table_a
FULL OUTER JOIN table_b ON condition;
```

## Key SQL Commands Practiced
- CREATE TABLE
- INSERT INTO
- SELECT
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- GROUP BY
- ORDER BY
- SUM()
- LIMIT
- Column aliasing using AS
- String concatenation using ||