-- Monthly
SELECT DATE_TRUNC('month', order_purchase_timestamp) AS month,
       COUNT(*) AS orders
FROM orders
GROUP BY month
ORDER BY month;

-- Spending
SELECT o.customer_id,
       ROUND(SUM(p.payment_value),2) AS spent
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id
ORDER BY spent DESC
LIMIT 10;

-- Repeat
SELECT customer_id,
       COUNT(*) AS orders
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY orders DESC;

-- Delivery
SELECT order_status,
       ROUND(AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp))/86400),2) AS days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
GROUP BY order_status;

-- Rank
SELECT product_category_name,
       COUNT(*) AS total,
       RANK() OVER(ORDER BY COUNT(*) DESC) AS ranking
FROM products
GROUP BY product_category_name;

-- Case
SELECT customer_state,
       COUNT(*) AS customers,
       CASE
           WHEN COUNT(*) >= 10000 THEN 'High'
           WHEN COUNT(*) >= 3000 THEN 'Medium'
           ELSE 'Low'
       END AS category
FROM customers
GROUP BY customer_state
ORDER BY customers DESC;

