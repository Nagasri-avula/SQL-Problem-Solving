# Write your MySQL query statement below
with s as (select product_id,new_price,change_date, row_number() over(partition by product_id order by change_date desc ) rn from products where change_date <='2019-08-16')



select product_id,new_price as price from s where rn=1  
union
select product_id, 10 as price from products 
group by product_id
having  min(change_date)>'2019-08-16';