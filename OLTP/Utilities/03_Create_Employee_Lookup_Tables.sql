USE EnterpriseRetailOLTP;
GO

/*==============================================================
Table : JobTitles
Schema: Utility
==============================================================*/

IF OBJECT_ID('Utility.JobTitles','U') IS NOT NULL
    DROP TABLE Utility.JobTitles;
GO

CREATE TABLE Utility.JobTitles
(
    JobTitleID INT IDENTITY(1,1) PRIMARY KEY,
    JobTitle NVARCHAR(100) NOT NULL,
    Department NVARCHAR(50) NOT NULL,
    MinSalary DECIMAL(18,2),
    MaxSalary DECIMAL(18,2)
);
GO

INSERT INTO Utility.JobTitles
(JobTitle,Department,MinSalary,MaxSalary)
VALUES
('CEO','Management',300000,300000),
('Regional Manager','Management',180000,200000),
('Store Manager','Management',100000,140000),
('Assistant Manager','Management',70000,90000),
('Sales Executive','Sales',30000,60000),
('Cashier','Sales',25000,35000),
('Inventory Executive','Operations',30000,45000),
('Customer Support Executive','Customer Service',30000,45000),
('HR Executive','HR',45000,70000),
('Finance Executive','Finance',50000,80000),
('IT Support Engineer','IT',50000,90000);
GO