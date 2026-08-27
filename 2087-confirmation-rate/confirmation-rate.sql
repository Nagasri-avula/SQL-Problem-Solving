# Write your MySQL query statement below
select s.user_id,coalesce(round(sum(case when c.action='confirmed' then 1 else 0 end)/count(action),2),0) as confirmation_rate 
from confirmations c 
right join signups s  on s.user_id=c.user_id group by s.user_id ;