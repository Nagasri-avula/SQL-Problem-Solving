# Write your MySQL query statement below
with s as(select num,count(num) ct from mynumbers group by num)
select max(s.num) as num from s left join mynumbers s2 on s.num=s2.num  where ct=1;