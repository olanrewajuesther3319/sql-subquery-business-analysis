USE shopsmart;

-- =====================================================
-- SCALAR SUBQUERIES
-- Business Questions 1 - 10
-- =====================================================


-- QUESTION 1
-- Which products are priced above the average product price?

SELECT
    product_name,
    price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);


-- QUESTION 2
-- Which employees earn more than the average employee salary?

SELECT
    employee_name,
    salary
FROM employees
WHERE salary > (
    SELECT ROUND(AVG(salary), 2)
    FROM employees
);


-- QUESTION 3
-- Which departments have an average salary above the
-- company's overall average salary?

SELECT
    department_name,
    department_avg_salary
FROM (
    SELECT
        d.department_name,
        AVG(e.salary) AS department_avg_salary
    FROM departments d
    JOIN employees e
        ON d.department_id = e.department_id
    GROUP BY
        d.department_id,
        d.department_name
) AS department_average
WHERE department_avg_salary > (
    SELECT AVG(salary)
    FROM employees
);


-- QUESTION 4
-- Which customers have spent more than the average
-- amount spent by customers from their own country?

SELECT
    customer_name,
    country,
    total_amount
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        c.country,
        SUM(oi.quantity * oi.unit_price) AS total_amount
    FROM order_items oi
    JOIN orders o
        ON o.order_id = oi.order_id
    JOIN customers c
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name,
        c.country
) AS customer_totals
WHERE total_amount > (
    SELECT AVG(country_total)
    FROM (
        SELECT
            c2.customer_id,
            c2.country,
            SUM(oi2.quantity * oi2.unit_price) AS country_total
        FROM order_items oi2
        JOIN orders o2
            ON o2.order_id = oi2.order_id
        JOIN customers c2
            ON c2.customer_id = o2.customer_id
        GROUP BY
            c2.customer_id,
            c2.country
    ) AS country_customers
    WHERE country_customers.country = customer_totals.country
);


-- QUESTION 5
-- Which customers have more orders than the average
-- number of orders per customer?

SELECT
    customer_name,
    order_count
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
) AS customer_orders
WHERE order_count > (
    SELECT AVG(order_count)
    FROM (
        SELECT
            c.customer_id,
            COUNT(o.order_id) AS order_count
        FROM customers c
        JOIN orders o
            ON c.customer_id = o.customer_id
        GROUP BY
            c.customer_id
    ) AS average_orders
);


-- QUESTION 6
-- Which products have total revenue above the average
-- product revenue?

SELECT
    product_name,
    total_revenue
FROM (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM order_items oi
    JOIN products p
        ON p.product_id = oi.product_id
    GROUP BY
        p.product_id,
        p.product_name
) AS product_revenue
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM (
        SELECT
            p.product_id,
            SUM(oi.quantity * oi.unit_price) AS total_revenue
        FROM order_items oi
        JOIN products p
            ON p.product_id = oi.product_id
        GROUP BY
            p.product_id
    ) AS average_revenue
);


-- QUESTION 7
-- Which customers spent more than the average customer?

SELECT
    customer_name,
    total_spent
FROM (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM order_items oi
    JOIN orders o
        ON oi.order_id = o.order_id
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
) AS customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM (
        SELECT
            c.customer_id,
            SUM(oi.quantity * oi.unit_price) AS total_spent
        FROM order_items oi
        JOIN orders o
            ON oi.order_id = o.order_id
        JOIN customers c
            ON o.customer_id = c.customer_id
        GROUP BY
            c.customer_id
    ) AS average_customer_totals
);


-- QUESTION 8
-- Which customers have never placed an order?

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE c.customer_id = o.customer_id
);


-- QUESTION 9
-- Which products have never been ordered?

SELECT
    p.product_id,
    p.product_name
FROM products p
WHERE NOT EXISTS (
    SELECT 1
    FROM order_items oi
    WHERE p.product_id = oi.product_id
);


-- QUESTION 10
-- Which products are more expensive than every product
-- in the Furniture category?

SELECT
    product_name,
    category,
    price
FROM products
WHERE price > ALL (
    SELECT price
    FROM products
    WHERE category = 'Furniture'
);