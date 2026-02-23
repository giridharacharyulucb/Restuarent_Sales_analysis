SELECT * FROM order_details;
-- DATE RANGE OF ORDER TABLE --

SELECT MIN(order_date) as Start_date,MAX(order_date) as End_date
from order_details;

-- total no.of orders   --
select COUNT(*) as orders_num
from order_details
where order_date between '2023-01-01' and '2023-03-31';
-- maximum no. of items for an order ---
select order_id ,count(item_id) as num_items
from order_details
group by order_id
order by num_items desc ;
-- orders having more than 12 items--
select order_id ,count(item_id) as num_items
from order_details
group by order_id
having count(item_id)>12;
