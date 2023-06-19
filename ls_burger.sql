CREATE TABLE orders (
    id integer,
    customer_name text,
    burger text,
    side text,
    drink text
);

INSERT INTO orders VALUES (1, 'Todd Perez', 'LS Burger', 'Fries', 'Lemonade');
INSERT INTO orders VALUES (2, 'Florence Jordan', 'LS Cheeseburger', 'Fries', 'Chocolate Shake');
INSERT INTO orders VALUES (3, 'Robin Barnes', 'LS Burger', 'Onion Rings', 'Vanilla Shake');
INSERT INTO orders VALUES (4, 'Joyce Silva', 'LS Double Deluxe Burger', 'Fries', 'Chocolate Shake');
INSERT INTO orders VALUES (5, 'Joyce Silva', 'LS Chicken Burger', 'Onion Rings', 'Cola');

INSERT INTO countries VALUES ('France',	'Paris',	67158000,	'Europe');
INSERT INTO countries VALUES ('USA',	'Washington D.C.',	325365189,	'North America');
INSERT INTO countries VALUES ('Germany',	'Berlin',	8234,400,	'Europe');
INSERT INTO countries VALUES ('Japan',	'Tokyo',	126672000,	'Asia');
INSERT INTO countries VALUES ('Egypt',	'Cairo',	96308900,	'Africa');
INSERT INTO countries VALUES ('Brazil',	'Brasilia',	208385000,	'South America');


INSERT INTO continents (continent_name) VALUES
('Africa'),
('Asia'),
('Europe'),
('North America'),
('South America');

INSERT INTO countries (name, capital, population, continent_id)
VALUES ('Brazil', 'Brasilia', 208385000, 5),
('Egypt', 'Cairo', 96308900, 1),
('France', 'Paris', 67158000, 3),
('Germany', 'Berlin', 82349400, 3),
('Japan', 'Tokyo', 126672000, 2),
('USA', 'Washington D.C.', 325365189, 4);

INSERT INTO albums (album_name, released, genre, label, singer_id)
VALUES ('Born to Run', '1975-08-25', 'Rock and roll', 'Columbia', 1),
('Purple Rain', '1984-06-25', 'Pop, R&B, Rock', 'Warner Bros', 6),
('Born in the USA', '1984-06-04', 'Rock and roll, pop', 'Columbia', 1),
('Madonna', '1983-07-27', 'Dance-pop, post-disco', 'Warner Bros', 5),
('True Blue', '1986-06-30', 'Dance-pop, Pop', 'Warner Bros', 5),
('Elvis', '1956-10-19', 'Rock and roll, Rhythm and Blues', 'RCA Victor', 7),
('Sign o'' the Times', '1987-03-30', 'Pop, R&B, Rock, Funk', 'Paisley Park, Warner Bros', 6),
('G.I. Blues', '1960-10-01', 'Rock and roll, Pop', 'RCA Victor', 7);


ls_burger=# SELECT * FROM orders;
 id | customer_name  |         burger          |    side     |      drink      |     customer_email      | customer_loyalty_points | burger_cost | side_cost | drink_cost
----+----------------+-------------------------+-------------+-----------------+-------------------------+-------------------------+-------------+-----------+------------
  3 | Natasha O'Shea | LS Double Deluxe Burger | Onion Rings | Chocolate Shake | natasha@osheafamily.com |                      42 |        6.00 |      1.50 |       2.00
  2 | Natasha O'Shea | LS Cheeseburger         | Fries       |                 | natasha@osheafamily.com |                      18 |        3.50 |      1.20 |       0.00
  1 | James Bergman  | LS Chicken Burger       | Fries       | Lemonade        | james1998@email.com     |                      28 |        4.50 |      1.20 |       1.50
  4 | Aaron Muller   | LS Burger               | Fries       |                 |                         |                      13 |        3.00 |      1.20 |       0.00
(4 rows)



CREATE TABLE customers(
  id serial PRIMARY KEY,
  customer_name varchar(100)
);

CREATE TABLE email_addresses(
  customer_id int PRIMARY KEY,
  customer_email varchar(50),
  FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (customer_name)
VALUES ('James Bergman'),
('Natasha O''Shea'),
('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email)
VALUES (1, 'james1998@email.com'),
(2, 'natasha@osheafamily.com');


INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points)
VALUES ('LS Burger', 3.00, 'Burger', 10 ),
('LS Cheeseburger', 3.50, 'Burger', 15 ),
('LS Chicken Burger', 4.50, 'Burger', 20 ),
('LS Double Deluxe Burger', 6.00, 'Burger', 30 ),
('Fries', 1.20, 'Side', 3 ),
('Onion Rings', 1.50, 'Side', 5 ),
('Cola', 1.50, 'Drink', 5 ),
('Lemonade', 1.50, 'Drink', 5 ),
('Vanilla Shake', 2.00, 'Drink', 7 ),
('Chocolate Shake', 2.00, 'Drink', 7 ),
('Strawberry Shake', 2.00, 'Drink', 7);

INSERT INTO orders (customer_id, order_status)
VALUES (1, 'In Progress'),
(2, 'Placed'),
(2, 'Complete'),
(3, 'Placed');


INSERT INTO order_items (order_id, product_id)
VALUES (1, 3),
(1, 5),
(1, 6),
(1, 8),
(2, 2),
(2, 5),
(2, 7),
(3, 4),
(3, 2),
(3, 5),
(3, 5),
(3, 6),
(3, 10),
(3, 9),
(4, 1),
(4, 5);

SELECT countries.name, continents.continent_name
FROM countries JOIN continents
ON countries.continent_id = continents.id;