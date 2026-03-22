
-- Q1: List all customers from Mumbai along with their total order value
select c.customer_name, SUM(o.quantity * p.unit_price) as total_order_value
from order_flat_customers c
join order_flat_order o on c.customer_id = o.customer_id
join order_flat_product p on p.product_id = o.product_id
where customer_city = 'Mumbai'
group by customer_name;

-- Q2: Find the top 3 products by total quantity sold
select p.product_name, sum(o.quantity) as total_sold
from order_flat_product p
join order_flat_order o on o.product_id = p.product_id
group by product_name
order by total_sold desc
limit 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
select s.sales_rep_name, count(distinct o.customer_id) as unique_customers
from order_flat_sales s
left join order_flat_order o on o.sales_rep_id = s.sales_rep_id
group by sales_rep_name
order by unique_customers desc;

-- Q4: Find all orders where the total value exceeds 10,000, sorted by value descending

select o.order_id, (o.quantity * p.unit_price) as order_total
from order_flat_order o
join order_flat_product p on o.product_id = p.product_id
where (o.quantity * p.unit_price) > 10000
group by order_id
order by order_total desc;

-- Q5: Identify any products that have never been ordered
select p.product_id, p.product_name
from order_flat_product p
join order_flat_order o on o.product_id = p.product_id
where o.product_id is null;