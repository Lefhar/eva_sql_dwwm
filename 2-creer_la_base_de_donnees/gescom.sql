DROP DATABASE IF EXISTS gescom;

CREATE DATABASE gescom;

USE gescom;



CREATE TABLE countries(
   cou_id INT NOT NULL AUTO_INCREMENT,
   cou_name VARCHAR(50),
   PRIMARY KEY(cou_id)
);

CREATE TABLE category(
   cat_id INT NOT NULL AUTO_INCREMENT,
   cat_name VARCHAR(50) NOT NULL,
   cat_subcat INT,
   PRIMARY KEY(cat_id)
);

CREATE TABLE customers(
   cus_id INT NOT NULL AUTO_INCREMENT,
   cus_lastname VARCHAR(50) NOT NULL,
   cus_firstname VARCHAR(50) NOT NULL,
   cus_address VARCHAR(150) NOT NULL,
   cus_zipcode VARCHAR(5) NOT NULL,
   cus_city VARCHAR(50),
   cus_mail VARCHAR(255),
   cus_phone VARCHAR(10) NOT NULL,
   cus_password VARCHAR(60) NOT NULL,
   cus_add_date DATETIME NOT NULL,
   cus_update_date DATETIME NOT NULL,
   cus_cou_id INT NOT NULL,
   PRIMARY KEY(cus_id),
   CONSTRAINT `customers_fk_1` FOREIGN KEY(cus_cou_id) REFERENCES countries(cou_id)
);

CREATE TABLE suppliers(
   sup_id INT NOT NULL AUTO_INCREMENT,
   sup_name VARCHAR(50) NOT NULL,
   sup_city VARCHAR(50),
   sup_address VARCHAR(150),
   sup_contact VARCHAR(100),
   sup_phone VARCHAR(10),
   sup_mail VARCHAR(75),
   sup_cou_id INT NOT NULL,
   PRIMARY KEY(sup_id),
    CONSTRAINT `suppliers_fk_2` FOREIGN KEY(sup_cou_id) REFERENCES countries(cou_id)
   );

CREATE TABLE products(
   pro_id INT NOT NULL AUTO_INCREMENT,
   pro_cat_id int NOT null,
   pro_name VARCHAR(50) NOT NULL,
   pro_blocked INT(1),
   pro_ref VARCHAR(50),
   pro_ean INT,
   pro_stphy INT,
   pro_stalert INT,
   pro_price DECIMAL(6,2),
   pro_color VARCHAR(50) NOT NULL,
   pro_description VARCHAR(300) NOT NULL,
   pro_d_add DATETIME,
   prod_d_mod DATETIME,
   pro_picture VARCHAR(150),
   sup_id INT NOT NULL,
     PRIMARY KEY(pro_id),
   CONSTRAINT `products_fk_3` FOREIGN KEY(pro_cat_id) REFERENCES category(cat_id),
    CONSTRAINT `products_fk_4` FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);
