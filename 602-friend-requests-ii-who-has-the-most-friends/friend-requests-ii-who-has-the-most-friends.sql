select t.person_id as id,count(*) as num from
(select requester_id as person_id from requestaccepted
union all
select accepter_id as person_id from requestaccepted) as t
group by t.person_id order by num desc limit 1;