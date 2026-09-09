# Write your MySQL query statement below
with s as(select R.user_id,NAME,count(R.rating) as ct 
from movierating R JOIN 
USERS U ON  U.USER_ID=R.USER_ID
 group by user_id ORDER BY NAME),

S1 AS (select R.movie_id ,M.TITLE, avg(R.rating) as avg ,ROW_NUMBER() OVER() RN from movierating R JOIN MOVIES M ON R.MOVIE_ID=M.MOVIE_ID
 where date_format(R.created_at,'%M-%Y')='February-2020' GROUP BY R.MOVIE_ID  ORDER BY M.TITLE)

(SELECT NAME  AS RESULTS FROM  S WHERE CT=(SELECT MAX(CT) FROM S) LIMIT 1)
UNION ALL
(SELECT TITLE FROM S1 WHERE AVG=(SELECT MAX(AVG) FROM S1) LIMIT 1);