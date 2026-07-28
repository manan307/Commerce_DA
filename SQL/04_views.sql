-- Revenue
CREATE VIEW monthly_revenue AS
SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
ROUND(SUM(p.payment_value),2) AS revenue
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

-- Sellers
CREATE VIEW top_sellers AS
SELECT seller_id,
ROUND(SUM(price),2) AS revenue
FROM order_items
GROUP BY seller_id
ORDER BY revenue DESC;