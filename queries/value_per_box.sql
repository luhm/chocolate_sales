With amount_sub as (
	Select *,
	cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
),
qntd_product as (
    select "Product",
        sum(amount_cleaned) as qntd_de_valor,
        sum("Boxes Shipped") as qntd_de_caixas
    from amount_sub
    group by "Product"
)
select *,
    trunc((qntd_de_valor / qntd_de_caixas)::numeric, 2) as valor_por_caixa
from qntd_product
