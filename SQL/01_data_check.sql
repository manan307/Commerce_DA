-- Orders
SELECT COUNT(*) FROM orders;

-- Customers
SELECT COUNT(*) FROM customers;

-- Sellers
SELECT COUNT(*) FROM sellers;

-- Products
SELECT COUNT(*) FROM products;

-- Items
SELECT COUNT(*) FROM order_items;

-- Payments
SELECT COUNT(*) FROM payments;

-- Status
SELECT DISTINCT order_status
FROM orders;

-- Types
SELECT DISTINCT payment_type
FROM payments;

-- States
SELECT DISTINCT customer_state
FROM customers;

-- Categories
SELECT COUNT(DISTINCT product_category_name)
FROM products;