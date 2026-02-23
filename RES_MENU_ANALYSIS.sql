select * from menu_items;

-- t1:View the menu_items table and write a query to find the number of items on the menu--
select count(*) as Total_no_of_items from menu_items;
-- What are the least and most expensive items on the menu?--
select (select item_name from menu_items order by price asc limit 1) as LEAST_EXPENSIVE,
	   MIN(PRICE) AS MIN_PRICE,
       (SELECT item_name from menu_items order  by price desc limit 1) as 	MOST_EXPENSIVE,
       MAX(price) AS MAX_PRICE
from menu_items;
--  Query how italian dishes are there? --
select sum(case when category='Italian' then 1 else 0 end) as Total_no_of_idihes,
	    (select item_name from menu_items where category='Italian' order by price asc limit 1) as LEAST_EXPENSIVE,
(select price from menu_items where category='Italian' order by price asc limit 1) as le,
        (select item_name from menu_items where category='Italian' order by price desc limit 1) as MOST_EXPENSIVE,
        (select price from menu_items where category='Italian' order by price desc limit 1) as most
from menu_items;

-- How many dishes are in each category? What is the average dish price within each category  --
select category,count(*) as no_of_dishes,
        round((avg(price)),2) as avg_dish_price
from menu_items
group by category; 

-- 