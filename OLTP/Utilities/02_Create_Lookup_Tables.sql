--Create first names
USE EnterpriseRetailOLTP;
GO

/*==============================================================
Table : FirstNames
==============================================================*/

IF OBJECT_ID('Utility.FirstNames','U') IS NOT NULL
    DROP TABLE Utility.FirstNames;
GO

CREATE TABLE Utility.FirstNames
(
    FirstNameID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL
);
GO

INSERT INTO Utility.FirstNames(FirstName)
VALUES
('Aarav'),
('Vivaan'),
('Aditya'),
('Arjun'),
('Sai'),
('Krishna'),
('Rahul'),
('Kiran'),
('Rohit'),
('Vijay'),
('Priya'),
('Ananya'),
('Sneha'),
('Pooja'),
('Divya'),
('Neha'),
('Kavya'),
('Harsha'),
('Akash'),
('Nikhil');
GO

--create last names
/*==============================================================
Table : LastNames
==============================================================*/

IF OBJECT_ID('Utility.LastNames','U') IS NOT NULL
    DROP TABLE Utility.LastNames;
GO

CREATE TABLE Utility.LastNames
(
    LastNameID INT IDENTITY(1,1) PRIMARY KEY,
    LastName NVARCHAR(50)
);
GO

INSERT INTO Utility.LastNames(LastName)
VALUES
('Sharma'),
('Reddy'),
('Kumar'),
('Patel'),
('Gupta'),
('Rao'),
('Singh'),
('Verma'),
('Naidu'),
('Iyer'),
('Das'),
('Mishra'),
('Yadav'),
('Joshi'),
('Choudhary'),
('Kapoor'),
('Mehta'),
('Agarwal'),
('Ponnada'),
('Nair');
GO

