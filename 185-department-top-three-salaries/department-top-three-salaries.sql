with s as (select e.id,e.name,e.departmentid ,d.name as department ,e.salary from employee e 
join department d on d.id=e.departmentid  order by e.salary desc ),


r as (select department,name as employee,salary, dense_rank() over(partition by departmentid order by salary desc ) as rnk from s )

select department,employee,salary from r where rnk<=3 ;