-- 1. Create a database
create database homework;
use homework;

-- 2. Create a sample table with at least 5 column which include the datatype INT, VARCHAR at least
create table employee(
 employee_id			INT(10) primary key,
 First_name			VARCHAR(25),
 Last_name			VARCHAR(25),
 Street_address 	VARCHAR(50),
 Zip				INT(11),
 Phone				VARCHAR(15),
 Title			VARCHAR(50),
 Hiring_date	Date
);

-- 3. Insert 5 total rows of valid data into your table
insert into employee values
(101, 'Najeeb','Syed','101 Emerald Dr','60107','3109995318','CTO','2008-05-18');

-- 4. Use Select statement to display the table
Select * 
FROM employee;

-- 5. Only Select 3 columns including the first column
Select employee_id, First_name, Title
FROM employee;