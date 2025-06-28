
-------------------------------------------------------------------
-------------- Zepto Inventory Analysis Project -------------------
-------------------------------------------------------------------

-- Creating Database:
Create database zepto_analysis;

-- use database
use zepto_analysis;

-- loading the data from csv file


------------------------------------------------------------------------
-- Data Exploration
------------------------------------------------------------------------
-- Count of rows
Select count(*) from zepto;


-- sample data 
Select * from zepto
limit 5;


-- null values in data
Select * from zepto
where Category is null
or name is null
or mrp is null
or discountPercent is null
or availableQuantity is null
or discountedSellingPrice is null
or weightInGms is null
or outOfStock is null
or quantity is null;


-- Different Product categories
Select 
	distinct category 
from zepto
order by category;
 
 
-- Product Categories and their products
Select 
	category,
    count(*) as product_count
from zepto
group by category;


-- Count of Products in Stock vs Out of Stock
 Select 
	outOfStock,
    count(*) as products_count
from zepto
group by outOfStock;


-- product names present multiple times ie their skus
Select
	name,
	count(name) as "No of SKUs"
from zepto
group by name
having count(name)>1
order by count(name) desc;


--------------------------------------------------------------------
-- Data Cleaning
---------------------------------------------------------------------

-- Product with Price 0
Select * from zepto 
where mrp =0 or discountedSellingPrice=0;

Delete from zepto
where mrp=0;


-- Converting currency from paise to rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

Select * from zepto limit 5;


-----------------------------------------------------------------------
-- Q1. Find the top 10 best-value products based on the discount percentage.
-----------------------------------------------------------------------
Select 
	distinct name as Products,
    mrp,
    discountPercent
from zepto 
order by discountPercent desc
limit 10;


-----------------------------------------------------------------------
-- Q2.What are the Products with High MRP but Out of Stock
-----------------------------------------------------------------------
Select 
	distinct name as Products,
    mrp
from zepto
where outOfStock = "True"
and mrp > 300                      -- Let threshold for high mrp is 300
order by mrp desc;


-----------------------------------------------------------------------
-- Q3.Calculate Estimated Revenue for each category
-----------------------------------------------------------------------
Select
	Category,
    sum(discountedSellingPrice * availableQuantity) as Total_Revenue
from zepto
group by Category
order by Total_Revenue desc;


-----------------------------------------------------------------------
-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
-----------------------------------------------------------------------
Select 
	name as Products,
    mrp,
    discountPercent
from zepto 
where mrp>500 and discountPercent<10
order by mrp desc, discountPercent desc;


-----------------------------------------------------------------------
-- Q5. Identify the top 5 categories offering the highest average discount percentage.
-----------------------------------------------------------------------
Select
	Category,
    round(avg(discountPercent),2) as Average_Discount_Percentage
from zepto
group by Category
order by Average_Discount_Percentage desc
limit 5;


-----------------------------------------------------------------------
-- Q6. Find the price per gram for products above 100g and sort by best value.
-----------------------------------------------------------------------
Select
	distinct name as Products,
    round(discountedSellingPrice/weightInGms ,2) as Price_per_gram
from zepto
where weightInGms>100
order by Price_per_gram asc;


-----------------------------------------------------------------------
-- Q7.Group the products into categories like Low, Medium, Bulk.
-----------------------------------------------------------------------
-- Let for bulk more than 3000, medium 1000-3000, low less than 1000
Select 
	distinct name as Products,
    case when weightInGms <= 1000 then "Low"
    when weightInGms<= 3000 then "Medium"
    else "Bulk" end as weight_category
from zepto;


-----------------------------------------------------------------------
-- Q8.What is the Total Inventory Weight Per Category 
-----------------------------------------------------------------------
Select 
	Category,
    concat(round(sum(availableQuantity * weightInGms)/1000,2), " Kg") as Total_Weight_Kg
from zepto
group by Category
order by sum(availableQuantity * weightInGms) desc;

