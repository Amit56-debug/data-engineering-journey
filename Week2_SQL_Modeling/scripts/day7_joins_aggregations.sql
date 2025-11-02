select s.sale_id,c.customer_name,p.product_name,s.quantity,p.price,(s.quantity*p.price),s.sale_date as total_amount,AVG(s.quantity*p.price) as average_order from sales s join customers c on s.customer_id=c.customer_id
join products p on p.product_id=s.product_id group by c.customer_name order by s.quantity desc limit 1

--Total Sales by Product

SELECT 
    p.product_name,
    SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;


--Top 3 Customers by Revenue

SELECT 
    c.customer_name,
    SUM(s.quantity * p.price) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;


--Sales by Region

SELECT 
    c.region,
    SUM(s.quantity * p.price) AS total_sales
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region
ORDER BY total_sales DESC;
