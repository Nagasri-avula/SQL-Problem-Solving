# Write your MySQL query statement below
with s1 as (select turn,person_id,person_name,sum(weight) over(order by turn)as curr_weight from queue)
 
 select person_name from s1 where curr_weight=(select max(curr_weight) from s1 where curr_weight<=1000)