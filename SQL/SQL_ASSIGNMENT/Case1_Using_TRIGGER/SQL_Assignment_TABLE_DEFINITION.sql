SELECT * FROM [dbo].[Student]
SELECT * FROM [dbo].[StudentAddress]
SELECT * FROM [dbo].[StudentStats]


--Create Student table

DROP TABLE IF EXISTS dbo.[Student]

CREATE TABLE dbo.[Student]
(
	[Id] INT PRIMARY KEY,
	[FirstName] VARCHAR(40) NOT NULL,
	[MiddleName] VARCHAR(35),
	[LastName] VARCHAR(35) NOT NULL,
	[Branch] VARCHAR(35) NOT NULL,
	[Marks] DECIMAL NOT NULL,
    CHECK (Marks >= 0 AND Marks <= 100)
);

--Create Student Address table
DROP TABLE IF EXISTS dbo.[StudentAddress]

CREATE TABLE dbo.[StudentAddress]
(
	[Id] INT PRIMARY KEY,
	[StudentId] INT,
	[City] VARCHAR(100) NOT NULL,
	[State] VARCHAR(100) NOT NULL,
	[Country] VARCHAR(100) NOT NULL,
	[Pincode] DECIMAL NOT NULL,
	FOREIGN KEY(StudentId) REFERENCES Student(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Student Stats Data table
DROP TABLE IF EXISTS dbo.[StudentStats]

-----*******************----------------

CREATE TABLE dbo.[StudentStats]
(
	[Id] INT PRIMARY KEY Identity,
	[StudentId] INT,
	[FullName] VARCHAR(100),
	[Branch] VARCHAR(35) NOT NULL,
	[Percentage] INT NOT NULL,
	[Location] VARCHAR(200),
	FOREIGN KEY(StudentId) REFERENCES Student(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

----------------*********************----------------

/*
Trigger For the updating the values in stats table only for the passed students
*/
Drop Trigger if exists Insert_Stats1
Go

Create trigger Insert_Stats1
on student
after insert
as
Begin
	Declare @fullName varchar(150)
	Declare @stid int
	Declare @marks int
	Declare @branch Varchar(5)
	Declare @add varchar(200)
	Select @stid = st.Id,@fullName = (case when st.middlename is NOT NULL Then concat(st.firstName,' ',st.MiddleName, ' ', st.LastName)
		Else concat(st.firstName,' ', st.LastName) End), @branch = branch, @marks = marks from inserted st
	Select @add = Concat(City,', ',[State],', ',[Country],', Pincode:',cast([Pincode] as Varchar)) from StudentAddress where StudentId = @stid
	if (@marks>=40)
	Begin
		Insert into StudentStats(studentid, Fullname, Branch, [Percentage],[Location])
		values(@stid,@fullName,@branch,@marks,@add)
	END
END
Go

-----------*************************************------------
/*
Updating the location in Stats trigger based on the action done
*/
Drop Trigger if exists InsertUpdateDelete_Stats1_Location
Go
Create Trigger InsertUpdateDelete_Stats1_Location
On StudentAddress
After Insert,Update, Delete
as
Begin
	Declare @add varchar(200)
	Declare @stid Int
	if (EXISTS(SELECT 1 FROM Inserted))
		Begin
			Select @stid = StudentId,@add = Concat(City,', ',[State],', ',[Country],', Pincode:',cast([Pincode] as Varchar)) from 
				Inserted 
			--if (EXISTS(SELECT 1 FROM StudentStats where StudentId=@stid))
			--Begin
				Update StudentStats
				Set Location = @add
				Where StudentId=@stid
				Print 'Location Updated for Passed Student'
	END
	Else
		Begin
			Update StudentStats
				Set Location = NULL
				Where StudentId in (Select ad.StudentId from deleted ad)
				Print 'Location Deleted for Passed Student'
		End
End
Go
-----------*************************************------------
/*
Trigger for the updating values for students details and also handling the case when marks changes in the student table
*/
Drop Trigger if exists Update_Stats1
Go

Create trigger Update_Stats1
on student
after Update
as
Begin
	Declare @fullName varchar(150)
	Declare @stid int
	Declare @marks int
	Declare @Old_marks int
	Declare @branch Varchar(5)
	Declare @add varchar(200)
	Select @stid = st.Id,@fullName = (case when st.middlename is NOT NULL Then concat(st.firstName,' ',st.MiddleName, ' ', st.LastName)
		Else concat(st.firstName,' ', st.LastName) End), @branch = branch, @marks = marks from inserted st
	Select @Old_marks = marks from deleted st
	Select @add = Concat(City,' ',[State],' ',[Country],' ',cast([Pincode] as Varchar)) from StudentAddress where StudentId = @stid
	if (@old_marks<=40 and @marks>=40)
	Begin
		Insert into StudentStats(studentid, Fullname, Branch, [Percentage],[Location])
		values(@stid,@fullName,@branch,@marks,@add)
	END
	Else if (@old_marks>=40 and @marks<=40)
	Begin
		Delete from StudentStats where Studentid=@stid
	End
	Else if (@old_marks>=40 and @marks>=40)
	Begin
		Update StudentStats
		Set [FullName] = @fullName, Branch = @branch, [Percentage]=@marks,[Location] = @add
		Where StudentId = @stid
	End
	Else
		Print'Updated for failed Student'
END
Go
