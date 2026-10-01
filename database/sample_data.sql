USE shopsmart;

-- Departments
INSERT INTO departments (department_name)
VALUES
('IT'),
('Sales'),
('Marketing'),
('Finance'),
('Human Resources');


-- Customers
INSERT INTO customers (customer_name, email, country)
VALUES
('Esther', 'esther@email.com', 'Nigeria'),
('John', 'john@email.com', 'Ghana'),
('David', 'david@email.com', 'Nigeria'),
('Sarah', 'sarah@email.com', 'Kenya'),
('Michael', 'michael@email.com', 'Nigeria'),
('Grace', 'grace@email.com', 'Ghana'),
('Daniel', 'daniel@email.com', 'South Africa'),
('Sophia', 'sophia@email.com', 'Kenya'),
('James', 'james@email.com', 'Nigeria'),
('Mary', 'mary@email.com', 'South Africa');


-- Products
INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 500000.00),
('Smartphone', 'Electronics', 350000.00),
('Wireless Mouse', 'Electronics', 15000.00),
('Keyboard', 'Electronics', 25000.00),
('Office Chair', 'Furniture', 80000.00),
('Office Desk', 'Furniture', 150000.00),
('Bookshelf', 'Furniture', 120000.00),
('Backpack', 'Accessories', 30000.00),
('Headphones', 'Electronics', 75000.00),
('Webcam', 'Electronics', 60000.00);


-- Employees
INSERT INTO employees (employee_name, salary, department_id)
VALUES
('Alice', 450000.00, 1),
('Brian', 600000.00, 1),
('Chinedu', 350000.00, 2),
('Diana', 500000.00, 2),
('Edward', 400000.00, 3),
('Faith', 550000.00, 3),
('George', 700000.00, 4),
('Helen', 450000.00, 4),
('Ibrahim', 300000.00, 5),
('Jane', 480000.00, 5);


-- Orders
INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2026-01-10'),
(1, '2026-01-15'),
(2, '2026-01-20'),
(3, '2026-02-05'),
(3, '2026-02-10'),
(4, '2026-02-15'),
(5, '2026-02-20'),
(6, '2026-03-01'),
(7, '2026-03-05'),
(8, '2026-03-10'),
(9, '2026-03-15');


-- Order Items
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 500000.00),
(1, 3, 2, 15000.00),
(2, 2, 1, 350000.00),
(2, 8, 1, 30000.00),
(3, 5, 2, 80000.00),
(4, 1, 1, 500000.00),
(4, 9, 1, 75000.00),
(5, 6, 1, 150000.00),
(5, 4, 2, 25000.00),
(6, 7, 1, 120000.00),
(7, 2, 2, 350000.00),
(7, 10, 1, 60000.00),
(8, 3, 3, 15000.00),
(8, 8, 1, 30000.00),
(9, 1, 1, 500000.00),
(9, 5, 1, 80000.00),
(10, 9, 2, 75000.00),
(11, 6, 1, 150000.00),
(11, 4, 1, 25000.00);