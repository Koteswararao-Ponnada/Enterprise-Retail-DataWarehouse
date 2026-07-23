USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.JobTitles;
GO

INSERT INTO Utility.JobTitles (JobTitle)
VALUES
('Chief Executive Officer'),
('Chief Operating Officer'),
('Chief Financial Officer'),
('IT Director'),
('HR Director'),
('Regional Manager'),
('Area Manager'),
('Store Manager'),
('Assistant Store Manager'),
('Inventory Manager'),
('Warehouse Supervisor'),
('Sales Supervisor'),
('Senior Sales Executive'),
('Sales Executive'),
('Customer Support Executive'),
('Cashier'),
('Inventory Executive'),
('Procurement Executive'),
('Accounts Executive'),
('HR Executive'),
('Marketing Executive'),
('Delivery Coordinator'),
('Business Analyst'),
('Database Administrator'),
('System Administrator'),
('Network Engineer'),
('Technical Support Engineer'),
('Data Engineer'),
('Data Analyst'),
('Power BI Developer');
GO

-- Verification
SELECT COUNT(*) AS TotalJobTitles
FROM Utility.JobTitles;

SELECT *
FROM Utility.JobTitles
ORDER BY JobTitleID;
GO