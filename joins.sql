
/*joins*/


--(1) retrieve all data from customers and orders as separate results(no join)

use MyDatabase

select*
from customers;
select*
from orders;

--(2)get all customers with their orders ,but only for customers who have placed an order
--(inner join)
/*
select
		id,
		first_name,
		country,
		score,
		order_id,
		order_date,
		sales
from customers
inner join orders
on customers.id=orders.customer_id
*/



--(3) get all customers along with their orders including those without orders
/*
select
c.id,
c.first_name,
o.order_id,
o.sales
from customers  as c
left join orders as o
on c.id= o.customer_id
*/

--(4) get all customers along with their orders ,including orders without matching customers
/*
select
c.id,
c.first_name,
o.order_id,
o.sales
from customers  as c
right join orders as o
on c.id= o.customer_id
*/
