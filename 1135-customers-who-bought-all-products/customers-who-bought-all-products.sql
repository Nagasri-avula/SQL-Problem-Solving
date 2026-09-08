# Write your MySQL query statement below
with s1 as(select customer_id,count(distinct product_key) c
from customer group by customer_id)

select customer_id from s1 where c=(select count(distinct product_key) ct from product);