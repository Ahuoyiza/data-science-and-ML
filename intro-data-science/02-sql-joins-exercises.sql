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

-- 2.Provide a table for all web_events associated with account name of Walmart. 
-- There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. 
-- Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

-- Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.

-- Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
-- Your final table should have 3 columns: region name, account name, and unit price.
-- A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

SELECT 
	a.primary_poc,
    w.occurred_at,
	w.channel,
    a.name
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

SELECT 
    r.name region,
    s.name rep,
    a.name account
FROM region AS r
JOIN sales_reps AS s
ON  s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
ORDER BY a.name;

SELECT 
    r.name region,
    a.name account,
    o.total_amt_usd/(total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON  s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;

-- 3. Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name,
-- and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT 
    r.name RegionName,
    s.name SalesRep,
    a.name AccountName
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
AND r.name LIKE 'Midwest'
ORDER BY a.name;

-- 4.Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.
SELECT 
    r.name RegionName,
    s.name SalesRep,
    a.name AccountName
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
AND ( r.name LIKE 'Midwest' AND s.name LIKE 'S%' )
ORDER BY a.name;

-- 5.Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns:
-- the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.
SELECT 
    r.name RegionName,
    s.name SalesRep,
    a.name AccountName
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
AND ( r.name LIKE 'Midwest' AND s.name LIKE '% K%' )
ORDER BY a.name;

-- 6.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. 
-- However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns:
-- region name, account name, and unit price. In order to avoid a division by zero error, adding .01 
-- to the denominator here is helpful total_amt_usd/(total+0.01).
SELECT 
    r.name RegionName,
    a.name AccountName,
    o.total_amt_usd/(o.total + 0.01) UnitPrice
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
AND o.standard_qty > 100;

-- 7. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total)
-- for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity 
-- exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. 
-- In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT 
    r.name RegionName,
    a.name AccountName,
    o.total_amt_usd/(o.total + 0.01) UnitPrice
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
AND ( o.standard_qty > 100 AND o.poster_qty >50)
ORDER BY UnitPrice;

-- 8.Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total)
-- for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. 
-- Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. 
-- In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).
SELECT 
    r.name RegionName,
    a.name AccountName,
    o.total_amt_usd/(o.total + 0.01) UnitPrice
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
AND ( o.standard_qty > 100 AND o.poster_qty >50)
ORDER BY UnitPrice DESC;

-- 9. What are the different channels used by account id 1001? Your final table should have only 2 columns: 
-- account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.
SELECT DISTINCT
    a.name AccountName,
    w.channel channels
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
AND ( a.id = '1001');

-- 10.Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.
SELECT DISTINCT
    o.occurred_at OccuredAt,
    a.name AccountName,
    o.total OrderTotal,
    o.total_amt_usd order_total_amt_usd 
FROM accounts a
JOIN orders o
ON o.account_id = a.id
AND (o.occurred_at BETWEEN '2015-01-01' AND '2016-01-01');
