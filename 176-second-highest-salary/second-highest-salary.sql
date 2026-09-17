# Write your MySQL query statement below
with s as(select id,salary,dense_rank()over(order by salary desc) rn from employee)

select max(salary) as SecondHighestSalary from s where rn=2
