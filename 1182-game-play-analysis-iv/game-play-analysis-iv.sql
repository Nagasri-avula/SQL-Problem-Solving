# Write your MySQL query statement below
with s as (select player_id,min(event_date) as first_login 
from activity group by player_id)
select round(count(a.player_id)/count(s.player_id),2) as fraction from s left join activity a  on s.player_id=a.player_id and
  a.event_date=date_add(s.first_login, interval 1 day)
 