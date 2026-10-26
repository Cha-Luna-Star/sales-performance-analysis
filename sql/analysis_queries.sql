-- Overview of sales performance
SELECT
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS avg_discount
FROM sales;

-- Sales by region
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Sales by category and sub-category
SELECT
    category,
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category, sub_category
ORDER BY category, total_sales DESC;

-- Monthly revenue trend
SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    SUM(sales) AS monthly_sales,
    SUM(profit) AS monthly_profit
FROM sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY order_month;

-- Best-performing segment
SELECT
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_pct
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;

-- Top 10 products by sales
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(quantity) AS units_sold,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Discount impact analysis
SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.10 THEN 'Low Discount'
        WHEN discount > 0.10 AND discount <= 0.20 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_bucket,
    AVG(sales) AS avg_sales,
    AVG(profit) AS avg_profit,
    COUNT(*) AS order_count
FROM sales
GROUP BY discount_bucket
ORDER BY CASE discount_bucket
    WHEN 'No Discount' THEN 1
    WHEN 'Low Discount' THEN 2
    WHEN 'Medium Discount' THEN 3
    ELSE 4
END;

-- Regional customer analysis
SELECT
    region,
    customer_id,
    COUNT(DISTINCT order_id) AS order_count,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region, customer_id
ORDER BY region, total_sales DESC;
