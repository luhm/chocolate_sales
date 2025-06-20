select *
from chocolate_sales_data
limit 10

select count(distinct "Product")
from chocolate_sales_data

-- Identify purchasing patterns across different customer segments.
-- vou tentar identificar o padrão de compra por país
	-- para isso eu preciso saber quantos produtos são comprados por cada país
	-- posso pedir pra contar as boxes - seu eu colocar só count boxes, ele conta quantas vezes ela aparece por aquele país, preciso somar os valores
	-- posso pedir pra agrupar por país

select count("Boxes Shipped") as boxes_per_country,
		"Country",
		"Product"

from chocolate_sales_data

group by "Country", "Product"

-- qual o chocolate favorito? 50% Dark bites

select distinct "Product",
		sum ("Boxes Shipped")
		
from chocolate_sales_data

group by "Product"
order by sum ("Boxes Shipped")

-- Qual país mais compra? Australia
-- Quantos produtos são comprados por cada país?

Select substring ("Amount", 2, 10) as amount_sold

from chocolate_sales_data

---

With amount_sub as (
	Select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
)

select "Country",
		sum("Boxes Shipped") as boxes_total,
		sum(amount_cleaned)
		
from chocolate_sales_data


group by "Country"
order by sum("Boxes Shipped")

