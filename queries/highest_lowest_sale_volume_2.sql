With amount_sub as (
	Select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
)
select "Product",
    max(amount_cleaned) as amount_max,
    min(amount_cleaned) as amount_min,
    max("Boxes Shipped") as qntd_max_de_caixas,
    min("Boxes Shipped") as qntd_min_de_caixas
from amount_sub
group by "Product"