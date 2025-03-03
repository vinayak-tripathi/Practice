-----------*************************************------------

--Insert Statements for Students Table
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (1, 'Aditya','Siddhesh', 'Kulkarni', 'EXTC', 46)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (2, 'Riddhesh',NULL, 'Shah', 'EXTC', 33)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (3, 'Sahil', 'Mahesh', 'Chorghe', 'COMPS', 99)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (4, 'Harsh', NULL, 'Vitekar', 'IT', 46)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (5, 'John', 'Johns', 'Johndo', 'IT', 77)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (6, 'Paul', 'Paulo', 'Pauly', 'EXTC', 52)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (7, 'Jay', 'Jayesh', 'Mehta', 'COMPS', 33)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (8, 'Vikas', 'Arjun', 'Mittal', 'EXTC', 21)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (9, 'Ashneer', 'Shubham', 'Grover', 'EXTC', 78)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (10, 'Gauri', 'Ramesh', 'Tendulkar', 'EXTC', 80)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (11, 'Virat', 'Jenil', 'Kohli', 'COMPS', 41)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (12, 'John', 'James', 'Gupta', 'MECH', 12)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (13, 'Jane',NULL, 'Sharma', 'EXTC', 56)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (14, 'Jenny', 'Sam', 'Verma', 'EXTC', 34)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (15, 'Jimmy', 'Ram', 'Shukla', 'IT', 69)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (16, 'Jack', 'Garry', 'Jain', 'EXTC', 44)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (17, 'Jill', 'Manoj', 'Tripathi', 'IT', 46)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (18, 'Josh', NULL, 'Shah', 'COMPS', 39)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (19, 'Sahil', 'Jenil', 'Vitekar', 'EXTC', 95)
INSERT INTO [dbo].[Student] ([Id], [FirstName], [MiddleName], [LastName], [Branch], [Marks])
VALUES (20, 'Soham', NULL, 'Mishra', 'IT', 82)

--Insert Statements for Address Table
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (1, 1, 'Thane', 'Maharashtra', 'India', 400604)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (2,2, 'Mulund', 'Jammu', 'India', 400602)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (3, 3, 'Nahur', 'Tamilnadu', 'India', 400603)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (4, 4, 'Bhandup', 'Gujarat', 'India', 400204)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (5, 5, 'Kanjurmarg', 'Maharashtra', 'India', 400604)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (6, 6, 'Vikhroli', 'Jammu', 'India', 400204)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (7, 7, 'Ghatkopar', 'Tamilnadu', 'India', 400634)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (8, 8, 'Vidyavihar', 'Maharashtra', 'India', 400304)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (9, 9, 'Kurla', 'Gujarat', 'India', 400404)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (10, 10, 'Sion', 'Jammu', 'India', 400404)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (11, 11, 'Matunga', 'Tamilnadu', 'India', 400602)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (12, 12, 'Dadar', 'Maharashtra', 'India', 400602)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (13, 13, 'Kanivali', 'Gujarat', 'India', 400603)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (14, 14, 'Malad', 'Maharashtra', 'India', 400603)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (15, 15, 'Bandra', 'Jammu', 'India', 400604)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (16, 16, 'Ram Mandir', 'Tamilnadu', 'India', 400601)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (17, 17, 'Jogeshwari', 'Maharashtra', 'India', 400601)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (18, 18, 'Vasai', 'Maharashtra', 'India', 400604)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (19, 19, 'Virar', 'Jammu', 'India', 400704)
INSERT INTO [dbo].[StudentAddress] ([Id], [StudentId], [City], [State], [Country], [Pincode])
VALUES (20, 20, 'Naigaon', 'Gujarat', 'India', 400704)

Select st.id,
	case when st.middlename is NOT NULL Then concat(st.firstName,' ',st.MiddleName, ' ', st.LastName)
		Else concat(st.firstName,' ', st.LastName) End [NAME],
	ad.City,ad.[State],ad.Country from
	Student st Left Join
	StudentAddress ad on
		st.id=ad.StudentId;


------------***************-------------------
--Testing
Update Student
Set [Marks] = 33
Where id = 4