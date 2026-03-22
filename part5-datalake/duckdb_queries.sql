-- Q1: List all customers along with the total number of orders they have placed

select c.name, count(o.num_items) as total_orders 
from read_csv_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\customers.csv') c 
join read_json_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\orders.json') o on o.customer_id=c.customer_id 
group by c.name order by total_orders desc;

-- Q2: Find the top 3 customers by total order value

select c.name, sum(o.total_amount) as total_sales 
from read_csv_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\customers.csv')  c 
join read_json_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\orders.json') o on 
c.customer_id = o.customer_id group by c.name order by total_sales desc;


-- Q3: List all products purchased by customers from Bangalore
D select c.name, sum(o.num_items) as total_quantity 
from read_csv_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\customers.csv') c 
join read_json_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\orders.json') o 
on o.customer_id = c.customer_id where c.city ='Bangalore' group by c.name order by total_quantity desc;


-- Q4: Join all three files to show: customer name, order date, product name, and quantity
 select c.name,o.order_date,p.product_name,p.quantity 
 from read_json_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\orders.json') o
 join read_csv_auto('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\customers.csv') c 
 on o.customer_id = c.customer_id
 join read_parquet('D:\Masai Classes\Assignment-01-bitsom-ba-2511555\datasets\products.parquet') p 
 on p.order_id = o.order_id order by p.quantity desc;
