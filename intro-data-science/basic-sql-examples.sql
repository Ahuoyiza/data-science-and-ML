-- Setting up the Parch & Posey database:
-- $ createdb parch
-- $ psql parch < parch_and_posey.sql

-- select
SELECT * FROM orders;
SELECT id, account_id, occurred_at
FROM orders;

-- ORDER BY
-- The ORDER BY statement always comes in a query after the SELECT and FROM statements, 
-- but before the LIMIT statement. If you are using the LIMIT statement, it will always appear last. 
-- As you learn additional commands, the order of these statements will matter more.

-- Pro Tip
-- Remember DESC can be added after the column in your ORDER BY statement to sort in 
-- descending order, as the default is to sort in ascending order.

-- 1. Write a query to return the 
-- 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at,total_amt_usD
FROM orders
LIMIT 5;

-- 2. Write a query to return the top 5 orders in 
-- terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id,total_amt_usD
FROM orders
ORDER BY total_amt_usD DESC
LIMIT 5;

-- 3. Write a query to return the lowest 20 orders in terms of 
-- smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id,total_amt_usD
FROM orders
ORDER BY total_amt_usD 
LIMIT 20;

-- 4. Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the account 
-- ID (in ascending order), and then by the total dollar amount (in descending order).
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

-- 5. Now write a query that again displays order ID, account ID, and total dollar amount 
-- for each order, but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id ;

-- 6. Write a query that:

-- Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.

-- Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;
-----
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

-- 7. Filter the accounts table to include the company name, website, and the primary point of
--   contact (primary_poc) just for the Exxon Mobil company in the accounts table.
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

-- Using the orders table:

-- 8. Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. L
--   imit the results to the first 10 orders, and include the id and account_id fields.


-- 9. Write a query that finds the percentage of revenue that comes from poster paper for each order. 
--   You will need to use only the columns that end with _usd. (Try to do this without using the total column.) 
--   Display the id and account_id fields also. NOTE - you will receive an error with the correct solution to this question. 
--   This occurs because at least one of the values in the data creates a division by zero in your formula. You will learn later in the 
--   course how to fully handle this issue. For now, you can just limit your calculations 
--   to the first 10 orders, as we did in question #1, and you'll avoid that set of data that causes the problem.

SELECT id,account_id, standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;
----
SELECT id,account_id,  
(poster_amt_usd/(standard_amt_usd+poster_amt_usd+gloss_amt_usd)) * 100 AS percent_poster
FROM orders
LIMIT 10;

-- 10. Use the accounts table to find

-- All the companies whose names start with 'C'.

-- All companies whose names contain the string 'one' somewhere in the name.

-- All companies whose names end with 's'.
SELECT name
FROM accounts
WHERE name LIKE 'C%';
---
SELECT name
FROM accounts
WHERE name LIKE '%one%';
-----
SELECT name
FROM accounts
WHERE name LIKE '%s';
