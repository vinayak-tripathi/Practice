Use Jan23TrainingDB18;

DROP TABLE IF EXISTS users

 

CREATE TABLE users(
id INT PRIMARY KEY  NOT NULL IDENTITY(1,1),
name VARCHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL UNIQUE,
password VARCHAR(256) NOT NULL,
isAdmin BIT NOT NULL
);

 

DROP TABLE IF EXISTS products

 

CREATE TABLE products(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
name VARCHAR(100) NOT NULL,
price MONEY NOT NULL,
category VARCHAR(40) NOT NULL CHECK (category IN('Accessories', 'Clothing', 'Electronics','Fitness')),
rating INT NOT NULL CHECK (rating IN(1,2,3,4,5)),
quantity INT NOT NULL,
description VARCHAR(120));

 

INSERT INTO dbo.[users] (dbo.[users].[name], dbo.[users].[username], dbo.[users].[password], dbo.[users].[isAdmin]) VALUES ('Jenil Dave', 'davejen', 'jenil@123', 1);
INSERT INTO dbo.[users] (dbo.[users].[name], dbo.[users].[username], dbo.[users].[password], dbo.[users].[isAdmin]) VALUES ('Riddhesh Shah', 'shahrid', 'riddhesh@123', 0);
INSERT INTO dbo.[users] (dbo.[users].[name], dbo.[users].[username], dbo.[users].[password], dbo.[users].[isAdmin]) VALUES ('Sahil Chorghe', 'chorsah', 'sahil@123', 0);
INSERT INTO dbo.[users] (dbo.[users].[name], dbo.[users].[username], dbo.[users].[password], dbo.[users].[isAdmin]) VALUES ('Kunal Maniyar', 'manikun', 'kunal@123', 0);
INSERT INTO dbo.[users] (dbo.[users].[name], dbo.[users].[username], dbo.[users].[password], dbo.[users].[isAdmin]) VALUES ('Jash Mehta', 'mehtjas', 'jash@123', 0);
INSERT INTO dbo.[users] (dbo.[users].[name], dbo.[users].[username], dbo.[users].[password], dbo.[users].[isAdmin]) VALUES ('Vinayak Tripathi', 'tripvin', 'pass@123', 1);

 

INSERT INTO dbo.[products] (dbo.[products].[name], dbo.[products].[price], dbo.[products].[category], dbo.[products].[rating], dbo.[products].[quantity], dbo.[products].[description]) VALUES ('Bag', 1000, 'Accessories', 3, 50, 'Good Bag')
INSERT INTO dbo.[products] (dbo.[products].[name], dbo.[products].[price], dbo.[products].[category], dbo.[products].[rating], dbo.[products].[quantity], dbo.[products].[description]) VALUES ('Shirt', 700, 'Clothing', 4, 500, 'Good Shirt');
INSERT INTO dbo.[products] (dbo.[products].[name], dbo.[products].[price], dbo.[products].[category], dbo.[products].[rating], dbo.[products].[quantity], dbo.[products].[description]) VALUES ('Dumbbell', 5000, 'Fitness', 2, 10, 'Good Dumbbell');
INSERT INTO dbo.[products] (dbo.[products].[name], dbo.[products].[price], dbo.[products].[category], dbo.[products].[rating], dbo.[products].[quantity], dbo.[products].[description]) VALUES ('Laptop', 100000, 'Electronics', 3, 20, 'Good Laptop');
INSERT INTO dbo.[products] (dbo.[products].[name], dbo.[products].[price], dbo.[products].[category], dbo.[products].[rating], dbo.[products].[quantity], dbo.[products].[description]) VALUES ('Treadmill', 7000, 'Fitness', 5, 5, 'Good Treadmill');

 

SELECT * FROM dbo.[users];
SELECT * FROM dbo.[products];