/* window fucntions*/

/*(1) find the total sales across all the orders*/

/*
use SalesDB

select
sum(sales) as total_sales       /* highest level of aggregation*/
from sales.Orders
*/

/*(2) total sales for each product*/
/*
select
productid,
sum(sales) as total_sales            /*next level of aggreagtion*/
from sales.orders
group by ProductID
*/

/*(3) find the total sales for each product and additionally provide
details such as order_id ,order_date*/
/*
select
orderid,
productid,

orderdate,
sum(sales) over(partition by productid) as total_sales_each_product
from sales.orders 
/* over and partition by is the window functions*/
*/


/*(4) find the total sales across the orders additionally provide
details such as orderid, order data*/

/*
select
orderid,
orderdate,
sum(sales) over() as total_sales
from sales.orders
*/

/*(5) find the total sales for each product , additionally provide 
details such as order_id, order_date*/
/*
select
orderid,
orderdate,
productid,
sales,
sum(sales) over() as totalsales,
sum(sales) over(partition by productid) as total_sales_product
from sales.orders
*/

/*(6) find the total sales for each combination of product abd order
status*/
/*
select
productid,
orderstatus,
sales,


sum(sales) over(partition by productid,orderstatus) as total_sales

from sales.orders
*/

/*(7) rank each order based on thier sales from highest to lowest ,additionally provide details such as 
order_id, order_date*/
/*
select
orderid,
orderdate,
sales,
rank() over(order by sales desc) 


from sales.orders
*/


/*(8) rank customers based on their total sales*/
/*
select
customerid,
sum(sales),
rank() over(order by sum(sales) desc) as rank_customers
from sales.orders
group by CustomerID
*/


/*(9) find the total no of orders*/
/*
select
count(orderid) as total_noof_orders
from sales.orders
*/

/*(10) find the total no of orders additionally provide details 
such as order_id and order_date*/
/*
select
orderid,
orderdate,
count(*) over()
from sales.orders
*/

/*(11)find the total no orders for each customers*/

/*
select
customerid,

count(*) over(partition by customerid)

from sales.orders
*/


/*(12) find total no of customers,
additionally provide all customers details*/
/*
select
CustomerID,
firstname,
lastname,
country,
score,
count(customerid) over() as total_no_customers
from sales.Customers
*/

/*(13) find total no of scores for the customers*/
/*
select
customerid,
score,
count(score) over() as total_no_of_scores
from sales.Customers
*/

/*(14) how to find that our data has duplicates*/
/* how  to find that orders data has duplicates*/

/*select*
from(
		select
		orderid,
		count(*) over(partition by orderid) as checkpk
		from sales.OrdersArchive
		)
t where checkpk>1
*/

/*(15) find the total sales across all the orders and
total sales for each product*/
/*
select
orderid,
productid,
sum(sales) over() as total_sales,
sum(sales) over(partition by productid) as sales_products
from sales.orders
*/


/*(16) find the percentage contribution of each products sales to 
the total sales*/
/*
select
orderid,
productid,
sum(sales) over(partition by productid) as product_sales,
sum(sales) over() as total_sales,
/*percentage formula*/
--(product sales/total sales)*100
(sum(sales) over(partition by productid) *100/ cast(sum(sales) over() as decimal(10,1))) as percentage_sales



from sales.orders
*/


/*(17)find the average sales across all the orders 
and average sales for each product ,additionally add 
details such as orderid,order date*/

/*
select
orderid,
orderdate,
productid,
avg(sales) over() as avg_sales,
avg(sales) over(partition by productid) as avg_product_sales
from sales.orders
*/

/*(18) find the average scores of the customers
and additionally provide details such as customerid,and last name*/

/*
select
customerid,
firstname,
lastname,
coalesce(score,0) as scores,
avg(coalesce(score,0)) over() ,
avg(score) over()
from sales.Customers
*/

/*(20)find all the orders where sales are higher than average sales across 
all the orders*/

/*
select*
from

		(select
		orderid,
		productid,
		sales,
		avg(sales) over() as avg_sales
		from sales.orders
		
 )t where Sales > avg_sales;

 */


 /*(21) find the highest and lowest sales across all the orders
 and highest &lowest sales for each product additionally 
 provide details such asorder id , orderdate*/

 /*
 select
 orderid,
 orderdate,
 Sales,
 productid,
 min(sales) over() as min_sale,
 max(sales) over() as max_sale,
 min(sales) over(partition by productid) as lowest_sales,
 max(sales) over(partition by productid) as highest_sales
 from sales.orders
 */

 /*(22)show the employee with the highest salary*/
 /*
 select*
 from(
		select
		employeeid,
		firstname,
		lastname,
		salary,
		max(salary) over() as highest_salary
		from sales.Employees)

t where salary=highest_salary
*/

/*(23)caluclate the deviation of each sale
from both minimum and maximum sales amount*/
/*
select
sales,
min(sales) over() as minimum_sales,
max(sales) over() as maximum_sales,
sales-min(sales) over() as deviation,
max(sales)over() - sales as deviation2
from sales.orders

*/
/*(24) find the moving average of sales for each product overtime*/

/*
select
orderid,
orderdate,
productid,
sales,
avg(sales) over(partition by productid) as average_sales,
avg(sales) over(partition by productid order by orderdate asc) as moving_average
from sales.orders
*/


/*(25)



