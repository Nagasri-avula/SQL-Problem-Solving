# Write your MySQL query statement below


with s as (select pid, tiv_2015,tiv_2016,lat,lon from insurance 
where tiv_2015  in (select tiv_2015 from insurance group by tiv_2015 having count(*)>1) and (lat,lon) in (select lat,lon from insurance group by lat,lon having count(*)=1) )

select round(sum(tiv_2016),2) as tiv_2016 from s 