USE e_commerce_project;

-- 1

SELECT SUM(quantity*unit_price) as Total_revenue
FROM order_items;

-- 2

SELECT COUNT(order_item_id) AS Total_order_item
FROM order_items;

-- 3

SELECT COUNT(*) AS Total_customer
FROM customers;

-- 4

SELECT COUNT(*) AS Total_product
FROM products;

-- 5

SELECT ROUND(SUM(quantity*unit_price)/COUNT(DISTINCT(order_id)))
AS avg_amount
FROM order_items;

-- 6

SELECT p.product_name, SUM(oi.quantity)
AS total_qyt
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_qyt DESC
LIMIT 5;  

-- 7 

SELECT p.category, SUM(oi.quantity*oi.unit_price)
AS total_revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 8

SELECT c.customer_name, ROUND(SUM(oi.quantity*oi.unit_price),2) as rev
FROM customers c
JOIN orders o 
ON o.customer_id=c.customer_id
JOIN order_items oi 
ON oi.order_id=o.order_id
GROUP BY c.customer_name
ORDER BY rev DESC
LIMIT 5;

-- 9

SELECT date_format(o.order_date, '%Y-%m') AS month,
round(SUM(oi.quantity*oi.unit_price),2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id=oi.order_id
GROUP BY month
ORDER BY month desc;

-- 10

 SELECT c.city, ROUND(SUM(oi.quantity*oi.unit_price),2) as sales
 FROM customers c 
 JOIN orders o 
 ON o.customer_id=c.customer_id
 JOIN order_items oi
 ON oi.order_id=o.order_id
 GROUP BY c.city;
 
 -- 11
 
 SELECT c.customer_name, COUNT(o.order_id) AS regular_buy
 FROM orders o
 JOIN customers c ON c.customer_id=o.customer_id
 GROUP BY customer_name;
 
 -- 12
 
 SELECT c.customer_id, c.customer_name
 FROM customers c
 LEFT JOIN orders o ON c.customer_id=o.customer_id
 WHERE o.order_id IS NULL;
 
 -- 13
 
 SELECT c.customer_id, c.customer_name, MAX(o.order_date) AS last_order
 FROM customers c
 LEFT JOIN orders o ON c.customer_id = o.customer_id
 GROUP BY c.customer_id, c.customer_name
 HAVING MAX(o.order_date) < '2026-04-30' OR MAX(o.order_date) IS NULL
 ORDER BY last_order;

-- 14

SELECT p.category, SUM(oi.quantity) AS unit_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY category
ORDER BY unit_sold DESC;

-- 15

SELECT p.product_name, SUM(oi.quantity*oi.unit_price) AS total_rev
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY product_name
ORDER BY total_rev DESC;

