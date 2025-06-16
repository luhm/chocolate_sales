-- Qual o chocolate favorito? (geral) 50% dark bytes
-- Quantas caixas de cada tipo são compradas por país? - acrescentei a coluna "Country". Se eu colocar para ordenar por "Country", eu consigo saber produtos por país.
	-- posso colocar também um where country = 'país' (com aspas simples) e aí vou ver só eles

select distinct "Product",
		"Country",
		sum ("Boxes Shipped")
		
from chocolate_sales_data

where "Country" = 'Canada' -- se não quiser ver o filtro de um só país, deletar essa linha

group by "Product", "Country"
order by sum ("Boxes Shipped") desc
