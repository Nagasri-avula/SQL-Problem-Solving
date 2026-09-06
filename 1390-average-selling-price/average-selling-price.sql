with d1 as( select prices.product_id, start_date, end_date, price, purchase_date, units, case when purchase_date between start_date and end_date then "yes" else "no" end as stat from prices left join unitssold on prices.product_id=unitssold.product_id where (purchase_date between start_date and end_date) or purchase_date is null) 


select product_id, coalesce((round((sum((price*units)) / sum(units)), 2)), 0) as average_price from d1 group by product_id;