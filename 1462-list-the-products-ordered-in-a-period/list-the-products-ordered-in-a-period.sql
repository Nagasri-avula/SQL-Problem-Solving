# Write your MySQL query statement below
with s as(select p.product_id,p.product_name,p.product_category,o.order_date,o.unit from products p join orders o on p.product_id=o.product_id where month(o.order_date)=2 and year(o.order_date)=2020),

r as(select product_name, sum(unit) as unit from s
group by product_name )

select product_name,unit from r where unit>=100;