USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : OLTP Database
Script Name    : 01_Create_Numbers_Table.sql
Description    : Creates a Numbers (Tally) table for generating
                 large sample datasets efficiently.
Author         : <Your Name>
==============================================================*/

-- Create Utility schema if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Utility')
BEGIN
    EXEC ('CREATE SCHEMA Utility');
END;
GO

-- Drop table if it already exists
IF OBJECT_ID('Utility.Numbers', 'U') IS NOT NULL
BEGIN
    DROP TABLE Utility.Numbers;
END;
GO

CREATE TABLE Utility.Numbers
(
    Number INT NOT NULL PRIMARY KEY
);
GO

;WITH Numbers AS
(
    SELECT TOP (100000)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Number
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO Utility.Numbers (Number)
SELECT Number
FROM Numbers;
GO

-- Verify
SELECT COUNT(*) AS TotalNumbers
FROM Utility.Numbers;
GO