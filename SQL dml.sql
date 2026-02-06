

--select*
--from customers

--(1) insert the values from 6 into the tabl using dml 
--command (insert)  manual way
/*
use MyDatabase
select*
from customers
*/

/*
insert into customers(id,first_name,country,score)
values	
		--(8,'ramya','germany',600),
		--(9,'lavanay','uk',300),
		--(10,'rakesh','usa',200)
		(11,'greetha','uk',null);
select*
from customers;
*/

--(2) insert data from customers table to persons table
/*
use MyDatabase
select*
from persons
*/

/* here source table customer so use select command*/
/*
insert into persons(id,person_name,birth_date,phone_number)
select
id,
first_name,
null,
'unknown'
from customers
*/

--(3) change the score of the id 6 to 0 
/*
select*
from customers

update customers
set score=0
where id=6
*/

--(4) change the score of customer with id 10 to 0
-- and update the country to uk
/*
update customers
set score=0,
country='uk'
where id=10

select*
from customers
*/


--(5)update all customers with a null score by setting their score to 0
/*
update customers
set score=0
where score is null
select* 
from customers
*/



--(6)delete all customers with an id greater than 5
/*
delete from customers
where id>5
select*
from customers
*/



--(7) delete all data from persons table
/*
delete from persons

select*
from persons
*/

--(8) truncate also can be used
/*
truncate table persons
*/
/*
select*
from persons
*/