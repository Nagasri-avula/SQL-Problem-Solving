# Write your MySQL query statement below

#with s as (select id ,recorddate , lag(recorddate) over() as d from weather)

with s as(select id ,recorddate ,lag(recorddate) over(order by recorddate) as d, lag(temperature) over(order by recorddate) as prev_temp,temperature from weather order by recorddate asc)

select w.id from weather w join s on s.id=w.id where w.temperature>s.prev_temp and datediff(w.recorddate,s.d)=1;