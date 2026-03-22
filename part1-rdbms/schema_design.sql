-- Creating customer Data Table
create table order_flat_customers(
customer_id varchar(20) primary key,
customer_name varchar(200) not null,
customer_email varchar(200) not null,
customer_city varchar(100) not null
);

-- Inserting into Customer Data Table
insert into order_flat_customers (customer_id,customer_name,customer_email,customer_city) values
('C2002','Balaji S','balaji@gmail.com','Chennai'),
('C2003','S Balaji','sbalaji@gmail.com','chennai'),
('C2004','S Balaji 1','sbalaji1@gmail.com','chennai1'),
('C2005','S Balaji 2','sbalaji2@gmail.com','chennai2'),
('C2006','S Balaji 3','sbalaji3@gmail.com','chennai3');

-- Creating Product Data Table
create table order_flat_product(
product_id varchar(20) primary key,
product_name varchar(100) not null,
category varchar(100) not null,
unit_price decimal(10,2) not null 
);

-- Inserting into Product Data Table
insert into  order_flat_product(product_id,product_name,category,unit_price) values
('P1001','Mobile','Electronics',900.00),
('P1002','Computer','Electronics',1200.00),
('P1003','Table','Furniture',90.00),
('P1004','Biscuit','Goods',9.00),
('P1005','Juice','Goods',1.50);

-- Creating Sales Rep Data Table
create table order_flat_sales(
sales_rep_id varchar(20) primary key,
sales_rep_name varchar(100) not null,
sales_rep_email varchar(100) not null,
office_address text not null
);

-- Inserting into Sales Rep Data Table
insert into  order_flat_sales(sales_rep_id,sales_rep_name,sales_rep_email,office_address) values
('S001','Balaji S','balaji@gmail.com','Address goes here'),
('S002','S Balaji','sbalaji@gmail.com','Address goes here'),
('S003','Dummy 1','dummy1@gmail.com','Address goes here'),
('S004','Dummy 2','dummy2@gmail.com','Address goes here'),
('S005','Dummy 3','dummy3@email.com','Address goes here');


-- Creating Order Data Table With linking relation
create table order_flat_order(
order_id varchar(20) primary key,
quantity int not null check (quantity > 0),
order_date date not null,
customer_id varchar(20),
foreign key (customer_id) references order_flat_customers(customer_id),
product_id varchar(20),
foreign key (product_id) references order_flat_product(product_id),
sales_rep_id varchar(20),
foreign key (sales_rep_id) references order_flat_sales(sales_rep_id)
);