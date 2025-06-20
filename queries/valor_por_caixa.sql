With amount_sub as (
	Select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
),
boxes_value as (
    select "Country",
    "Product",
    sum("Boxes Shipped") as boxes_total,
    sum(amount_cleaned) as amount_total

from amount_sub

where "Country" = 'New Zealand'

GROUP BY "Product", "Country"
ORDER BY "Country", sum("Boxes Shipped") desc
)
Select *,
    amount_total / boxes_total as valor_por_caixa
FROM boxes_value

