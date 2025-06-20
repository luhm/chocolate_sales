With amount_sub as (
	select 
      "Sales Person" as sales_person,
      "Country" as country,
      "Product" as product,
      "Date" as dt,
      "Boxes Shipped" as boxes_shipped,
	  cast(replace(substring("Amount", 2, 10), ',', '') as float) as amount_cleaned
	from chocolate_sales_data
),
total_boxes_ranked as (
    select  
    product,
    sum(boxes_shipped) as total_boxes,
    rank() over (order by sum(boxes_shipped) desc) as rank
    from amount_sub
    group by product
    order by total_boxes desc
)
select product,
    total_boxes
from total_boxes_ranked
where rank = 1 OR rank = 22
group by product, total_boxes, rank
order by total_boxes
    


