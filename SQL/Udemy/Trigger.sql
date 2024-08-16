
-------------------Trigger-----------------

Drop table if exists sales.order_status;
create table sales.order_status(
	order_status tinyint primary key,
	status varchar(25)
)
insert into sales.order_status values (1,'Pending'),(2,'Processing'),(3,'Rejeted'),(4,'Completed');

GO

Drop trigger if exists sales.demo_trigger
Go

Create trigger demo_trigger
on sales.order_status
after insert
as
begin 
	print 'insert not allowed'
	Rollback transaction
end

Select * from sales.order_status;

Insert into sales.order_status values(10,'Hello');

DROP TRIGGER sales.demo_trigger

Insert into sales.order_status values(11,'Hello');

Go


--Database level trigger--
Create trigger demo_dbleveltrg
on database
after create_table
as
begin 
Print 'Table Create'
End
GO
Drop trigger demo_dbleveltrg on database;

Drop table if exists sales.val;
Create table sales.val(id int);


-------Simple-------
Create table val(id int);
Go

create trigger trgr
on val
after insert
as 
begin 
	print 'Values inserted in table val'
end
go

insert into val values(1);
drop trigger trgr;

--------------------------------
select * from sys.schemas;


--------*****************------------------------
----trigger for value computation--Hard
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
Go


--Age calculation using trigger
Drop Trigger if exists age_trgr
Go
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
Go
--------------***********-----------------