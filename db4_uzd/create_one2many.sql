-- DROP TABLE status;
--DROP TABLE product_order;

--1
CREATE TABLE product (
    id INTEGER PRIMARY KEY NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(6, 2) NOT NULL
);

--2
CREATE TABLE customer (
    id INTEGER PRIMARY KEY NOT NULL,
    f_name VARCHAR(50) NOT NULL,
    l_name VARCHAR(50) NOT NULL,
    email VARCHAR(200) UNIQUE
);

--3
CREATE TABLE status (
    id INTEGER PRIMARY KEY NOT NULL,
    status_name VARCHAR(50) NOT NULL
);

--4
CREATE TABLE order_ (
    id INTEGER PRIMARY KEY NOT NULL,
    date_ INTEGER NOT NULL,
    customer_id INTEGER,
    status INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer (id),
    FOREIGN KEY (status) REFERENCES status (id)
);

--5
CREATE TABLE product_order (
    quantity INTEGER NOT NULL,
    order_id INTEGER,
    product_id INTEGER,
    FOREIGN KEY (order_id) REFERENCES order_ (id),
    FOREIGN KEY (product_id) REFERENCES product (id)
);

--6
INSERT INTO product (product_name, price)
VALUES ("smelis", 15.0);
INSERT INTO product (product_name, price)
VALUES ("trasos", 80.0);
INSERT INTO product (product_name, price)
VALUES ("juodzemis", 40.0);
INSERT INTO product (product_name, price)
VALUES ("zvyras", 130.0);

--7
INSERT INTO customer (f_name, l_name, email)
VALUES ("Jonas", "Jonaitis", "jon@ferma.lt");
INSERT INTO customer (f_name, l_name, email)
VALUES ("Petras", "Petraitis", "peter@ferma.lt");
INSERT INTO customer (f_name, l_name, email)
VALUES ("Antanas", "Antanaitis", "antan@ferma.lt");

--8
INSERT INTO status (status_name)
VALUES ("Patvirtintas");
INSERT INTO status (status_name)
VALUES ("Vykdomas");
INSERT INTO status (status_name)
VALUES ("Ivykdytas");
INSERT INTO status (status_name)
VALUES ("Atmestas");

--9
INSERT INTO order_ (date_, customer_id, status)
VALUES ("2021-01-02", 1, 1);
INSERT INTO order_ (date_, customer_id, status)
VALUES ("2021-01-15", 1, 2);
INSERT INTO order_ (date_, customer_id, status)
VALUES ("2021-01-07", 2, 3);
INSERT INTO order_ (date_, customer_id, status)
VALUES ("2021-01-08", 2, 4);
INSERT INTO order_ (date_, customer_id, status)
VALUES ("2021-01-04", 3, 3);
INSERT INTO order_ (date_, customer_id, status)
VALUES ("2021-01-06", 3, 2);

--10
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (20, 1, 1);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (30, 1, 2);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (30, 2, 1);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (60, 2, 3);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (70, 2, 4);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (50, 3, 1);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (60, 3, 2);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (70, 3, 3);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (100, 3, 4);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (100, 4, 2);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (100, 4, 3);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (60, 4, 4);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (70, 5, 1);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (20, 5, 2);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (100, 5, 3);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (70, 5, 4);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (30, 6, 2);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (100, 6, 3);
INSERT INTO product_order (quantity, order_id, product_id)
VALUES (90, 6, 4);

SELECT * FROM customer;
SELECT * FROM status;
SELECT * FROM product;
SELECT * FROM order_;
SELECT * FROM product_order;

-- SELECT customer_id, f_name, l_name, date_, order_.id FROM customer
--     JOIN order_ ON customer_id = customer.id;

SELECT order_id, l_name, date_, sum(price * quantity) as sum FROM order_
    JOIN product_order ON order_id = order_.id
    JOIN customer ON customer_id = customer.id
    JOIN product ON product_id = product.id
    GROUP BY order_id;

SELECT order_id, product_name, quantity, price, sum(price * quantity) as total FROM order_
    JOIN product_order ON order_id = order_.id
    JOIN product ON product_id = product.id
    GROUP by order_id; --, product_id; 

SELECT product_name, sum(quantity), price, sum(price * quantity) as total FROM order_
    JOIN product_order ON order_id = order_.id
    JOIN product ON product_id = product.id
    GROUP BY product_id
    HAVING status_id <= 2;

--ALTER TABLE status RENAME TO status;