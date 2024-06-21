create database case_2;

use case_2;

alter table custom
drop column new_dob;

alter table `order`
add column new_dob date;

set sql_safe_updates=0;

update `order`
set new_dob = str_to_date(order_date, "%d-%m-%Y");

#Exercise 1 Comparison Operators

#1

select customerid, item, price
from `order`
where customerid =10449;

#2

select *
from `order`
where item = "tent";

#3
select customerid, new_dob, item
from `order` 
where item regexp "^s";

#4

select distinct item
from `order`;

#Exerise 2 Aggregate Functions

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


#Exercise 3 Group By Clause

#1

select state , count(customerid)
from custom
group by state;

#2

select item, max(price), min(price)
from `order`
group by item;

#3

select customerid, count(new_dob) as no_of_orders, sum(quantity) as sum_of_orders
from `order`
group by customerid;

#Exercisse 4 Having clause

#1

select distinct state , count(customerid) as no_of_people
from custom
group by state
having no_of_people >1;


#2

select item, max(price), min(price)
from `order`
group by item
having max(price)>190;

#3

select customerid, sum(quantity) as orderd
from `order`
group by customerid
having orderd >1;

#Exercise 5 Order By clause


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




#Exercise 6 Combining Conditions and Boolean operators

#1 

select customerid, new_dob, item
from `order`
where item NOT IN ("Snow Shoes", "Ear Muffs");


#2

select item, price
from `order`
where  item regexp "[spf]";


#Exercise 7 In and Between


#1

select item, price , monthname(new_dob) as mno
from `order`
where price between 10 and 80;

#2

select firstname, city, state
from custom
where state in ("arizona", "washington", "hawaii");


#Exercise 8 Mathematical Functions

#1

select item, (price/quantity) as PricePerUnit, quantity, price
from `order`;


#Exercise 9 Table Joins

#1

select c.customerid, firstname, lastname, city, state, o.item
from custom as c inner join `order` as o
on c.customerid = o.customerid;

#2

select c.customerid, firstname, lastname, city, state, o.item
from custom as c inner join `order` as o
on c.customerid = o.customerid
order by state desc;
