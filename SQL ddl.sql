--- creating the table using ddl command(create)
/*
use MyDatabase
create table persons(
id int primary key not null,
person_name varchar(50) not null,
birth_date date,
phone_number varchar(15) not null
)
*/


/*
select*
from persons
*/


---add a new column called email to the persons(alter)
/*
alter table persons
add email varchar(50) not null
*/

/*
select*
from persons
*/


--- remove the column phone from the persons table(using alter)
/*
alter table persons
drop column phone_number
select*
from persons
*/

---delete the table persons from the database
/*
drop table persons
*/
