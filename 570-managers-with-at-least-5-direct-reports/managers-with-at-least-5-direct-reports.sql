# Write your MySQL query statement below
with s as(select name ,managerid , count(managerid) over(partition by managerid) as ct from employee),
m as(select distinct managerid from s where ct>=5 )
select e.name from employee e join m on m.managerid=e.id;
