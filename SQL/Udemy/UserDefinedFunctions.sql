
-------UDF_ Simple----------
Drop function if exists get_max;
Go

Create function get_max()
Returns varchar(50)
as
begin
	Declare @ans varchar(50)
	Select @ans = max([state_name].[cnt]) from 
	(Select [state], count(*) [cnt] from 
	[sales].[customers] 
		group by [state]) [state_name];
	Return @ans
end
go

Declare @ans varchar(50);
Select @ans=dbo.get_max();
Select @ans as [Max Sale City Wise];
Go


--------Medium-------------
Drop function if exists sale_by;
go

Create Function sale_by(@staff_id int)
Returns float
as 
begin
	declare @ans float
	Select @ans = sum(pri.final_price)
	from sales.final_price pri join sales.orders ord 
	on pri.order_id=ord.order_id and ord.order_status=4 and staff_id=@staff_id
	group by ord.staff_id;
	return @ans
end
Go

declare @ans as int
Declare @staffid int;
set @staffid = 3;
Select @ans = dbo.sale_by(@staffid)
print 'Sale by staff id '+cast(@staffid as varchar(3))+' is '++ cast(@ans as char(8))
Go
select * from sales.staffs
Go

-----Table returning UDF-----Hard

drop function if exists getBrandProducts;
Go

Create Function getBrandProducts
(@brand_name varchar(50))
Returns Table
as return
	Select [prod].[product_id],[prod].[product_name],[prod].[list_price],[brand].[brand_name] from 
	[production].[products] [prod] inner join 
	[production].[brands] [brand]
	on [prod].[brand_id]=[brand].[brand_id] 
	and [brand].[brand_name] like @brand_name
Go
Select * from dbo.getBrandProducts('Electra');
Go

--------------------
drop function if exists getOrders;
Go

Create Function getOrders
(@start_date date,@end_date date)
Returns Table
as return
	Select * from [sales].[orders] where [shipped_date] between @start_date and @end_date; 
Go

Select [order_id],[shipped_date],[store_id],[staff_id] from dbo.getOrders('2016-02-08','2017-12-31') order by [shipped_date];
Go