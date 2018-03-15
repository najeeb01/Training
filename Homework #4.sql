use homework3;

-- 1.Write a query to determine the total number of items on each order. Display the order_id and the total with a heading of TotalItems (note no spaces). Filter to only display information for order_id of 600 or higher.
select order_id, order_qty as TotalItems
from order_details
where order_id >= 600;

-- 2.Re-do query 1 but filter to only show those orders with more than 2 items ordered. Sort by the number of items ordered, lowest to highest.
select order_id, order_qty as TotalItems
from order_details
where order_qty > 2;

-- 3.The order_details table has a quantity for each item ordered. Show the total amount charged for each item on the order (quantity times price).  Display order_id, the item id, the unit price, the quantity times price of the item labeled as “Itemtotal” (note NO spaces).  Sort by order id and filter to only display those order ids between 400 and 700.
select order_id, item_id, unit_price, unit_price*order_qty AS Itemtotal
from order_details
join items USING (item_id)
where order_id between 400 and 700
order by order_id; 

-- 4.Write a query to display the total amount for each order: show the order id and total.  Sort by descending order on the total and only display orders with a total of $40 or more.
select order_id, (unit_price*order_qty) AS Total
from order_details
join items on items.item_id = order_details.item_id
where (unit_price*order_qty) >= 40;

-- 5.Re-do query 4 but show the customer name for each order (formatted as a single field with heading of Customer) along with the city, order id and total. Filter to only display customers that live in California.  Sort by city.
select order_details.order_id, Concat(customer_first_name, ' ', customer_last_name) AS Customer, customer_city, (unit_price*order_qty) AS Total
from order_details
join items on items.item_id = order_details.item_id
join orders on orders.order_id = order_details.order_id
join customers on orders.customer_id = customers.customer_id
where customer_state ='CA'
order by customer_city;

-- 6.Display the total amount of sales per item. Show title, total quantity sold with a heading of Quantity, total sales with a heading of “TotalSales” (not NO space).  Sort by highest to lowest total.
select title, sum(order_qty) AS Quantity, unit_price* sum(order_qty) AS TotalSales
from items
join order_details on order_details.item_id = items.item_id
group by title
Order by TotalSales desc ;

-- 7.Display the total sales for each customer: show customer name (as single field) with a heading of Cutomer and total.  Sort lowest to highest total.  Filter to only display customers with $50 or more in total orders.
select Concat(customer_first_name, ' ', customer_last_name) AS Customer, sum(unit_price * order_qty) AS Total
from customers
join orders on orders.customer_id = customers.customer_id
join order_details on orders.order_id = order_details.order_id
join items on items.item_id = order_details.item_id 
group by Customer
having total >= 50
order by total;

-- ***8.Use subqueries to determine which (artist) had the item ordered in highest quantity on an order? First determine the highest quantity on any order, then determine the item number associated with it, then display the artist.
select artist_name from artists
join items on artists.artist_id=items.artist_id
where item_id in
	(select item_id from order_details
	where order_qty =
    (select max(order_qty) from order_details));

-- 9.Display the total sales by artist: show artist name, total.  Sort highest to lowest.
select artist_name, unit_price * sum(order_qty) AS Total
from artists
join items using (artist_id)
join order_details using (item_id)
group by artist_name
order by Total desc;

-- 10.USE A SUBQUERY to Increase price of all items by ‘No Rest for the Weary’ by 10%. If working in MySQl you will need to disable safe mode.  Show prices before and after.  Rollback after.


-- 11.USE A SUBQUERY to display names of customers that have unshipped orders.


-- 12.Display the total amount of sales made to customers in NY  
select sum(unit_price * order_qty) AS TotalSales
from items
join order_details on order_details.item_id = items.item_id
join orders on orders.order_id = order_details.order_id
join customers on orders.customer_id = customers.customer_id
where customer_state = 'NY';

-- 13.USE A SUBQUERY to list the items (title and artist) of items that have never been ordered


-- 14.Show the order history for Samuel Jacobsen. Display the order id, order date, ship date, and total.
select  orders.order_id, order_date, shipped_date, (unit_price * order_qty) AS total 
from items
join order_details on order_details.item_id = items.item_id
join orders on orders.order_id = order_details.order_id
join customers on orders.customer_id = customers.customer_id
where customer_first_name = 'Samuel' AND customer_last_name = 'Jacobsen';
 
-- 15. Show the total amount of sales per sales rep. Display the employee name as a single field along with the total sales, sorted by highest to lowest sales.
select Concat(first_name, ' ', last_name) AS SalesRep, unit_price * sum(order_qty) AS Total
from employees
join orders on orders.employee_id = employees.employee_id
join order_details on orders.order_id = order_details.order_id
join items on items.item_id = order_details.item_id 
group by SalesRep
order by total desc;
