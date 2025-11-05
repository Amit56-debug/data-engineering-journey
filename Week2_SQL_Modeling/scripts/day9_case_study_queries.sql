--My company, DataMart, wants insights for Quarterly Sales 2024:
--Top 5 customers By total Spend

select c.customer_name,sum(s.quantity*p.price) as total_spend from sales s join customers c on s.customer_id=c.customer_id
join products p on p.product_id=s.product_id  group by c.customer_name order by sum(s.quantity*p.price) desc