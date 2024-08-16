----CTE
--Simple
With CTE
as (
	Select [product_name],[brand_id],[list_price] from [production].[products]
)
Select brand_id,round(avg(list_price),2) [Average Price Of Same Brands] from cte Group By brand_id


--grouping sets
Select [product_name],[brand_id],[category_id],[model_year], sum(list_price) from 
	[production].[products] group by grouping sets(
		([product_name]),
		([product_name],[category_id]),
		([product_name],[category_id],[brand_id]),
		([product_name],[category_id],[brand_id],[model_year])
	)

--rollup
Select [product_name],[brand_id],[category_id],[model_year], sum(list_price) from 
	[production].[products] group by Rollup (
		([product_name],[category_id],[brand_id],[model_year])
	)

--cube
Select [product_name],[brand_id],[category_id],[model_year], sum(list_price) from 
	[production].[products] group by cube (
		([product_name],[category_id],[brand_id],[model_year])
	)