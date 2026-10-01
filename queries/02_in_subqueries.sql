USE shopsmart;

-- =====================================================
-- IN SUBQUERIES
-- Business Questions 1 - 3
-- =====================================================


-- QUESTION 1
-- Which customers have placed at least one order?

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);


-- QUESTION 2
-- Which customers have purchased at least one
-- Electronics product?

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    WHERE p.category = 'Electronics'
);


-- QUESTION 3
-- Which customers have spent money on a product
-- that costs more than 100,000?

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    WHERE p.price > 100000
);