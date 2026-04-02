SET FOREIGN_KEY_CHECKS = 0;

-- Xóa các bảng cũ nếu đã tồn tại (theo đúng tên bạn đặt)
DROP TABLE IF EXISTS order_reviews;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS geolocation;
DROP TABLE IF EXISTS product_category_name_translation;


create table product_category_name_translation (
    product_category_name VARCHAR(64) PRIMARY KEY,
    product_category_name_english VARCHAR(64)
);

create table geolocation(
    geolocation_zip_code_prefix INT PRIMARY KEY,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(64),
    geolocation_state VARCHAR(64)
);

create table products(
    product_id VARCHAR(255) PRIMARY KEY,
    product_category_name varchar(64) ,
    product_name_length int ,
    product_description_length FLOAT ,
    product_photos_qty int ,
    product_weight_g int ,
    product_length_cm float ,
    product_height_cm float ,
    product_width_cm float ,
    FOREIGN KEY (product_category_name) REFERENCES product_category_name_translation(product_category_name)   
);

create table sellers(
    seller_id varchar(64)  PRIMARY KEY,
    seller_zip_code_prefix INT ,
    seller_city varchar(64) ,
    seller_state varchar(64) 
);

create table customers(
    customer_id varchar(64) primary key,
    customer_unique_id varchar(32) ,
    customer_zip_code_prefix INT,
    customer_city varchar(64) ,
    customer_state varchar(64) 
);

create table orders(
    order_id varchar(64) primary key,
    customer_id varchar(64) ,
    order_status varchar(32) ,
    order_purchase_timestamp datetime , 
    order_approved_at datetime ,
    order_delivered_carrier_date datetime ,
    order_delivered_customer_date datetime ,
    order_estimated_delivery_date datetime ,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

create table order_items(
    order_id varchar(64) primary key,
    order_item_id int,
    product_id varchar(64),
    seller_id varchar(64),
    shipping_limit_date datetime ,
    price float,
    freight_value float,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

create table payments(
    order_id varchar(64) primary key ,
    payment_sequential int ,
    payment_type varchar(32) ,
    payment_installments float ,
    payment_value float ,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

create table order_reviews(
    review_id varchar(64) primary key ,
    order_id varchar(64) ,
    review_score int ,
    review_comment_title text,
    review_comment_message text,
    review_creation_date datetime ,
    review_answer_timestamp datetime,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);