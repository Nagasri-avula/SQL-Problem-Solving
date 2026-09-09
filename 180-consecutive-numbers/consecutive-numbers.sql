# Write your MySQL query statement below
WITH S AS(SELECT ID ,NUM,LAG(NUM) OVER() AS PREV,LEAD(NUM) OVER() AS NEXT FROM LOGS)


SELECT distinct l.NUM AS ConsecutiveNums FROM LOGS l JOIN S ON S.ID=L.ID 
WHERE l.NUM=s.prev AND l.num=s.next; 