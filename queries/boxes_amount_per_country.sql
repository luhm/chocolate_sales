
with amount_sub as (
	select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
)
select "Country",
		sum("Boxes Shipped") as boxes_total,
		sum(amount_cleaned) as amount_total	
from amount_sub
group by "Country"
order by sum("Boxes Shipped")
