# Write your MySQL query statement below
with s as(select MANAGERID,count(managerid) over(partition by managerid) as d from employee)

select e.name from employee e join S ON S.MANAGERID=E.ID WHERE D>=5
GROUP BY E.ID,E.NAME;