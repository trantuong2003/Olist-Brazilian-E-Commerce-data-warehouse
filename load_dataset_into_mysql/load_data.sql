/*tạo database schema*/
/*nạp dữ liệu vào mysql một cách nhanh chóng*/
-- SET sql_mode = '';
load data local infile '/tmp/dataset/product_category_name_translation.csv'
into table product_category_name_translation fields terminated by ',' enclosed by '"' lines terminated by '\r\n' ignore 1 rows;


load data local infile '/tmp/dataset/olist_geolocation_dataset.csv'
into table geolocation fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

load data local infile '/tmp/dataset/olist_products_dataset.csv'
into table products fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

load data local infile '/tmp/dataset/olist_sellers_dataset.csv'
into table sellers fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

load data local infile '/tmp/dataset/olist_customers_dataset.csv'
into table customers fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

load data local infile '/tmp/dataset/olist_orders_dataset.csv'
into table orders fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

load data local infile '/tmp/dataset/olist_order_items_dataset.csv'
into table order_items fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;   

load data local infile '/tmp/dataset/olist_order_payments_dataset.csv'
into table payments fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

load data local infile '/tmp/dataset/olist_order_reviews_dataset.csv'
into table order_reviews fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

