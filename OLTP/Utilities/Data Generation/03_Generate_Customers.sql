USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : Data Generation
Script Name    : 03_Generate_Customers.sql
Author         : Koteswararao Ponnada
Description    : Generates 10,000 realistic customers
==============================================================*/

SET NOCOUNT ON;
GO

/*==============================================================
Delete Existing Data
==============================================================*/

TRUNCATE TABLE Master.Customers;
GO

/*==============================================================
Variable Initialization
==============================================================*/

DECLARE @FirstNameCount INT;
DECLARE @LastNameCount INT;
DECLARE @EmailDomainCount INT;
DECLARE @CityCount INT;

SELECT @FirstNameCount = COUNT(*) FROM Utility.FirstNames;
SELECT @LastNameCount = COUNT(*) FROM Utility.LastNames;
SELECT @EmailDomainCount = COUNT(*) FROM Utility.EmailDomains;
SELECT @CityCount = COUNT(*) FROM Master.Cities;

/*==============================================================
Generate Customers
==============================================================*/

INSERT INTO Master.Customers
(
      FirstName
    , LastName
    , Gender
    , DateOfBirth
    , Email
    , PhoneNumber
    , CityID
    , RegistrationDate
    , CreatedDate
    , ModifiedDate
    , IsActive
)

SELECT TOP (10000)

      FN.FirstName

    , LN.LastName

    , CASE
            WHEN N.Number % 2 = 0 THEN 'M'
            ELSE 'F'
      END

    , DATEADD
      (
            DAY,
            -(18*365 + ABS(CHECKSUM(NEWID())) % (52*365)),
            CAST(GETDATE() AS DATE)
      )

    , LOWER
      (
            FN.FirstName
            + '.'
            + LN.LastName
            + CAST(N.Number AS VARCHAR(10))
            + '@'
            + ED.DomainName
      )

    , CONCAT
      (
            '9',
            RIGHT('000000000' + CAST(ABS(CHECKSUM(NEWID())) % 1000000000 AS VARCHAR(9)),9)
      )

    , ((N.Number-1) % @CityCount) + 1

    , DATEADD
      (
            DAY,
            -(ABS(CHECKSUM(NEWID())) % 1825),
            CAST(GETDATE() AS DATE)
      )

    , DATEADD
      (
            DAY,
            -(ABS(CHECKSUM(NEWID())) % 1825),
            GETDATE()
      )

    , NULL

    , CASE
            WHEN ABS(CHECKSUM(NEWID())) % 100 < 95
            THEN 1
            ELSE 0
      END

FROM Utility.Numbers N

INNER JOIN Utility.FirstNames FN
ON FN.FirstNameID =
(
((N.Number-1) % @FirstNameCount)+1
)

INNER JOIN Utility.LastNames LN
ON LN.LastNameID =
(
((N.Number*7-1) % @LastNameCount)+1
)

INNER JOIN Utility.EmailDomains ED
ON ED.EmailDomainID =
(
((N.Number*5-1) % @EmailDomainCount)+1
)

ORDER BY N.Number;
GO

/*==============================================================
Verification
==============================================================*/

PRINT 'Customer Generation Completed';
PRINT '--------------------------------';

SELECT COUNT(*) AS TotalCustomers
FROM Master.Customers;

SELECT Gender,
       COUNT(*) AS TotalCustomers
FROM Master.Customers
GROUP BY Gender;

SELECT IsActive,
       COUNT(*) AS TotalCustomers
FROM Master.Customers
GROUP BY IsActive;

SELECT TOP (20)
       CustomerID,
       FirstName,
       LastName,
       Gender,
       DateOfBirth,
       Email,
       PhoneNumber,
       CityID,
       RegistrationDate
FROM Master.Customers
ORDER BY CustomerID;

SELECT COUNT(*) AS DuplicateEmails
FROM
(
    SELECT Email
    FROM Master.Customers
    GROUP BY Email
    HAVING COUNT(*) > 1
) D;
GO