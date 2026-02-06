---set operators

--(1) union operators ( combine the data from employees and customers into one table)

use SalesDB
/*
select
FirstName,
LastName
from sales.Customers

union

select
FirstName,
LastName
from sales.Employees;
*/

--(2) union all( combine the data frm employees and customers into one table ,including duplicates
/*
select
FirstName,
LastName
from sales.Customers

union all

select
FirstName,
LastName
from sales.Employees;
*/

--(3)except( find the employees who are not customers at the same time)
/*
select
FirstName,
LastName
from sales.Customers

EXCEPT

select
FirstName,
LastName
from sales.Employees;
*/


--(4) INTERSECT( FIND THE CUSTOMERS WHO ARE ALSO employees)
/*
select
FirstName,
LastName
from sales.Customers

intersect

select
FirstName,
LastName
from sales.Employees;
*/


--(5) orders are stored in separate tables (orders and orders archieve)
--combine all orders into one report without duplicates

/*
select*
from Sales.Orders


select*
from Sales.OrdersArchive
*/

select*
from Sales.Orders
union
select*
from Sales.OrdersArchive
order by OrderID