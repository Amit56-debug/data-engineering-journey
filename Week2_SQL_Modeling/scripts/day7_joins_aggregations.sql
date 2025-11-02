select s.sale_id,c.customer_name,p.product_name,s.quantity,p.price,(s.quantity*p.price),s.sale_date as total_amount,AVG(s.quantity*p.price) as average_order from sales s join customers c on s.customer_id=c.customer_id
join products p on p.product_id=s.product_id group by c.customer_name order by s.quantity desc limit 1
