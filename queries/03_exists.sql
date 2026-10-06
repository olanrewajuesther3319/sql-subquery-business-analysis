USE shopsmart;

-- =====================================================
-- EXISTS SUBQUERIES
-- Business Questions 1 - 3
-- =====================================================

-- Q14
-- Which customers have placed at least one order?

SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- Q15
-- Which customers placed at least one order in March 2026?

SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_date >= '2026-03-01'
      AND o.order_date < '2026-04-01'
);


-- Q16
-- Which customers have purchased at least one Electronics product?

SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    WHERE o.customer_id = c.customer_id
      AND p.category = 'Electronics'
);