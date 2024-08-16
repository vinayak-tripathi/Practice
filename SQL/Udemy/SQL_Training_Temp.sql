create table sales.order_status(
	order_status tinyint primary key,
	status varchar(25)
)
Drop table sales.order_status;

insert into sales.order_status values (1,'Pending'),(2,'Processing'),(3,'Rejeted'),(4,'Completed');

-- getting the employee name and their manager_name
Create view staff_manager as
Select emp.staff_id, 
	concat(emp.first_name, ' ', emp.last_name) as employee_name,
	emp.manager_id,
	concat(mana.first_name, ' ', mana.last_name) as manager_name 
from sales.staffs emp left join sales.staffs mana 
on emp.manager_id=mana.staff_id;

Select * from staff_manager;

select * from production.products order by brand_id, category_id;
Select * from sales.orders;
-------------------Trigger-----------------
Select * from production.categories;
Create trigger demo_trigger
on sales.order_status
after insert
as
begin 
print 'insert not allowed'
end
go

Select * from sales.order_status;

Insert into sales.order_status values(9,'Hello');

DROP TRIGGER sales.demo_trigger
Insert into sales.order_status values(10,'Hello');



--Database level trigger--
Create trigger demo_dbleveltrg
on database
after create_table
as
begin 
Print 'Table Create'
End
GO

Create table sales.val(id int);

Drop trigger demo_dbleveltrg on database;
-------
Create table val(id int);

create trigger trgr
on val
after insert
as begin 
print 'Values inserted in table val'
end
go

insert into val values(1);
drop trigger trgr;

--------------------------------
select * from sys.schemas;


--------*****************------------------------
----trigger for value computation
DROP TABLE IF EXISTS [dbo].t1;

Create table t1(
	id int,
	DOB date,
	age int
)

--age calculation using  computed columns******
--Alter TABLE t1
--drop column Age;
--Alter TABLE t1
--add Age as datediff(yy,DOB,getdate());

insert into t1(id,DOB) values(1,'2001-08-22');
select * from t1;

--Age calculation using trigger
create TRIGGER age_trgr
ON t1
AFTER INSERT, UPDATE
AS
IF ( UPDATE (dob) )
BEGIN
UPDATE t1
SET age = datediff(yy,dob,getdate())
WHERE id IN (SELECT DISTINCT id FROM inserted)
END;

INSERT INTO t1 (id,DOB) values(1,'2001-08-22');

SELECT * FROM t1;

--------------***********-----------------

---Stored Procedures-----------

--normal
create procedure mytestproc
as
SET NOCOUNT ON --to set meggase of rows that are affected
Select cat.category_name, count(*) from production.products prod 
inner join production.categories cat 
on prod.category_id=cat.category_id group by cat.category_name;

exec mytestproc;

drop proc mytestproc;

--parmater

create procedure CountsInYear
@year int = 2016
as
set nocount on
Select cat.category_name, count(*) from production.products prod 
inner join production.categories cat 
on prod.category_id=cat.category_id where prod.model_year = @year group by cat.category_name;


exec CountsInYear 2018;
exec CountsInYear @year=2018;
exec CountsInYear; --this will use the default value of 2013;
drop proc CountsInYear;

create procedure MaxCountCategory
@maxcount int output
as
Set @maxcount = (Select max(final.counts) from 
	(Select cat.category_name, count(*) counts from production.products prod 
	inner join production.categories cat 
	on prod.category_id=cat.category_id 
	group by cat.category_name) final);

declare @maxcount int;
exec MaxCountCategory @maxcount output;
select @maxcount;

drop proc MaxCountCategory;

create procedure MaxCountCategoryYear
@year int = 2016,
@maxcount int output
as
Set @maxcount = (Select isnull(max(final.counts),0) from 
	(Select cat.category_name, count(*) counts from production.products prod 
	inner join production.categories cat 
	on prod.category_id=cat.category_id where prod.model_year=@year
	group by cat.category_name) final);

declare @maxcount int;
exec MaxCountCategoryYear 2016, @maxcount output;
select @maxcount;


-----*******************888888

---User defined function---------

 