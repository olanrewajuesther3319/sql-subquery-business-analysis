# ShopSmart — Customer & Sales Intelligence System

## Project Overview

ShopSmart is a business-focused MySQL project designed to analyze customer behavior, product performance, sales activity, and employee information using SQL subqueries.

The project uses a fictional e-commerce business database to answer real-world business questions and demonstrate how subqueries can be used to support data-driven decision-making.

## Business Objectives

The project answers questions such as:

- Which customers spend more than the average customer?
- Which products are priced above the average?
- Which customers have never placed an order?
- Which products have never been ordered?
- Which customers purchased Electronics products?
- Which customers purchased products above ₦100,000?
- Which departments have salaries above the company average?
- Which customers spend more than other customers in their country?

## Database Structure

The database contains six main tables:

- `customers`
- `products`
- `orders`
- `order_items`
- `departments`
- `employees`

### Relationships

```text
customers
    |
    | customer_id
    ↓
orders
    |
    | order_id
    ↓
order_items
    |
    | product_id
    ↓
products

departments
    |
    | department_id
    ↓
employees