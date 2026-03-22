
-- Dim Date Decision Table
create table dim_date(
date_id int primary key,
full_date date not null,
transaction_day date not null,
transaction_month date not null,
transaction_year date not null,
month_name varchar(20) not null
);

-- Dim Store Decision table
create table dim_store(
store_id varchar(20) primary key,
store_name varchar(50) not null,
store_city varchar(50) not null
);

-- Dim Product Decision table
create table dim_product(
product_id varchar(30) primary key,
product_name varchar(100) not null,
product_category varchar(100) not null,
unit_price decimal(10,2)
); 

-- Dim Fact connection table
create table fact_sales(
sales_id varchar(30) primary key,
date_id int,
foreign key (date_id) references dim_date(date_id),
store_id varchar(20),
foreign key (store_id) references dim_store(store_id),
product_id varchar(30),
foreign key (product_id) references dim_product(product_id),
quantity int not null check (quantity > 0),
unit_price decimal (10,2) not null,
total_amount decimal (10,2) not null 
);