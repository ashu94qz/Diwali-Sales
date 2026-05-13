create database zepto_sql_project

create table zepto_sql_project.zepto(
sku_id SERIAL Primary key,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availablequantity integer,
discountedsellingprice numeric(8,2),
weightingms Integer,
outofstock boolean,
quantity integer
);

use zepto_sql_project;
select * from zeptotb
limit 10;

select * from zeptotb
where name is null
or
Category is null
or
mrp is null
or
discountpercent is null
or
discountedsellingprice is null
or
weightingms is null
or
outofstock is null
or
quantity is null;

select distinct category
from zeptotb
order by category;

select outofstock, count(outofstock)
from zeptotb
group by outofstock;

select name, count(name) as "Number of SKUs"
from zeptotb
group by name
having count(name)>1
order by count(name) desc;

select * from zeptotb
where mrp = 0 or discountedsellingprice = 0;

delete from zeptotb
where mrp = 0;

update zeptotb
set mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

select mrp, discountedsellingprice from zeptotb;

select distinct name, mrp, discountpercent
from zeptotb
order by discountpercent desc
limit 10;

select distinct name,mrp
from zeptotb
where outofstock = TRUE and mrp>300
order by mrp desc;

select category,
sum(discountedsellingprice * availablequantity) as total_revenue
from zeptotb
group by category
order by total_revenue;

select distinct name, mrp, discountpercent
from zeptotb
where mrp> 500 and discountpercent<10
order by mrp desc, discountpercent desc;

select category,
round(avg(discountpercent),2) as avg_discount
from zeptotb
group by category
order by avg_discount desc
limit 5;

select distinct name, weightingms, discountedsellingprice,
round(discountedsellingprice/weightingms,2) as price_per_gram
from zeptotb
where weightingms >= 100
order by price_per_gram;

select distinct name,weightingms,
case when weightingms < 1000 then 'Low'
     when weightingms < 5000 then 'Medium'
     else 'Bulk'
     end as weight_category
from zeptotb;

select category,
sum(weightingms * availablequantity) as total_weight
from zeptotb
group by category
order by total_weight;










