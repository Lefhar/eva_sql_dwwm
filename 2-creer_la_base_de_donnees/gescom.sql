DROP DATABASE IF EXISTS gescom;

CREATE DATABASE gescom;

USE gescom;



CREATE TABLE countries(
   cou_id INT,
   cou_name VARCHAR(50),
   PRIMARY KEY(cou_id)
);

CREATE TABLE category(
   cat_id INT,
   cat_name VARCHAR(50) NOT NULL,
   cat_subcat INT,
   PRIMARY KEY(cat_id)
);

CREATE TABLE customers(
   cus_id INT,
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
   cou_id INT NOT NULL,
   PRIMARY KEY(cus_id),
   UNIQUE(cou_id),
   FOREIGN KEY(cou_id) REFERENCES countries(cou_id)
);

CREATE TABLE suppliers(
   sup_id INT,
   sup_name VARCHAR(50) NOT NULL,
   sup_city VARCHAR(50),
   sup_address VARCHAR(150),
   sup_contact VARCHAR(100),
   sup_phone VARCHAR(10),
   sup_mail VARCHAR(75),
   cou_id INT NOT NULL,
   PRIMARY KEY(sup_id),
   UNIQUE(cou_id),
   FOREIGN KEY(cou_id) REFERENCES countries(cou_id)
);

CREATE TABLE products(
   cat_id INT,
   pro_id INT,
   pro_name VARCHAR(50) NOT NULL,
   pro_blocked LOGICAL,
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
   PRIMARY KEY(cat_id),
   UNIQUE(sup_id),
   UNIQUE(pro_id),
   FOREIGN KEY(cat_id) REFERENCES category(cat_id),
   FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
);
