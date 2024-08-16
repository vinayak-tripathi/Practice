ALTER DATABASE Jan23TrainingDB18
ADD FILEGROUP orders_2016;

ALTER DATABASE Jan23TrainingDB18
ADD FILEGROUP orders_2017;

ALTER DATABASE Jan23TrainingDB18
ADD FILEGROUP orders_2018;

SELECT
  name
FROM sys.filegroups
WHERE type = 'FG';

-------------------------------
CREATE PARTITION FUNCTION order_by_year_function (date)
AS RANGE LEFT 
FOR VALUES ('2016-12-31', '2017-12-31','2018-12-31');
Go
-------------------------------
CREATE PARTITION SCHEME order_by_year_scheme
AS PARTITION order_by_year_function
TO ([orders_2016], [orders_2017], [orders_2018],[PRIMARY]);
Go

-------------------------------
SELECT 
	name as filename,
	physical_name as file_path
FROM sys.database_files
where type_desc = 'ROWS'; 
Go

-------------------------------
--Creating a partitioned table
CREATE TABLE sales.order_reports (
  order_date date,
  product_name varchar(255),
  amount decimal(10, 2) NOT NULL DEFAULT 0,
  PRIMARY KEY (order_date, product_name)
) 
ON order_by_year_scheme (order_date);

INSERT INTO sales.order_reports (order_date, product_name, amount)
  SELECT
    order_date,
    product_name,
    SUM(i.quantity * i.list_price * (1 - discount))
  FROM sales.orders o
  INNER JOIN sales.order_items i
    ON i.order_id = o.order_id
  INNER JOIN production.products p
    ON p.product_id = i.product_id
  GROUP BY order_date,
           product_name;

SELECT 
	p.partition_number AS partition_number,
	f.name AS file_group, 
	p.rows AS row_count
FROM sys.partitions p
JOIN sys.destination_data_spaces dds ON p.partition_number = dds.destination_id
JOIN sys.filegroups f ON dds.data_space_id = f.data_space_id
WHERE OBJECT_NAME(OBJECT_ID) = 'order_reports'
order by partition_number;


With val as
(
	Select TOp 10 * from  sales.customers)

SELECT STRING_AGG(First_Name,'-')  WITHIN GROUP ( ORDER BY First_Name ASC)  AS Result FROM val;