-- Revenue
SELECT ROUND(SUM(payment_value),2) AS revenue
FROM payments;

-- Status
SELECT order_status, COUNT(*) AS total
FROM orders
GROUP BY order_status
ORDER BY total DESC;

-- Payment
SELECT payment_type, COUNT(*) AS total
FROM payments
GROUP BY payment_type
ORDER BY total DESC;

-- State
SELECT c.customer_state, COUNT(o.order_id) AS orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY orders DESC;

-- Category
SELECT p.product_category_name,
       ROUND(SUM(oi.price),2) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- Seller
SELECT seller_id,
       ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;