-- Session #1 Feb 15 Wednesday

-- Create Database Syntax
-- Create database databasename;
create database training;
use training;

-- drop database training; 

-- Create Table

-- Create Table table_name(
-- column1 datatype,
-- column2 datatype,
-- column3 datatype,
-- ...
-- columnsN datatype,
-- primary key (column1)
-- );

create table zipcode(
 zip 	int(11) primary key,
 city 	varchar(25),
 state	char(5)
);

create table student(
 Student_id			int(10) primary key,
 First_name			VARCHAR(25),
 Last_name			VARCHAR(25),
 Street_address 	VARCHAR(50),
 Zip				int(11),
 Phone				VARCHAR(15),
 Employer			VARCHAR(50),
 Registration_date	Date
  
);
 
-- inserting data into table
insert into zipcode values
(60107,'Streamwood','IL'),
(60067,'Palatine','IL'),
(10078,'New York','NY');

insert into student values
(102, 'Fred','Crocitto','101 Emerald Dr','60107','3109995318','IBM','2018-05-18');

select * FROM zipcode;
select * FROM student;

select zip from student;

-- Session #2 Feb/20/2018 Tuesday

create table customers(
customer_id		int(11)		primary key,
customer_name	varchar(50),
contact_name		varchar(50),
address		varchar(50),
city	varchar(50),
postal_code varchar(50),
country varchar(50)
);

insert into customers values
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

SELECT * FROM customers
WHERE country = 'Mexico';

update customers
set contact_name = 'Brian Bulls'
where customer_id = 5;

SELECT * FROM CUSTOMERS;

-- Session #3 Feb/23/2018 Friday
-- drop database if exists train;
create database train;
use train;

create table Parts (
part_id            int            primary key        auto_increment,
part_desc        varchar(50),
retail_price                double(8,2),
wholesale_price         double(8,2),
units_on_hand        int(10)
);


CREATE TABLE orders
(
order_id          int                not null,
part_id          int                 not null,
order_date            date               not null,
shipped_date      date,
constraint orders_pk
    primary key (order_id)
);

insert into orders values
(19, 11020, '2012-10-23', '2012-10-28'),
(29, 11022, '2012-11-05', '2012-11-11'),
(32, 11022, '2012-11-10', '2012-11-13'),
(45, 11024,'2012-11-25', '2012-11-30'),
(70, 11020, '2012-12-28', '2013-01-07'),
(89, 11023, '2013-01-20', '2013-01-22'),
(97, 11021, '2013-01-29', '2013-02-02'),
(118, 11021, '2013-02-24', null),
(144, 11022, '2013-03-21', null);

insert into Parts values
(11020, 'Screw Driver', 10.23, 5.00, 10),
(11021, 'Screws', 20.98, 12.93, 29),
(11022, 'Drill Machine', 11.23, 6.03, 20),
(11023, 'Tool Set', 50.33, 30.29, 39),
(11024, 'Ranch Set', 49.88, 34.49, 21);

Select orders.part_id, order_date, shipped_date
FROM parts
join orders on parts.part_id = orders.part_id;


-- Session #4 Feb/27/2018 Tuesday 
use homework3;
-- Aggregate Functions

-- Max
select max(unit_price) from items;

-- Min
select min(unit_price) from items;

-- Count
select * from orders;

select count(shipped_date) from orders;

-- Count *
select count(*) from orders;

-- Sum
select sum(unit_price) from items
where item_id = 1 or item_id = 2;

-- Avg

select round(avg(unit_price),2) from items;

-- SYNTAX
-- SELECT column1, column2
-- FROM table1, table2
-- WHERE [conditions]
-- GROUP BY column1, column2
-- HAVING [conditions]
-- ORDER BY column1, column2;

select * from items;
select * from artists;
select * from order_details;

select artist_id, sum(unit_price*order_qty) as total from order_details
join items using (item_id)
join artists using (artist_id)
group by artist_id
having total < 300
order by total;

-- knowing case - when and then
select item_id, unit_price,
Case 
when item_id = 1 then 100
when item_id = 5 then 500
else 1000 end 
from items;


-- Exist Query
-- SELECT column-names
-- FROM table-name
-- WHERE EXISTS
--    (SELECT column-name
--    FROM table-name
-- 		WHERE condition)
select item_id, unit_price from items
where exists
	(select artist_id from artists where artist_id = 10);



-- ALTER TABLE table_name ADD column_name datatype;
alter table items add sample int;
select * from items;

-- ALTER TABLE table_name RENAME column_name datatype;
alter table items rename sample to classSample;

-- ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE items DROP COLUMN sample;
 
-- ALTER TABLE table_name RENAME TO new_table_name;
alter table items rename to item_table;