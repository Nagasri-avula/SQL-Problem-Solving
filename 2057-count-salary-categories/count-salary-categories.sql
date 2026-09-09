# Write your MySQL query statement below

select c.category,count(s.account_id) accounts_count from (select account_id ,case 
when income<20000 then 'Low Salary' 
when income>=20000 and income<=50000 then 'Average Salary'
when income>50000 then 'High Salary' end as category
from accounts) s 
right join (
select 'Low Salary' as category
union all
select  'Average Salary'
union all
select 'High Salary')c
on c.category=s.category group by c.category order by accounts_count desc;