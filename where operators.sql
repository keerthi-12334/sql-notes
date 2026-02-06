select*
from customers
/* comparison operators*/
-- '=' operator
--(1)retrive all customers from germany
/*
select*
from customers
where country='Germany
*/

-- not equal to !=
--(2) retrieve all customers who are not from germany
/*
select*
from customers
where country!='Germany'
*/

-- greater than (>)
--(3)retrive all customers with score greather than 500
/*
select*
from customers
where score>500
*/

-- greater than or equal to (>=)
--(4) retrieve all customers with a score of 500 or more
/*
select*
from customers
where score>=500
*/


 --less than(<)
--(5)retrieve all customers with a score less than 500
/*
select*
from customers
where score<500
*/


--less than or equal to(<=)
--(6)retreive all customers with a score of 500 or less
/*
select*
from customers
where score<=500
*/


/* logical operator*/

--and operator(AND)
--(7)retrive all customers who are from the usa and have 
-- a score greater than 500
/*
select*
from customers
where country='USA' and score>500
*/

--or operator
--(8) retrieve all customers who are either from usa 
--or have a score greater than 500
/*
select*
from customers
where country='USA' or score>500 
*/

--not operator
--(9)retrieve all customers with a score not less than 500
/*
select*
from customers
where not score<500
*/

/* range operator*/

-- between opeartor
--(10)retrive all customers whose scores falls in range between 100 
--and 500
/*
select*
from customers
where score between 100 and 500
*/


/* membership operator*/
--IN operator
--(11)retrieve all customers from either germany or usa
/*
select*
from customers
where country='Germany' or country='USA'
*/

                 --or--
/*
select*
from customers
where country in ('Germany','USA')
*/

--NOT IN
--(11)retreive countries except germany and usa
/*
select*
from customers
where country not in('Germany','USA')
*/

/*search operator*/

--like operator
--(12) find all customers whose first name starts with 'm'
/*
select*
from customers
where first_name like 'm%'
*/

--(13) find all cutomers whose first name ends with 'n'
/*
select*
from customers
where first_name like '%n'
*/

--(14) find all cutomers whose first name contains 'r'
/*
select*
from customers
where first_name like '%r%'
*/

--(15) find all customers whose first name has 'r' in third position
/*
select*
from customers
where first_name like '__r%'

select*
from customers
*/