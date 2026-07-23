USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : Data Generation
Script Name    : 03_Generate_Customers.sql
Author         : Koteswararao Ponnada
Description    : Generate 10,000 realistic customers
==============================================================*/

SET NOCOUNT ON;
GO

/*==============================================================
Delete Existing Customers
==============================================================*/

DELETE FROM Master.Customers;
GO

/*==============================================================
Load Lookup Data
==============================================================*/

IF OBJECT_ID('tempdb..#FirstNames') IS NOT NULL DROP TABLE #FirstNames;
IF OBJECT_ID('tempdb..#LastNames') IS NOT NULL DROP TABLE #LastNames;
IF OBJECT_ID('tempdb..#EmailDomains') IS NOT NULL DROP TABLE #EmailDomains;

SELECT
    ROW_NUMBER() OVER(ORDER BY FirstNameID) AS RN,
    FirstName
INTO #FirstNames
FROM Utility.FirstNames;

SELECT
    ROW_NUMBER() OVER(ORDER BY LastNameID) AS RN,
    LastName
INTO #LastNames
FROM Utility.LastNames;

SELECT
    ROW_NUMBER() OVER(ORDER BY DomainID) AS RN,
    DomainName
INTO #EmailDomains
FROM Utility.EmailDomains;
GO

DECLARE @FirstNameCount INT =
(
    SELECT COUNT(*) FROM #FirstNames
);

DECLARE @LastNameCount INT =
(
    SELECT COUNT(*) FROM #LastNames
);

DECLARE @EmailDomainCount INT =
(
    SELECT COUNT(*) FROM #EmailDomains
);

DECLARE @CityCount INT =
(
    SELECT COUNT(*) FROM Master.Cities
);

/*==============================================================
Generate Customers
==============================================================*/

;WITH CustomerData AS
(
    SELECT TOP (10000)

        N.Number,

        FN.FirstName,

        LN.LastName,

        ED.DomainName,

        CityID =
            ((N.Number - 1) % @CityCount) + 1,

        Gender =
            CASE
                WHEN N.Number % 2 = 0 THEN 'M'
                ELSE 'F'
            END

    FROM Utility.Numbers N

    INNER JOIN #FirstNames FN
        ON FN.RN = ((N.Number - 1) % @FirstNameCount) + 1

    INNER JOIN #LastNames LN
        ON LN.RN = (((N.Number * 7) - 1) % @LastNameCount) + 1

    INNER JOIN #EmailDomains ED
        ON ED.RN = (((N.Number * 3) - 1) % @EmailDomainCount) + 1

    ORDER BY N.Number
)

INSERT INTO Master.Customers
(
      FirstName
    , LastName
    , Gender
    , DateOfBirth
    , Email
    , PhoneNumber
    , CityID
    , AddressLine
    , PostalCode
    , CustomerType
    , RegistrationDate
    , CreatedDate
    , ModifiedDate
    , IsActive
)

SELECT

      FirstName

    , LastName

    , Gender

    , DATEADD
      (
            DAY,
            -((18 * 365) + (ABS(CHECKSUM(NEWID())) % (52 * 365))),
            CAST(GETDATE() AS DATE)
      )

    , LOWER
      (
            FirstName
            + '.'
            + LastName
            + CAST(Number AS VARCHAR(10))
            + '@'
            + DomainName
      )

    , CONCAT
      (
            '9',
            RIGHT('000000000' +
            CAST(Number AS VARCHAR(9)),9)
      )

    , CityID

    , CONCAT
      (
            'House ',
            Number,
            ', Street ',
            ((Number % 150) + 1)
      )

    , RIGHT
      (
            '000000' +
            CAST(500000 + (Number % 99999) AS VARCHAR(6)),
            6
      )

    , CASE
            WHEN Number % 20 = 0
                THEN 'Premium'
            ELSE 'Regular'
      END

    , DATEADD
      (
            DAY,
            -(Number % 1825),
            CAST(GETDATE() AS DATE)
      )

    , GETDATE()

    , NULL

    , CASE
            WHEN Number % 100 < 95
                THEN 1
            ELSE 0
      END

FROM CustomerData;
GO

/*==============================================================
Verification
==============================================================*/

PRINT 'Customers Generated Successfully';
PRINT '--------------------------------';

SELECT COUNT(*) AS TotalCustomers
FROM Master.Customers;

SELECT Gender,
       COUNT(*) AS TotalCustomers
FROM Master.Customers
GROUP BY Gender;

SELECT CustomerType,
       COUNT(*) AS TotalCustomers
FROM Master.Customers
GROUP BY CustomerType;

SELECT IsActive,
       COUNT(*) AS TotalCustomers
FROM Master.Customers
GROUP BY IsActive;

SELECT TOP (20)
       CustomerID,
       FirstName,
       LastName,
       Gender,
       Email,
       PhoneNumber,
       AddressLine,
       PostalCode,
       CustomerType
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

DROP TABLE #FirstNames;
DROP TABLE #LastNames;
DROP TABLE #EmailDomains;
GO