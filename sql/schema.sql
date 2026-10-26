CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(255),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name TEXT,
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,2)
);

-- Optional indexes for common analysis fields
CREATE INDEX idx_sales_order_date ON sales(order_date);
CREATE INDEX idx_sales_region ON sales(region);
CREATE INDEX idx_sales_category ON sales(category);
CREATE INDEX idx_sales_segment ON sales(segment);
CREATE INDEX idx_sales_customer_id ON sales(customer_id);
