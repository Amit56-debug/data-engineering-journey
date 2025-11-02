-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Insert sample data
INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Amit Sharma', 'North'),
(2, 'Priya Singh', 'West'),
(3, 'Rohan Mehta', 'South'),
(4, 'Kavya Iyer', 'East'),
(5, 'Rahul Das', 'Central');


-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Laptop', 55000.00),
(2, 'Mobile Phone', 20000.00),
(3, 'Tablet', 15000.00),
(4, 'Headphones', 3000.00),
(5, 'Smart TV', 80000.00);


-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
INSERT INTO sales (sale_id, customer_id, product_id, quantity, sale_date) VALUES
(1, 1, 1, 2, '2025-10-01'),
(2, 2, 3, 1, '2025-10-03'),
(3, 3, 4, 5, '2025-10-05'),
(4, 4, 2, 1, '2025-10-07'),
(5, 5, 5, 1, '2025-10-10');
