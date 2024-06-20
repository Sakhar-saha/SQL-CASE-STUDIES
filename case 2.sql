create database case_2;

use case_2;

alter table custom
drop column new_dob;

alter table `order`
add column new_dob date;

set sql_safe_updates=0;

update `order`
set new_dob = str_to_date(order_date, "%d-%m-%Y");

#1

select customerid, item, price
from `order`
where customerid =10449;

#2

select *
from `order`
where item = "tent";


/*select od.customerid, od.new_dob, od.item, c.firstname
from `order` as od inner join custom as c
on od.customerid  = c.customerid
where c.firstname regexp "s";*/

#3
select customerid, new_dob, item
from `order` 
where item regexp "s";

#4

select distinct item
from `order`;


select item, count(item)
from `order`
group by item
having count(item)= 1;



#1

select item, max(price)
from `order`
group by item;

#2

select avg(price), monthname(new_dob) as m
from`order`
where month(new_dob) = 12
group by monthname(new_dob);

#3

select count(item)
from `order`;

#4

select item, min(price)
from `order`
where item ="tent";

#1

select state , count(customerid)
from custom
group by state;

#2

select item, max(price), min(price)
from `order`
group by item;

#3

select customerid, sum(quantity)
from `order`
group by customerid;

#2

select state , count(customerid) as p
from custom
group by state
having p >1;


#3

select item, max(price), min(price)
from `order`
group by item
having max(price)>190;

#4

select customerid, sum(quantity) as orderd
from `order`
group by customerid
having orderd >1;


#1

select firstname, lastname, city
from custom
order by lastname asc;


#2

select firstname, lastname, city
from custom
order by lastname desc;


#3

select item, price
from `order`
where price >10
order by price asc;








#2

select item, price
from `order`
where  item regexp "[spf]";



#1

select item, price , monthname(new_dob) as mno
from `order`
where price between 10 and 80;

#2

select firstname, city, state
from custom
where state in ("arizona", "washington", "hawaii");

#1

select item, (price/quantity) as av, quantity, price
from `order`;

#1

select c.customerid, firstname, lastname, city, state, o.item
from custom as c inner join `order` as o
on c.customerid = o.customerid;

select c.customerid, firstname, lastname, city, state, o.item
from custom as c inner join `order` as o
on c.customerid = o.customerid
order by state desc;
