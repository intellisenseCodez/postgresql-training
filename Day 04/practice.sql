# File: practice.sql
-- =====================================================
-- DAY 04: PostgreSQL JOINS (PRACTICE FILE)
-- =====================================================
-- This file demonstrates the most common JOIN types in PostgreSQL
-- using simple sample tables for clarity.

-- PostgreSQL supports the following JOIN types:
-- 1. INNER JOIN
-- 2. LEFT JOIN
-- 3. RIGHT JOIN
-- 4. FULL OUTER JOIN
-- 5. CROSS JOIN
-- 6. NATURAL JOIN
-- 7. SELF JOIN

-- -----------------------------------------------------
-- STEP 1: Create sample tables
-- -----------------------------------------------------

CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR(100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR(100) NOT NULL
);

-- -----------------------------------------------------
-- STEP 2: Insert sample data
-- -----------------------------------------------------

INSERT INTO basket_a (a, fruit_a) VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b) VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

-- -----------------------------------------------------
-- STEP 3: Inspect tables
-- -----------------------------------------------------

SELECT * FROM basket_a;
SELECT * FROM basket_b;

-- -----------------------------------------------------
-- INNER JOIN
-- Returns only rows with matching values in both tables
-- -----------------------------------------------------

SELECT
    a.a,
    a.fruit_a,
    b.b,
    b.fruit_b
FROM basket_a a
INNER JOIN basket_b b
    ON a.fruit_a = b.fruit_b;

-- -----------------------------------------------------
-- LEFT JOIN
-- Returns all rows from basket_a and matched rows from basket_b
-- -----------------------------------------------------

SELECT
    a.a,
    a.fruit_a,
    b.b,
    b.fruit_b
FROM basket_a a
LEFT JOIN basket_b b
    ON a.fruit_a = b.fruit_b;

-- -----------------------------------------------------
-- RIGHT JOIN
-- Returns all rows from basket_b and matched rows from basket_a
-- -----------------------------------------------------

SELECT
    a.a,
    a.fruit_a,
    b.b,
    b.fruit_b
FROM basket_a a
RIGHT JOIN basket_b b
    ON a.fruit_a = b.fruit_b;

-- -----------------------------------------------------
-- FULL OUTER JOIN
-- Returns all rows from both tables, matched where possible
-- -----------------------------------------------------

SELECT
    a.a,
    a.fruit_a,
    b.b,
    b.fruit_b
FROM basket_a a
FULL OUTER JOIN basket_b b
    ON a.fruit_a = b.fruit_b;

-- -----------------------------------------------------
-- REAL-WORLD EXAMPLE (dvdrental dataset)
-- -----------------------------------------------------
-- Question: Find the name and email of the top 5 most valuable customers
-- Output: full_name, email, total_amount
-- Tables: customer, payment

SELECT
    c.first_name || ' ' || c.last_name AS full_name,
    c.email,
    SUM(p.amount) AS total_amount
FROM customer c
INNER JOIN payment p
    ON p.customer_id = c.customer_id
GROUP BY c.first_name, c.last_name, c.email
ORDER BY total_amount DESC
LIMIT 5;
