
-- get customers name and their emails-Simple
Drop view if exists customers_emails;
go

Create view customers_emails as
	Select [customer_id],CONCAT([first_name],' ',[last_name]) [name],[email] from sales.customers where email is not null;
Go

--Get final price of order - Medium
Drop view if exists [sales].[final_price];
Go

Create view [sales].[final_price] as
	Select *,round(list_price*quantity*(1-discount),2) final_price from sales.order_items;
GO

-- get the employee name and their manager_name-Hard
Drop view if exists staff_manager;
Go

Create view staff_manager as
	Select emp.staff_id, 
		concat(emp.first_name, ' ', emp.last_name) as employee_name,
		emp.manager_id,
		concat(mana.first_name, ' ', mana.last_name) as manager_name 
	from sales.staffs emp left join sales.staffs mana 
	on emp.manager_id=mana.staff_id;
Go
