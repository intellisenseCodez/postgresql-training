-- DAY 3: POSTGRESQL BOOTCAMP

-- Querying the Database

-- SELECT DISTINCT: Used to remove duplicate rows from the result set.

-- Retrieve unique combinations of first name and last name
SELECT DISTINCT first_name, last_name
FROM customer
ORDER BY first_name ASC;


-- Sample Table for DISTINCT Demonstration
-- Create a sample table to demonstrate DISTINCT behavior
CREATE TABLE colors (
id SERIAL PRIMARY KEY,
bcolor VARCHAR(50),
fcolor VARCHAR(50)
);

-- Insert sample data including duplicates and NULL values
INSERT INTO colors (bcolor, fcolor)
VALUES
('red', 'red'),
('red', 'red'),
('red', NULL),
(NULL, 'red'),
(NULL, NULL),
('green', 'green'),
('blue', 'blue'),
('blue', 'blue');
  

-- Get unique background colors only
SELECT DISTINCT bcolor
FROM colors;

-- Get unique rows across all columns
SELECT DISTINCT *
FROM colors;

-- DISTINCT ON (PostgreSQL-Specific): Returns the first row per group, based on ordering.

-- Create table to store students' scores
CREATE TABLE student_scores (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
subject VARCHAR(50) NOT NULL,
score INTEGER NOT NULL
);

-- Insert student performance data
INSERT INTO student_scores (name, subject, score)
VALUES
('Alice', 'Math', 90),
('Bob', 'Math', 85),
('Alice', 'Physics', 92),
('Bob', 'Physics', 88),
('Charlie', 'Math', 95),
('Charlie', 'Physics', 90);

-- View all records
SELECT *
FROM student_scores;

-- Retrieve the highest score per student 
SELECT DISTINCT ON (name)
name,
subject,
score
FROM student_scores
ORDER BY name, score DESC; -- Key Note: DISTINCT ON always depends on the ORDER BY clause.


-- WHERE Clause (Filtering Data): <, >, <=, >=, =, !=, BETWEEN, NOT BETWEEN, IN, NOT IN, LIKE, NOT LIKE
-- AND, OR, IS NULL, IS NOT NULL


-- Retrieve payment records for specific customers  with ID 345, 350 and 370 and amount greater than 5
SELECT *
FROM payment
WHERE customer_id IN (345, 350, 370)
AND amount > 5.0;

-- Same query using equality operator
SELECT *
FROM payment
WHERE customer_id = 345
AND amount > 5.0;

-- Alias usage and boolean expression in ORDER BY
SELECT amount AS amt
FROM payment
ORDER BY amt > 5.0;

-- LIMIT & OFFSET: Used for pagination.

-- Skip first 5 rows and return the next 20 rows
SELECT *
FROM payment
LIMIT 20 OFFSET 5;

-- FETCH: ANSI SQL alternative to LIMIT.

-- Fetch the first film alphabetically
SELECT film_id, title
FROM film
ORDER BY title
LIMIT 1;

-- Fetch the first 10 films
SELECT film_id, title
FROM film
ORDER BY title
FETCH FIRST 10 ROW ONLY;


-- GROUP BY and Aggregate Functions: AVG(), COUNT(), MAX(), MIN(), SUM()

-- Calculate total payment amount per customer
SELECT customer_id,
SUM(amount) AS total_amount
FROM payment
GROUP BY customer_id
ORDER BY total_amount DESC;

-- HAVING: Used to filter grouped results.

-- Retrieve customers with more than 10 payments
SELECT customer_id,
COUNT(payment_id) AS num_of_payments
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) > 10;





