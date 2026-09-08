# Write your MySQL query statement below
with s as (select employee_id,name from employees where employee_id  in 
(select reports_to from employees where reports_to is not null)),

s1 as(select reports_to,count(*) as reports_count,round(avg(age)) as average_age from employees   where reports_to in (select employee_id from s) group by reports_to)

select s.employee_id ,s.name,s1.reports_count,s1.average_age from s join s1 on s.employee_id=s1.reports_to order by s.employee_id; 