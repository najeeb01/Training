-- Database
-- drop database if exists homework3;
create database homework3;
use homework3;

-- Create Tables
create table customers( 
 customer_id           int,
customer_first_name   varchar(20),
customer_last_name     varchar(20)     not null,
customer_address       varchar(50)     not null,
customer_city         varchar(20)     not null,
customer_state         char(2)       not null,
customer_zip         char(5)     not null,
customer_phone       char(10)     not null,
customer_fax           char(10),
constraint customers_pk primary key (customer_id));

create table artists(
artist_id         int not null,
artist_name   varchar(30),
constraint artist_pk primary key (artist_id));

create table items(
item_id       int not null,
title         varchar(50)     not null,
artist_id     int     not null,
unit_price    decimal(9,2) not null,
constraint items_pk primary key (item_id),
constraint items_fk_artists foreign key (artist_id) references artists (artist_id));

create table employees(
employee_id         int     not null,
last_name           varchar(20)     not null,
first_name         varchar(20)     not null,
manager_id           int,
constraint employees_pk primary key (employee_id),
constraint emp_fk_mgr foreign key (manager_id) references employees(employee_id));

CREATE TABLE orders(order_id int not null,
customer_id       int         not null,
order_date         date       not null,
shipped_date      date,
employee_id 	  int,
constraint orders_pk primary key (order_id),
constraint orders_fk_customers    foreign key (customer_id)     references customers (customer_id),
constraint orders_fk_employees    foreign key (employee_id)     references employees (employee_id));

create table order_details(
order_id       int     not null,
item_id       int        not null,
order_qty     int        not null,
constraint order_details_pk primary key (order_id, item_id),
constraint order_details_fk_orders    foreign key (order_id)    references orders (order_id),
constraint order_details_fk_items foreign key (item_id)    references items (item_id));

-- Insert values into table
insert into customers values
(1,'Korah','Blanca','1555 W Lane Ave','Columbus','OH','43221','6145554435','6145553928'),
(2,'Yash','Randall','11 E Rancho Madera Rd','Madison','WI','53707','2095551205','2095552262'), 
(3,'Johnathon','Millerton','60 Madison Ave','New York','NY','10010','2125554800',NULL), 
(4,'Mikayla','Davis','2021 K Street Nw','Washington','DC','20006','2025555561',NULL), 
(5,'Kendall','Mayte','4775 E Miami River Rd','Cleves','OH','45002','5135553043',NULL), 
(6,'Kaitlin','Hostlery','3250 Spring Grove Ave','Cincinnati','OH','45225','8005551957','8005552826'),
(7,'Derek','Chaddick','9022 E Merchant Wy','Fairfield','IA','52556','5155556130',NULL),
(8,'Deborah','Davis','415 E Olive Ave','Fresno','CA','93728','5595558060',NULL),
(9,'Karina','Lacy','882 W Easton Wy','Los Angeles','CA','90084','8005557000',NULL),
(10,'Kurt','Nickalus','28210 N Avenue Stanford','Valencia','CA','91355','8055550584','055556689'),
(11,'Kelsey','Eulalia','7833 N Ridge Rd','Sacramento','CA','95887','2095557500','2095551302'), 
(12,'Anders','Rohansen','12345 E 67th Ave NW','Takoma Park','MD','24512','3385556772',NULL), 
(13,'Thalia','Neftaly','2508 W Shaw Ave','Fresno','CA','93711','5595556245',NULL), 
(14,'Gonzalo','Keeton','12 Daniel Road','Fairfield','NJ','07004','2015559742',NULL),
(15,'Ania','Irvin','1099 N Farcourt St','Orange','CA','92807','7145559000',NULL), 
(16,'Dakota','Baylee','1033 N Sycamore Ave.','Los Angeles','CA','90038','2135554322',NULL), 
(17,'Samuel','Jacobsen','3433 E Widget Ave','Palo Alto','CA','92711','4155553434',NULL), 
(18,'Justin','Javen','828 S Broadway','Tarrytown','NY','10591','8005550037',NULL), 
(19,'Kyle','Marissa','789 E Mercy Ave','Phoenix','AZ','85038','9475553900',NULL), 
(20,'Erick','Kaleigh','Five Lakepointe Plaza, Ste 500','Charlotte','NC','28217','7045553500',NULL),
(21,'Marvin','Quintin','2677 Industrial Circle Dr','Columbus','OH','43260','6145558600','6145557580'),
(22,'Rashad','Holbrooke','3467 W Shaw Ave #103','Fresno','CA','93711','5595558625','5595558495'), 
(23,'Trisha','Anum','627 Aviation Way','Manhatttan Beach','CA','90266','3105552732',NULL), 
(24,'Julian','Carson','372 San Quentin','San Francisco','CA','94161','6175550700',NULL), 
(25,'Kirsten','Story','2401 Wisconsin Ave NW','Washington','DC','20559','2065559115', NULL);

insert into artists(artist_id,artist_name) values 
(10, 'Umani'),
(11, 'The Ubernerds'),
(12, 'No Rest For The Weary'),
(13, 'Burt Ruggles'),
(14, 'Sewed the Vest Pocket'),
(15, 'Jess & Odie'),
(16, 'Onn & Onn');

insert into items (item_id,title,artist_id,unit_price) values 
(1,'Umami In Concert',10,17.95),
(2,'Race Car Sounds',11,13),
(3,'No Rest For The Weary',12,16.95),
(4,'More Songs About Structures and Comestibles',12,17.95),
(5,'On The Road With Burt Ruggles',13,17.5),
(6,'No Fixed Address',14,16.95),
(7,'Rude Noises',15,13),
(8,'Burt Ruggles: An Intimate Portrait',13,17.95),
(9,'Zone Out With Umami',10,16.95),
(10,'Etcetera',16,17);

insert into employees values 
(1,'Smith',    'Cindy', null),
(2,'Jones',    'Elmer', 1),
(3,'Simonian', 'Ralph', 2),
(9,'Locario',  'Paulo',1),
(8,'Leary', 'Rhea',9),
(4,'Hernandez','Olivia',9),
(5,'Aaronsen', 'Robert',4),
(6,'Watson',   'Denise',8),
(7,'Hardy',    'Thomas',2);

insert into orders values
(19, 1, '2012-10-23', '2012-10-28', 6),
(29, 8, '2012-11-05', '2012-11-11', 6),
(32, 11, '2012-11-10', '2012-11-13', NULL),
(45, 2, '2012-11-25', '2012-11-30', NULL),
(70, 10, '2012-12-28', '2013-01-07', 5),
(89, 22, '2013-01-20', '2013-01-22', 7),
(97, 20, '2013-01-29', '2013-02-02', 5),
(118, 3, '2013-02-24', '2013-02-28', 7),
(144, 17, '2013-03-21', '2013-03-29', NULL),
(158, 9, '2013-04-04', '2013-04-20', NULL),
(165, 14, '2013-04-11', '2013-04-13', NULL),
(180, 24, '2013-04-25', '2013-05-30', NULL),
(231, 15, '2013-06-14', '2013-06-22', NULL),
(242, 23, '2013-06-24', '2013-07-06', 3),
(264, 9, '2013-07-15', '2013-07-18', 6),
(298, 18, '2013-08-18', '2013-09-22', 3),
(321, 2, '2013-09-09', '2013-10-05', 6),
(381, 7, '2013-11-08', '2013-11-16', 7),
(413, 17, '2013-12-05', '2014-01-11', 7),
(442, 5, '2013-12-28', '2014-01-03', 5),
(479, 1, '2014-01-30', '2014-03-03', 3),
(491, 16, '2014-02-08', '2014-02-14', 5),
(523, 3, '2014-03-07', '2014-03-15', 3),
(548, 2, '2014-03-22', '2014-04-18', NULL),
(550, 17, '2014-03-23', '2014-04-03', NULL),
(601, 16, '2014-04-21', '2014-04-27', NULL),
(607, 20, '2014-04-25', '2014-05-04', NULL),
(624, 2, '2014-05-04', '2014-05-09', NULL),
(627, 17, '2014-05-05', '2014-05-10', NULL),
(630, 20, '2014-05-08', '2014-05-18', 7),
(651, 12, '2014-05-19', '2014-06-02', 7),
(658, 12, '2014-05-23', '2014-06-02', 7),
(687, 17, '2014-06-05', '2014-06-08', NULL),
(693, 9, '2014-06-07', '2014-06-19', NULL),
(703, 19, '2014-06-12', '2014-06-19', 7),
(778, 13, '2014-07-12', '2014-07-21', 7),
(796, 17, '2014-07-19', '2014-07-26', 5),
(800, 19, '2014-07-21', '2014-07-28', NULL),
(802, 2, '2014-07-21', '2014-07-31', NULL),
(824, 1, '2014-08-01', NULL, NULL),
(827, 18, '2014-08-02', NULL, NULL),
(829, 9, '2014-08-02', NULL, NULL);

insert into order_details values
(381,1,1),
(601,9,1),
(442,1,1),
(523,9,1),
(630,5,1),
(778,1,1),
(693,10,1),
(118,1,1),
(264,7,1),
(607,10,1),
(624,7,1),
(658,1,1),
(800,5,1),
(158,3,1),
(321,10,1),
(687,6,1),
(827,6,1),
(144,3,1),
(479,1,2),
(630,6,2),
(796,5,1),
(97,4,1),
(601,5,1),
(800,1,1),
(29,10,1),
(70,1,1),
(165,4,1),
(180,4,1),
(231,10,1),
(413,10,1),
(491,6,1),
(607,3,1),
(651,3,1),
(703,4,1),
(802,3,1),
(824,7,2),
(829,1,1),
(550,4,1),
(796,7,1),
(693,6,1),
(29,3,1),
(32,7,1),
(242,1,1),
(298,1,1),
(479,4,1),
(548,9,1),
(627,9,1),
(778,3,1),
(19,5,1),
(89,4,1),
(242,6,1),
(264,4,1),
(550,1,1),
(693,7,3),
(824,3,1),
(829,5,1),
(829,9,1);

-- 1. Use the JOIN ON syntax to write a query to display the order id, order date, customer name formatted as a single field (i.e. "Tom Jones") with a heading of Customer, and customer_city  for customers residing in the state of OHIO.   Sort the output to display the newest orders first.  
Select orders.order_id, order_date, Concat(customer_first_name, ' ', customer_last_name) AS Customer, customer_city
From customers
Join orders ON customers.customer_id = orders.customer_id
Where customer_state = 'OH'
ORDER BY order_date desc;

-- 2.  Use the JOIN USING syntax to display the order_id, order date, and shipdate for orders to Karina Lacy that have shipped. 
Select orders.order_id, order_date, shipped_date  
From customers
Join orders ON customers.customer_id = orders.customer_id
Where customer_first_name = 'Karina' AND customer_last_name = 'Lacy' AND shipped_date IS NOT NULL;

-- 3. Use the implicit join syntax (the WHERE clause) to display the last name, city, order date and ship date for all orders shipped in 2012.
Select customer_last_name, customer_city, order_date, shipped_date
From customers
Join orders ON customers.customer_id = orders.customer_id
Where shipped_date >= '2012-01-01' and shipped_date <= '2012-12-31';

-- 4. Use any join syntax EXCEPT NATURAL JOIN to list the customer_first_name and customer_last_name concatenated with an intervening space as Customer, customer city and state formatted as a single column in the format of "city, ST" with a heading of Location, order_id and order date for orders that have not shipped.  
Select Concat(customer_first_name, ' ', customer_last_name) AS Customer, Concat(customer_city, ', ', customer_state) AS Location, order_id, order_date
From customers
Join orders ON customers.customer_id = orders.customer_id
Where shipped_date IS NULL;

-- 5.  List the customer name, order date, zipcode for any customer(s) placing an order for the item titled 'Etcetera".
Select Concat(customer_first_name, ' ', customer_last_name) AS Customer_Name, order_date, customer_zip 
From customers
Join orders ON customers.customer_id = orders.customer_id
Join order_details ON order_details.order_id = orders.order_id
join items ON items.item_id = order_details.item_id
where title = 'Etcetera';

-- 6.  Write a query to list the title and artist of ONLY the items that have been ordered.  Only list each title once.
Select distinct title, artist_name
From items
Join artists ON items.artist_id = artists.artist_id
Join order_details ON items.item_id = order_details.item_id
join orders ON order_details.order_id = orders.order_id;

-- 7.  Write a query to list the title and price of all items that have been ordered by customer Millerton.
Select title, unit_price 
from items
join order_details ON order_details.item_id = items.item_id
join orders ON order_details.order_id = orders.order_id
join customers ON orders.customer_id = customers.customer_id
Where customer_last_name = 'Millerton';

-- 8. Write a query to list the last name and order id of customers that ordered any items by the artist Burt Ruggles?  
Select customer_last_name, orders.order_id
From items
Join artists ON items.artist_id = artists.artist_id
Join order_details ON items.item_id = order_details.item_id
join orders ON order_details.order_id = orders.order_id
join customers ON orders.customer_id = customers.customer_id
Where artist_name = 'Burt Ruggles';

-- 9. Write a query to display a list of titles along  with the artist name., sorted by artist name.
Select title, artist_name
From items
Join artists ON items.artist_id = artists.artist_id;

-- 10.  Write a query to display an invoice for order 693 including the title, quanty, price, and a calculated column to display the line item subtotal (quantity times price) with a heading of Subtotal.  
Select title, unit_price, order_qty, (order_qty * unit_price) AS Subtotal
from items
join order_details ON order_details.item_id = items.item_id
Where order_id = '693';

-- 11.  Display the order id, last name,  title , and quantity for any items where customers have ordered 2 or more of a particular item in an order.
Select customer_last_name, title, order_qty, orders.order_id
from items
join order_details ON order_details.item_id = items.item_id
join orders ON orders.order_id = order_details.order_id
join customers ON customers.customer_id = orders.customer_id
Where order_qty >= 2;

-- ***12. The employees table contains a list of employees of a company. An employee may be managed by another employee. To denote an employee's manager, the employee_id of the manager is entered into the manager_id field of the employee reporting to that manager. In order to produce a list of which managers supervise which employees, the table may be joined to itself using these two attributes (employee_id, manager_id). This is known as a SELF-JOIN.  Use a SELF-JOIN on the employees table to produce a result containing two columns: the concatenated last_name and first_name of the manager, and the concatenated last_name and first_name of the employee. Label the first-column supervisor, and the second-column employee. Order the output by the supervisor's last_name and first_name. 
Select concat(s.last_name, ' ', s.first_name) AS Supervisor, concat(e.last_name, ' ', e.first_name) AS Employee
From  employees e, employees s
Where e.employee_id = s.manager_id 
Order by s.last_name, s.first_name; 


-- 13.  Write a query to display the order id, order date, ship date, and customer last name for all SHIPPED orders placed on the internet (no employee id).  Show the most recently shipped orders first.
Select order_id, order_date, shipped_date, customer_last_name
From orders
join customers ON customers.customer_id = orders.customer_id
Where shipped_date IS NOT NULL AND employee_id IS NULL;


-- 14.  Write a query that displays the order id, order date, and employee name as a single field labeled Employee for each order that an employee assisted with.
Select order_id, order_date, concat(last_name, ' ', first_name) AS Employee
From orders 
join employees ON employees.employee_id = orders.employee_id;

-- 15. Write a query that displays the order id, order date, customer name as a single field labeled Customer for all orders for the sales rep Thomas Hardy, sorted by customer last name.
Select order_id, order_date, concat(customer_first_name, ' ', customer_last_name) AS Customer
From customers 
join orders ON orders.customer_id = customers.customer_id
join employees ON employees.employee_id = orders.employee_id
Where employees.first_name = 'Thomas' AND employees.last_name = 'Hardy'
order by customer_last_name;
