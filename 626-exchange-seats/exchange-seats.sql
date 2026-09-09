# Write your MySQL query statement below

with s as(SELECT ID,STUDENT,LAG(ID) OVER() PREV,LEAD(ID) OVER() AS NEXT FROM SEAT)

SELECT case 
when id%2=0 then prev
when id%2=1 and next is not null then next
else id
end as id,student  from s order by id ;
