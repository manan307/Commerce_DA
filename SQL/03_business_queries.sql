-- 03_business_queries.sql
-- Olist E-Commerce

-- 1. Unique customers vs orders
SELECT COUNT(*) AS order_level_ids,
       COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM customers;


-- 2. Total revenue from delivered orders
SELECT ROUND(SUM(oi.price), 2) AS revenue
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';


-- 3. Monthly order trend
SELECT DATE_TRUNC('month', order_purchase_timestamp) AS month,
       COUNT(*) AS orders
FROM orders
GROUP BY month
ORDER BY month;


-- 4. Top 10 customers by spending
SELECT c.customer_unique_id,
       ROUND(SUM(p.payment_value), 2) AS spent
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN payments p ON p.order_id = o.order_id
GROUP BY c.customer_unique_id
ORDER BY spent DESC
LIMIT 10;


-- 5. Repeat purchase rate
SELECT COUNT(*) AS unique_customers,
       COUNT(*) FILTER (WHERE orders_cnt > 1) AS repeat_customers,
       ROUND(100.0 * COUNT(*) FILTER (WHERE orders_cnt > 1) / COUNT(*), 2) AS repeat_rate_pct
FROM (
    SELECT c.customer_unique_id,
           COUNT(DISTINCT o.order_id) AS orders_cnt
    FROM customers c
    JOIN orders o ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
) t;


-- 6. Delivery performance
SELECT ROUND(AVG(EXTRACT(EPOCH FROM
       (order_delivered_customer_date - order_purchase_timestamp)) / 86400), 1) AS avg_delivery_days,
       ROUND(AVG(EXTRACT(EPOCH FROM
       (order_estimated_delivery_date - order_purchase_timestamp)) / 86400), 1) AS avg_estimated_days,
       ROUND(100.0 * COUNT(*) FILTER
       (WHERE order_delivered_customer_date > order_estimated_delivery_date) / COUNT(*), 1) AS pct_late,
       COUNT(*) AS delivered_orders
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;


-- 7. Top categories by units sold
SELECT p.product_category_name,
       COUNT(*) AS units_sold,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY ranking
LIMIT 10;


-- 8. Customers by state
SELECT c.customer_state,
       COUNT(DISTINCT c.customer_unique_id) AS customers,
       ROUND(100.0 * COUNT(DISTINCT c.customer_unique_id)
       / SUM(COUNT(DISTINCT c.customer_unique_id)) OVER (), 1) AS pct_of_customers,
       CASE
           WHEN COUNT(DISTINCT c.customer_unique_id) >= 10000 THEN 'High'
           WHEN COUNT(DISTINCT c.customer_unique_id) >= 3000 THEN 'Medium'
           ELSE 'Low'
       END AS tier
FROM customers c
GROUP BY c.customer_state
ORDER BY customers DESC;


-- 9. Revenue by state and category
SELECT c.customer_state,
       p.product_category_name,
       ROUND(SUM(oi.price), 2) AS revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state, p.product_category_name
ORDER BY revenue DESC
LIMIT 20;
