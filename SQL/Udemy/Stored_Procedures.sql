--------------***********-----------------

---Stored Procedures-----------

--normal

Create procedure prod_brand
as
SET nocount on
Select * from production.brands;
Go

Create procedure prod_categories
as
SET nocount on
Select * from production.categories;
Go

Create procedure prod_products
as
SET nocount on
Select * from production.products;
Go

Create procedure prod_stocks
as
SET nocount on
Select * from production.stocks;
Go

Create procedure sal_customers
as
SET nocount on
Select * from sales.customers;
Go

Create procedure sal_order_items
as
SET nocount on
Select * from sales.order_items;
Go

Create procedure sal_orders
as
SET nocount on
Select * from sales.orders;
Go

Create procedure sal_staffs
as
SET nocount on
Select * from sales.staffs;
Go

Create procedure sal_stores
as
SET nocount on
Select * from sales.stores;

----------------------------
drop proc if exists mytestproc;
Go
create procedure mytestproc
as
SET NOCOUNT ON --to set meggase of rows that are affected
Select cat.category_name, count(*) from production.products prod 
inner join production.categories cat 
on prod.category_id=cat.category_id group by cat.category_name;

exec mytestproc;

--parmater
drop proc if exists CountsInYear;

create procedure CountsInYear
@year int = 2016
as
Set nocount on
Select cat.category_name, count(*) from production.products prod 
inner join production.categories cat 
on prod.category_id=cat.category_id where prod.model_year = @year group by cat.category_name;


exec CountsInYear 2018;
exec CountsInYear @year=2018;
exec CountsInYear; --this will use the default value of 2013;

-------------
drop proc if exists MaxCountCategory;

create procedure MaxCountCategory
@maxcount int output
as
Set @maxcount = (Select max(final.counts) from 
	(Select cat.category_name, count(*) counts from production.products prod 
	inner join production.categories cat 
	on prod.category_id=cat.category_id 
	group by cat.category_name) final);

declare @ans int;
declare @ret int;
exec @ret = MaxCountCategory @maxcount=@ans output;
select @ans 'Max count of a category';
select @ret as 'Default return value';

drop proc MaxCountCategory;

-----
drop proc if exists MaxCountCategoryYear;
create procedure MaxCountCategoryYear
@start_year int = 2016,
@end_year	int = 2019,
@maxcount int output
as
Set @maxcount = (Select isnull(max(final.counts),0) from 
	(Select cat.category_name, count(*) counts from production.products prod 
	inner join production.categories cat 
	on prod.category_id=cat.category_id where prod.model_year between @start_year and @end_year
	group by cat.category_name) final);

declare @ans int;
exec MaxCountCategoryYear @end_year = 2018, @start_year = 2016, @maxcount=@ans output;
select @ans;

exec prod_products;
exec sal_order_items;

select * from sales.final_price;

select order_id, sum(final_price) from sales.final_price group by order_id;

Select * from sales.orders order by store_id,staff_id;
exec sal_orders

--------****HARD**---
Drop table if Exists t1;
Create table t1(
	id int Not null Identity primary key,--AutoINcrement
	DOB Date,
	age int
)
Go
Create Procedure ageCheckInsertinT1
@dob date,
@result int
as
	Begin Transaction
		Insert into [dbo].[t1](dob)
		values(@dob);
	Declare @age int
	Select @age = Datediff(yy,@dob,getDate())
	If (@age>18)
	Begin
		Print 'Insertion done'
		Commit Transaction
	ENd
	Else
	Begin
		Raiserror('Age is less than 18 years',16,1)
		--severity and priority
		Rollback Transaction
	End

Exec ageCheckInsertinT1 @dob = '2005-08-22', @result = 2;

Select * from t1;