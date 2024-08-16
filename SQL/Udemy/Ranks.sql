exec sal_customers;
select order_id,sum(final_price) from sales.final_price group by order_id;

----Medium---------
select cust.customer_id,concat(cust.first_name,' ',cust.last_name) customer_name,
	pri.total_price total_order_cost,
	ROW_Number() over( order by pri.total_price) [row number],
	rank() over(order by pri.total_price desc) [Rank]
	from
	sales.customers cust inner join 
	sales.orders ord 
		on cust.customer_id=ord.customer_id inner join 
	(select order_id,sum(final_price) total_price
		from sales.final_price 
		group by order_id) 
		pri 
		on pri.order_id=ord.order_id;

-----Hard-------
select cust.customer_id,concat(cust.first_name,' ',cust.last_name) customer_name,
	pri.total_price total_order_cost,
	ROW_Number() over( order by pri.total_price) [row number],
	rank() over(order by pri.total_price desc) [Rank],
	DENSE_RANK() over(order by pri.total_price desc) [Dense_Rank],
	NTILE(10) over(order by pri.total_price desc) [Ntile]
	from
	sales.customers cust inner join 
	sales.orders ord 
		on cust.customer_id=ord.customer_id inner join 
	(select order_id,sum(final_price) total_price
		from sales.final_price 
		group by order_id) 
		pri 
		on pri.order_id=ord.order_id;

