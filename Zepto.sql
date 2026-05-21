drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category varchar(120),
name varchar(150) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity integer,
discountedSellingPrice numeric(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--sample data 
select * from zepto 
limit 10;

--null values
select * from zepto 
where name is NULL 
OR
category is NULL 
OR
mrp is NULL 
OR
discountPercent is NULL 
OR
discountedSellingPrice is NULL 
OR
weightInGms is NULL 
OR
availableQuantity is NULL 
OR
outOfStock is NULL 
OR
quantity is NULL;

--different product categories
select distinct category
from zepto 
order by category;

--products in stock vs out of stock 
select outOfStock, count(sku_id)
from zepto 
group by outOfStock;

--product names present multiple times 
select name, count(sku_id) as "Number of Skus"
from zepto
group by name 
having count(sku_id) > 1
order by count(sku_id) DESC;

--Data cleaning 

--products with price=0

select * from zepto 
where mrp = 0 or discountedSellingPrice = 0;

delete from zepto 
where mrp = 0 ;

converting paise to rupees
update zepto 
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto 

--Find the top 10 best_value products based on the discount percent 
select name, mrp, discountPercent 
from zepto order by discountPercent desc
limit 10;

--What are the products with high MRP but out of stock
select distinct name, mrp 
from zepto 
where outOfStock = true and mrp > 300
order by mrp desc

--calculate estimated revenue for each category
select category,
sum(discountedSellingPrice * availableQuantity) as total_revenue
from zepto 
group by category 
order by total_revenue;

--find all products where the MRP is greater than 500, and the discount is less than 10%
select distinct name, mrp,discountPercent
from zepto 
where mrp > 500 and discountPercent < 10 
order by mrp desc, discountpercent desc;

--identify the top 5 categories offering the highest average discount percentage
select category, 
round (avg (discountPercent),2) as avg_discount
from zepto 
group by category 
order by avg_discount desc 
limit 5;

--find the price per gram for products above 100g and sort_by best value
select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram 
from zepto where weightInGms >= 100
order by price_per_gram;

--Group the products into categories like low, medium, bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'Low'
     when weightInGms < 5000 then 'Medium'
	 else 'bulk'
	 end as weight_category
from zepto;

--what is the total inventory weight per category 
select category, 
sum(weightInGms * availableQuantity) as total_weight
from zepto 
group by category 
order by total_weight;




