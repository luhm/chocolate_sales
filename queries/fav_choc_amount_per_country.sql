

With amount_sub as (
	Select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
),
ranking as (select "Country" as country,
        "Product" as product,
        sum("Boxes Shipped") as boxes_total,
        sum(amount_cleaned) as amount_total,
        ROW_NUMBER() OVER (PARTITION BY "Country"  ORDER BY "Country", sum("Boxes Shipped") desc)  as row_number
from amount_sub
GROUP BY "Product", "Country"
)
select 
        country,
        product,
        boxes_total,
        amount_total
from ranking
where row_number < 4
ORDER BY country, boxes_total desc