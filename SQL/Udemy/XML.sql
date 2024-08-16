
---saving to xml datatype
Drop table if exists xml_table
DECLARE @var_XML XML = ''
SET @var_XML = '<employee>
  <firstname type="textbox">Jim''my</firstname>
  <lastname type="textbox">Bischoff</lastname>
  <email type="email">jimmy0@adventure-works.com</email>
  <title type="textbox">Database Engineer</title>
  <age type="number">45</age>
  <gender type="checkbox">
	<value is_selected="1">Male</value>
	<value is_selected="0">Female</value>
  </gender>
</employee>'
Select @var_XML as xml;
    
Create table xml_table(xmldata XML);
insert into xml_table values (@var_XML);
Select * from [dbo].[xml_table]

--------------------
--get XML format of the sql table
exec sal_customers;

Select top 10 * from sales.customers
for xml auto, elements, root('Root');---the row roots are the table name

Select * from sales.customers
for xml raw, elements, root('Root');---row roots are ROW

-----Getting value from element in data
Select [xmldata].query('employee/firstname') [First Name] from
	[dbo].[xml_table]

Select [xmldata].query('(employee/gender/value)[1]') [First Name] from
	[dbo].[xml_table]---works without paranthesis also

Select [xmldata].value('(employee/gender/value)[1]','varchar(6)') [First Name] from
	[dbo].[xml_table] ---Require a singleton value so use [index]

----------------------
--display xml in tabular

declare @xmlhandle int
declare @xmldoc xml

set @xmldoc = (Select top 10 * from sales.customers
				for xml auto, elements, root('Root'))

exec sp_xml_preparedocument @xmlhandle output, @xmldoc

select * from openxml(@xmlhandle,'/Root/sales.customers',3)
with (first_name varchar(50), last_name varchar(50), email varchar(50))
Select @xmlhandle;

exec sp_xml_removedocument @xmlhandle --free resources


---------------------------------
-------XML with many rows

insert into xml_table values (
	'<employee>
	  <firstname type="textbox">Hermoine</firstname>
	  <lastname type="textbox">Granger</lastname>
	  <email type="email">hermoineg.granger@hogwarts.edu.in</email>
	  <title type="textbox">Student</title>
	  <age type="number">16</age>
	  <gender type="checkbox">
		<value is_selected="0">Male</value>
		<value is_selected="1">Female</value>
	  </gender>
	</employee>'
);


Declare @gen int;
Set @gen=1;
Select [xmldata].value('(employee/gender/value[@is_selected=sql:variable("@gen")])[1]','varchar(6)') [First Name] from
	[dbo].[xml_table]


