-- join two tables --
SELECT *
FROM menu_items m
join order_details o on o.item_id=m.menu_item_id;
-- least ordered most ordered with category--
SELECT m.item_name,count(o.order_id) as Least_ordered
FROM menu_items m
left join order_details o on o.item_id=m.menu_item_id
group by m.item_name
order by Least_ordered asc limit 1;

SELECT m.item_name,count(o.order_id) as Most_ordered
FROM menu_items m
left join order_details o on o.item_id=m.menu_item_id
group by m.item_name
order by Most_ordered desc limit 1;


-- top 5 orders -
SELECT o.order_id,sum(m.price) as total_spend
FROM menu_items m
LEFT join order_details o on o.item_id=m.menu_item_id
group by o.order_id
order by sum(m.price) desc limit 5;

-- highest spend order with items--
SELECT o.order_id,sum(m.price) as total_spend
FROM menu_items m
LEFT join order_details o on o.item_id=m.menu_item_id
group by o.order_id
order by sum(m.price) desc limit 1;

SELECT o.item_id,o.order_id,m.item_name,m.category,m.price
FROM menu_items m
LEFT join order_details o on o.item_id=m.menu_item_id
order by m.price desc limit 1;

SELECT MAX(M.PRICE)
FROM menu_items m
LEFT join order_details o on o.item_id=m.menu_item_id;
-- Average Sales Per month ---
SELECT month(o.order_date) as `month`,avg(m.price) as Average_sales
FROM menu_items m
join order_details o on o.item_id=m.menu_item_id
group by month(o.order_date);
-- Average Sales Of each Food item per month--
SELECT month(o.order_date) as `month`,m.item_name,(m.price) as Average_sales
FROM menu_items m
join order_details o on o.item_id=m.menu_item_id
group by month(o.order_date),m.item_name,Average_sales;
-- Average Sales of mexican food --
select m.item_name,ROUND((AVG(m.price)),2) as Average_sales
FROM menu_items m
join order_details o on o.item_id=m.menu_item_id
where m.category='Mexican'
group by m.item_name
order by Average_sales desc;

select m.category,ROUND((AVG(m.price)),2) as Average_sales
FROM menu_items m
join order_details o on o.item_id=m.menu_item_id
where m.category='Mexican'
group by m.category;

-- Total spent per category --
select m.category,sum(m.price) as Total_Spent
FROM menu_items m
join order_details o on o.item_id=m.menu_item_id
group by m.category
order by Total_spent desc;

