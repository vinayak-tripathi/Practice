DROP TABLE IF EXISTS [scd2].[Student]

CREATE TABLE [scd2].[Student]
(
	[Id] INT PRIMARY KEY,
	[FirstName] VARCHAR(40) NOT NULL,
	[MiddleName] VARCHAR(35),
	[LastName] VARCHAR(35) NOT NULL,
	[Branch] VARCHAR(35) NOT NULL,
	[Marks] DECIMAL NOT NULL,
    CHECK (Marks >= 0 AND Marks <= 100),
	Modified Datetime2(3) NOT NULL DEFAULT Current_TimeStamp,
);

Insert into [scd2].[Student]
		([Id]
		,[FirstName]
		,[MiddleName]
		,[LastName]
		,[Branch]
		,[Marks]) 
	values
		(3
		,'Vinayak'
		,'Ramprakash'
		,'Tripathi'
		,'ETRX'
		,34)

Delete from scd2.Student
where id=5
Insert into [scd2].[Student]
		([Id]
		,[FirstName]
		,[MiddleName]
		,[LastName]
		,[Branch]
		,[Marks]) 
	values
		(5
		,'Rohan'
		,'Rajesh'
		,'Rao'
		,'COMPS'
		,56)
Select * from [scd2].[Student]

Select max(Modified) from [scd2].[Student]

--Create Student Address table
DROP TABLE IF EXISTS [scd2].[StudentAddress]

CREATE TABLE [scd2].[StudentAddress]
(
	[Id] INT PRIMARY KEY Identity(1,1),
	[StudentId] INT,
	[City] VARCHAR(100) NOT NULL,
	[State] VARCHAR(100) NOT NULL,
	[Country] VARCHAR(100) NOT NULL,
	[Pincode] DECIMAL NOT NULL,
	Modified Datetime2(3) NOT NULL DEFAULT Current_TimeStamp,
	FOREIGN KEY(StudentId) REFERENCES Student(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Student Stats Data table
DROP TABLE IF EXISTS [scd2].[StudentStats]

-----*******************----------------

CREATE TABLE [scd2].[StudentStats]
(
	[Id] INT PRIMARY KEY Identity(1,1),
	[StudentId] INT ,
	[FullName] VARCHAR(100),
	[Branch] VARCHAR(35) NOT NULL,
	[Percentage] INT NOT NULL,
	[Location] VARCHAR(200),
	isCurrent Bit,
	Modified Datetime2(3) NOT NULL DEFAULT Current_TimeStamp,
);
Set identity_INsert scd2.StudentStats on;
Insert into scd2.StudentStats([Id],[StudentId]
           ,[FullName]
           ,[Branch]
           ,[Percentage]
           ,[Location]
           ,[Modified]) Select *,Current_TImestamp as Modified from dbo.StudentStats
--Select * from scd2.StudentStats
--Select * from production.products pro where pro.brand_id in (Select category_id from production.categories)
Set identity_INsert scd2.StudentStats off;

Select * from scd2.Student std Left join scd2.StudentAddress stdadd on std.Id = stdadd.StudentId
Select 
	std.id StudentId
	,(case when std.middlename is NOT NULL 
		Then concat(std.firstName,' ',std.MiddleName, ' ', std.LastName)
		Else concat(std.firstName,' ', std.LastName) 
		End) FullName
	,std.Branch,std.Marks
	,(SELECT Max(v) FROM 
		(VALUES (std.Modified),(stdadd.Modified)) AS value(v)) as Modified
	,Concat(stdadd.City,' ',stdadd.[State],' ',stdadd.[Country],' ',cast(stdadd.[Pincode] as Varchar)) [Location] 
from scd2.Student std 
Left join scd2.StudentAddress stdadd 
on std.Id = stdadd.StudentId

Go
Select Top 5 * from StudentAddress
Set identity_insert scd2.studentAddress ON 
Insert into scd2.StudentAddress(id,StudentId,City,[State],[Country],[Pincode],Modified) Select Top 5 *,Current_Timestamp from StudentAddress
Set identity_insert scd2.studentAddress Off
Select * from scd2.StudentAddress

Go

Create trigger StatsUpdateonDelete_Student on scd2.student
after delete
as
Begin
	Declare @deletedStudentID int
	Select @deletedStudentID = Id from deleted
	if (@deletedStudentID in (select StudentId from scd2.StudentStats))
		Update scd2.StudentStats
		Set [isCurrent]=0 where [StudentId]=@deletedStudentID
End

Go

--Drop trigger scd2.StatsUpdateonDelete_StudentAddress

Go

Create trigger StatsUpdateonDelete_StudentAddress on scd2.studentAddress
after delete
as
Begin
	Declare @deletedStudentID int
	Select @deletedStudentID = StudentId from deleted
	if (@deletedStudentID in (select StudentId from scd2.StudentStats))
		Update scd2.StudentStats
		Set [isCurrent]=0 where [StudentId]=@deletedStudentID and isCurrent=1
		insert into scd2.StudentStats([StudentId],[FullName],[Branch],[Percentage],[Location],[isCUrrent],[Modified])
		Select 
			std.id StudentId
			,(case when std.middlename is NOT NULL 
				Then concat(std.firstName,' ',std.MiddleName, ' ', std.LastName)
				Else concat(std.firstName,' ', std.LastName) 
				End) FullName
			,std.Branch,std.Marks
			,Concat(stdadd.City,' ',stdadd.[State],' ',stdadd.[Country],' ',cast(stdadd.[Pincode] as Varchar)) [Location]
			,1
			,(SELECT Max(v) FROM 
				(VALUES (std.Modified),(stdadd.Modified)) AS value(v)) as Modified
		from scd2.Student std 
		Left join scd2.StudentAddress stdadd 
		on std.Id = stdadd.StudentId Where std.Id = @deletedStudentID
End
