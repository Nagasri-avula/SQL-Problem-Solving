# Write your MySQL query statement below
with s as (select class,count(student) ct from courses group by class)
select class from s where ct>=5;