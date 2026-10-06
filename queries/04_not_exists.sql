USE shopsmart;

-- =====================================================
-- NOT EXISTS SUBQUERIES
-- Business Questions 1 - 3
-- =====================================================

-- Q16
-- Which customers have never placed an order?

SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);


-- Q17
-- Which products have never been ordered by any customer?

SELECT
    p.product_id,
    p.product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM order_items oi
    WHERE oi.product_id = p.product_id
);


-- Q18
-- Which customers have never purchased an Electronics product?

SELECT 
    c.customer_id,
    c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    WHERE o.customer_id = c.customer_id
      AND p.category = 'Electronics'
);