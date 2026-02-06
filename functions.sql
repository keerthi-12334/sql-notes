/* string functions*/


--(1) concatenate first name and country into one column
/*
select
FirstName,
Country,
concat(FirstName,'  ',Country) as name_country
from Sales.Customers
*/

--(2) convert the firstname into lower case and upper case
/*
select
FirstName,
lower(FirstName) as lower_case_name,
upper(FirstName) as upper_case_name
from Sales.Customers
*/

--(3) find the customers whose first namee contains leading
--trailing spaces
/*
use MyDatabase
select
First_Name,
len(First_Name)
from Customers
where First_Name!=Trim(First_Name)
*/


--(4)NESTED FUNCTION FOR THE SAME QUESTION length and the trim
/*
use MyDatabase
select
first_name,
len(first_name) as len_name,
len(trim(first_name))  as trim_name,
len(first_name)-len(trim(first_name)) as flag
from dbo.customers
--where First_name!=trim(First_name)
*/

--(5) replace() function
--remove '-' from a phone number
/*
select
'21-34-56' as phone,
replace('21-34-56','-','/') as replace_phone

--replace file extension from txt to csv

select
'names.txt' as text_ex,
replace('names.txt','.txt','.csv')
*/

--(6) calculate the length of each customers first name
/*
select
first_name,
len(first_name)
from customers
*/

--(7) left and right function
-- retrive the first 2 characters of each first name 
--and last 2 characters of first name
/*
select
first_name,
(left(trim(first_name),2)) as left_name,
right(first_name,2) as right_name
from customers
*/

--(8)sub string
--retreive a list of customers first name removing the first character
/*
select
first_name,
len(trim(first_name)) as trim_name,
substring(trim(first_name),2,len(first_name)) as substring_name
from customers
*/


/* numeric function*/

--round()
/*
select
3.156 as number,
round(3.156,2) as round_number
--abs() 
select
-12365 as number,
abs(-12365) as absolute_number
*/

/* date and time function*/

--(9)inorder to get the today date we use 'getdate()'
/*
use SalesDB
select
OrderID,
OrderDate,
ShipDate,
CreationTime,
getdate() AS TODAY
from Sales.Orders
*/


--(10)inorder to get date and month and year we use day(),month(),year()
/*
select
OrderDate,
day(OrderDate) as orders_date,
month(OrderDate) as  orders_month,
year(OrderDate) as orders_year
from Sales.Orders
*/

--(11)inorder to extract the week ,quarter (datepart)
/*
select
CreationTime,
datepart(week,CreationTime),
datepart(quarter,CreationTime)

from Sales.Orders
*/

--(12)inorder to extract the names of week ,month (datename)
/*
select
CreationTime,
day(CreationTime),
datename(weekday,CreationTime),
datename(month,CreationTime),
datename(quarter,creationTime)

from Sales.Orders
*/

--(13)date trunc 
/*
select
CreationTime,
DATETRUNC(DAY,CreationTime)
from sales.Orders
*/

--(14) find how many orders were done for the days
/*
select
count(*)
from sales.Orders
*/

--(15) eomonth()

---find the end of the month for creation time column
/*
use SalesDB
select
OrderID,
datetrunc(month,CreationTime) as start_of_month,
eomonth(CreationTime) as end_of_month
from sales.orders
*/


--(16) how many orders were placed in each year
/*
use SalesDB
select
year(OrderDate) as year_of_orders,
count(*) as no_of_orders
from Sales.Orders
group by year(OrderDate)
*/


--(17) how many orders were placed each month

/*
select
datename(month,OrderDate) as month_of_orders,
count(*) no_of_orders
from Sales.Orders
group by datename(month,OrderDate);
*/

--(18)show all the orders that were placed during the month of februrary
/*
select*

from Sales.Orders
where month(OrderDate)=2
*/


--(19) format the creation time
/*
select
OrderID,
CreationTime,
format(creationTime,'dd/mm/yyyy') as date_mon_year
from sales.orders
*/

/*
select
OrderID,
creationtime,
format(creationtime,'yyyy')
from sales.Orders
*/

/*
select
orderId,
creationtime,
format(creationtime,'dd') as date_orders,   
format(creationtime,'ddd') as day_orders,   
format(creationtime,'MM') as month_orders,   
format(creationtime,'MMMM') as full_month_orders, 
format(creationtime,'yy') as year_order       
from sales.orders 
*/


---(20) show creation time using the following format
--day wed jan q1 2025 12:34:56 pm
/*
select
orderID,
creationtime,
'day'+'   '+format(creationtime,'ddd   MMM')+'  '+'Q'+datename(quarter,creationtime)+'  '+
format(creationtime,'yyyy  hh:mm:ss   tt') as custom_date_time
from sales.Orders
*/


--(21)(AGGREGATION USING format function) month and the year
/*
select
format(CreationTime,'MMM yyyy') as creation_date,
count(*)
from sales.Orders
group by format(CreationTime,'MMM yyyy')
*/

--convert function
--(22) convert datatypes 
/*
select
convert(int,'123') as [string to integer],
convert(date,'2025-08-01') as [string to date],
convert(date,creationtime) as [datetime to date]
from sales.Orders
*/
--(cast function is same)

--dateadd()function
--(23) add 2 years for the orderdate
/*
select
orderdate,
dateadd(year,2,OrderDate) as add_2_years,
dateadd(year,-3,OrderDate) as sub_2_years,
dateadd(month,3,OrderDate)as add_3_months,
dateadd(day,10,OrderDate)as add_10_days

from sales.Orders
*/

--dateddiff()
--(24) caluclate the age of employees
/*
select
firstname,
datediff(year,BirthDate,getdate()) as age_of_employees
from sales.Employees
*/


--(25)find the average shipping duration in days for each month
/*
select 
datename(month,OrderDate),
avg(datediff(day,OrderDate,ShipDate)) as shipping_duration

from sales.Orders
group by datename(month,OrderDate)
*/

--(26) find no of days between each order and previous order
/*
select*
from sales.orders
*/

--isdate()
--(27)check whether a value is date or not
select
orderdate,
isdate(OrderID),
from sales.Orders
