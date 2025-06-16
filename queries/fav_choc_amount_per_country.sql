-- Qual o chocolate favorito de cada país? OK
-- Qual país mais gasta com chocolates?

With amount_sub as (
	Select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
)

select "Country",
        "Product",
        sum("Boxes Shipped") as boxes_total,
        sum(amount_cleaned) as amount_total

from amount_sub

GROUP BY "Product", "Country"
ORDER BY "Country", sum("Boxes Shipped") desc