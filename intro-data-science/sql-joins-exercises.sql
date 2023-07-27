-- 1. Try pulling all the data from the accounts table, and all the data from the orders table.

-- Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
SELECT *
FROM accounts
JOIN orders
ON accounts.id = orders.account_id;
 
SELECT 
	  orders.standard_qty,
    orders.gloss_qty,
    orders.poster_qty,
    accounts.website,
    accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
