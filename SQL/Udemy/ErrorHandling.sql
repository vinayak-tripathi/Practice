--*************-----
---Transaction and Error Handling-------

-----simple-Trnasactions-------
exec sal_customers
Begin Transaction
	Update [sales].[customers]
	set phone='(916) 381-6003'
	where customer_id=4

select *from sales.customers
Commit Transaction
Go

---------Medium-Transactions

SET IDENTITY_INSERT production.brands ON;  
Begin Transaction
	Insert into [production].[brands](brand_id,brand_name)
	values (1,'Honda');

Declare @ErrorResult int;
Set @ErrorResult = @@ERROR;---inbuild variable
If (@ErrorResult= 0)
Begin
	Print 'Insertion done'
	Commit Transaction
ENd
Else
Begin
	Raiserror('Some error occurred',16,1)
	--severity and priority
	Rollback Transaction
End
SET IDENTITY_INSERT production.brands OFF; 

Select * from [production].[brands];

-------Try and catch--Error Handling-SImple
--No breaking of code, handles it and executes it

SET IDENTITY_INSERT production.brands ON;  
Begin Try
	Begin Transaction
		Insert into [production].[brands](brand_id,brand_name)
		values (1,'Honda');
	Commit Transaction
ENd Try
Begin Catch
	Print'Handled Error Below is the Error Statment'
	Print Error_Message() ---Error Message
	Rollback transaction
End Catch
SET IDENTITY_INSERT production.brands OFF; 

