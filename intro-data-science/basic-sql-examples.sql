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