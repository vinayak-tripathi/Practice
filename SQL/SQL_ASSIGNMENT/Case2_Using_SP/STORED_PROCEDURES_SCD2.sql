USE Jan23TrainingDB18;

Drop proc if exists scd2_FullHistory
GO

--Updation on delete is beign handled by the triggeres rest is done by the stored procedures
Create procedure scd2_FullHistory
As
	Declare @last_modified_std as DATETIME2
	Declare @last_modified_stdadd as DATETIME2
	Declare @last_modified_stat as DATETIME2
	Select @last_modified_stat=isnull(max([Modified]),cast(-53690 as datetime)) from [scd2].[StudentStats]
	Select @last_modified_std=isnull(max([Modified]),cast(-53690 as datetime)) from [scd2].[Student]
	Select @last_modified_stdadd=isnull(max([Modified]),cast(-53690 as datetime)) from [scd2].[StudentAddress]
	Select @last_modified_stat STAT, @last_modified_stdadd ADDreess, @last_modified_std
	if ((@last_modified_stat<@last_modified_std)or(@last_modified_stat<@last_modified_stdadd) or (@last_modified_stdadd is Null))
	Begin
		Print 'Hello'
		Declare @stdID int
		Declare @fullname varchar(100)
		Declare @branch varchar(6)
		Declare @Marks int
		Declare @Modified Datetime2(3)
		Declare @Location varchar(200)
		DECLARE stu_cursor CURSOR FOR
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
			on std.Id = stdadd.StudentId where std.Modified>@last_modified_stat or  stdadd.Modified>@last_modified_stat
		OPEN stu_cursor
		FETCH NEXT FROM stu_cursor into
			@stdID,@fullname,@branch,@Marks,@Modified,@Location
		WHILE @@FETCH_STATUS = 0
		Begin
			Print @Fullname
			if (@stdID Not IN (Select [StudentId] from scd2.StudentStats) and @Marks>40)
				Insert into scd2.StudentStats([StudentId],[FullName],[Branch],[Percentage],[Location],[isCUrrent],[Modified])
				Values(@stdID,@fullname,@branch,@marks,@Location,1,@Modified)
			ELse if (@stdID IN (Select [StudentId] from scd2.StudentStats) and @Marks>40)
			Begin
				--Select @Location = Concat(City,', ',[State],', ',[Country],', Pincode:',cast([Pincode] as Varchar)) from scd2.StudentAddress
				Update scd2.StudentStats
				SET [isCurrent] = 0, [Modified]=@Modified
				Where [StudentId]=@stdID and isCurrent=1
				Insert into scd2.StudentStats([StudentId],[FullName],[Branch],[Percentage],[Location],[isCUrrent],[Modified])
				Values(@stdID,@fullname,@branch,@marks,@Location,1,@Modified)
			End
			ELse if (@Marks<40)
			Begin
				--Select @Location = Concat(City,', ',[State],', ',[Country],', Pincode:',cast([Pincode] as Varchar)) from scd2.StudentAddress
				Update scd2.StudentStats
				SET [isCurrent] = 0, [Modified]=@Modified
				Where [StudentId]=@stdID and isCurrent=1
			End
			Else
			Begin
			 print'Error'
			End
			--Else if (@ID NOT IN (Select [StudentId] from scd2.StudentStats) and @Marks>40)
			--Begin
				
			--	Select @Location = Concat(City,', ',[State],', ',[Country],', Pincode:',cast([Pincode] as Varchar)) from scd2.StudentAddress
			--	Update scd2.StudentStats
			--	SET [isCurrent] = 0, [Modified]=CURRENT_TIMESTAMP
			--	Where [StudentId]=@ID and isCurrent=1
			--	Insert into scd2.StudentStats([StudentId],[FullName],[Branch],[Percentage],[Location],[isCUrrent],[Modified])
			--	Values(@ID,Concat(@firstName,' ',@MiddleName,' ', @LastName),@branch,@marks,@Location,1,@Modified)
			--End
			--Else if (@ID Not IN (Select [StudentId] from scd2.StudentStats) and @Marks>40)
			--Begin
			--	Select @Location = Concat(City,', ',[State],', ',[Country],', Pincode:',cast([Pincode] as Varchar)) from scd2.StudentAddress
			--	Insert into scd2.StudentStats([StudentId],[FullName],[Branch],[Percentage],[Location],[isCUrrent],[Modified])
			--	Values(@ID,Concat(@firstName,' ',@MiddleName,' ', @LastName),@branch,@marks,@Location,1,@Modified)
			--End

			FETCH NEXT FROM stu_cursor into
				@stdID,@fullname,@branch,@Marks,@Modified,@Location
		END
		CLOSE stu_cursor
		DEALLOCATE stu_cursor
	END
	Print 'Bd'
	
Go

Delete from scd2.studentStats

Exec scd2_FullHistory
Select * from scd2.student
Select * from Scd2.StudentStats
Select * from scd2.StudentAddress


--testing Codes
Select isnull(max([Modified]),cast(-53690 as datetime)) from [scd2].[StudentStats]
Delete from Scd2.StudentAddress where StudentId = 4

update scd2.Student set Marks = 44, Modified = current_TimeStamp where Id = 4
update scd2.StudentAddress set [city] = 'Nesco', Modified = current_TimeStamp where Id = 1
update scd2.StudentAddress set [city] = 'Nesco',[State]='Banglore',[Pincode]=401501, Modified = current_TimeStamp where StudentId = 4

Insert into scd2.Student values (4,'New','Rohan','Rao','CIVIL',44,current_timestamp)
Insert into scd2.StudentAddress([studentid],[city],[state],[country],Pincode,Modified) values
	(4,'Nesco','Banglore','India',401501,current_timestamp)
