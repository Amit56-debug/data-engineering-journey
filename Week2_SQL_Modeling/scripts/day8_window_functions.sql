--Rank products by revenue per customer

SELECT 
    c.customer_name,
    p.product_name,
    SUM(s.quantity * p.price) AS total_spent,
    RANK() OVER(PARTITION BY c.customer_name ORDER BY SUM(s.quantity * p.price) DESC) AS rank_in_customer
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name, p.product_name;


--Running Total of Sales (by Date)

SELECT 
    s.sale_date,
    SUM(s.quantity * p.price) AS daily_sales,
    SUM(SUM(s.quantity * p.price)) OVER (ORDER BY s.sale_date) AS running_total
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY s.sale_date
ORDER BY s.sale_date;


--Rank Customers by Lifetime Spend

SELECT 
    c.customer_name,
    SUM(s.quantity * p.price) AS total_spent,
    DENSE_RANK() OVER(ORDER BY SUM(s.quantity * p.price) DESC) AS customer_rank
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;


--Shows rank of each region by total revenue

SELECT 
sum(s.quantity*p.price) as total_revenue,c.region,
dense_rank() over(order by sum(s.quantity*p.price) desc) as rnk
from sales s join customers c on s.customer_id=c.customer_id
join products p on p.product_id-s.product_id
group by c.region