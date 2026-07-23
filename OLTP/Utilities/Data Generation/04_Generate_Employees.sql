USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : Data Generation
Script Name    : 04_Generate_Employees.sql
Description    : Generate Enterprise Employees
==============================================================*/

SET NOCOUNT ON;
GO

DELETE FROM Master.Employees;
GO

INSERT INTO Master.Employees
(
    StoreID,
    FirstName,
    LastName,
    JobTitle,
    Department,
    HireDate,
    Email,
    PhoneNumber,
    Salary,
    ManagerID,
    CreatedDate,
    IsActive
)
VALUES
(
    1,
    'Rajesh',
    'Sharma',
    'CEO',
    'Management',
    '2010-01-01',
    'rajesh.sharma@enterprise.com',
    '9000000001',
    300000,
    NULL,
    GETDATE(),
    1
);
GO

INSERT INTO Master.Employees
(
    StoreID,
    FirstName,
    LastName,
    JobTitle,
    Department,
    HireDate,
    Email,
    PhoneNumber,
    Salary,
    ManagerID,
    CreatedDate,
    IsActive
)
SELECT
    Number,
    FN.FirstName,
    LN.LastName,
    'Regional Manager',
    'Management',
    DATEADD(DAY,-(Number*250),GETDATE()),
    LOWER(FN.FirstName+'.'+LN.LastName+'@enterprise.com'),
    CONCAT('90000000',RIGHT('00'+CAST(Number+1 AS VARCHAR(2)),2)),
    180000+(Number*2500),
    1,
    GETDATE(),
    1
FROM Utility.Numbers N
JOIN Utility.FirstNames FN
ON FN.FirstNameID=Number
JOIN Utility.LastNames LN
ON LN.LastNameID=Number
WHERE Number<=5;
GO

INSERT INTO Master.Employees
(
    StoreID,
    FirstName,
    LastName,
    JobTitle,
    Department,
    HireDate,
    Email,
    PhoneNumber,
    Salary,
    ManagerID,
    CreatedDate,
    IsActive
)
SELECT
    StoreID,
    FN.FirstName,
    LN.LastName,
    'Store Manager',
    'Management',
    DATEADD(DAY,-(StoreID*180),GETDATE()),
    LOWER(FN.FirstName+'.'+LN.LastName+'@enterprise.com'),
    CONCAT('91000000',RIGHT('00'+CAST(StoreID AS VARCHAR(2)),2)),
    120000,
    ((StoreID-1)%5)+2,
    GETDATE(),
    1
FROM Master.Stores S
JOIN Utility.FirstNames FN
ON FN.FirstNameID=StoreID+10
JOIN Utility.LastNames LN
ON LN.LastNameID=StoreID+10;
GO

/*==============================================================
Generate Assistant Managers
==============================================================*/

;WITH AssistantManagers AS
(
    SELECT
        S.StoreID,
        ROW_NUMBER() OVER(ORDER BY S.StoreID, N.Number) AS RowNum
    FROM Master.Stores S
    CROSS JOIN
    (
        SELECT TOP (2) Number
        FROM Utility.Numbers
        ORDER BY Number
    ) N
)

INSERT INTO Master.Employees
(
    StoreID,
    FirstName,
    LastName,
    JobTitle,
    Department,
    HireDate,
    Email,
    PhoneNumber,
    Salary,
    ManagerID,
    CreatedDate,
    IsActive
)

SELECT

    AM.StoreID,

    FN.FirstName,

    LN.LastName,

    'Assistant Manager',

    'Management',

    DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%2500,GETDATE()),

    LOWER
    (
        FN.FirstName+'.'+
        LN.LastName+
        CAST(AM.RowNum AS VARCHAR(5))
        +'@enterprise.com'
    ),

    CONCAT
    (
        '91',
        RIGHT('00000000'+CAST(AM.RowNum AS VARCHAR(8)),8)
    ),

    80000 + ABS(CHECKSUM(NEWID()))%10000,

    6 + AM.StoreID,

    GETDATE(),

    1

FROM AssistantManagers AM

JOIN Utility.FirstNames FN
ON FN.FirstNameID=((AM.RowNum*3)%100)+1

JOIN Utility.LastNames LN
ON LN.LastNameID=((AM.RowNum*7)%100)+1;
GO

/*==============================================================
Generate Remaining Employees
==============================================================*/

;WITH EmployeePool AS
(
    SELECT TOP (476)

        N.Number,

        StoreID =
            ((N.Number-1)%6)+1,

        JobTitle =
        CASE

            WHEN N.Number<=300 THEN 'Sales Executive'

            WHEN N.Number<=380 THEN 'Cashier'

            WHEN N.Number<=430 THEN 'Inventory Executive'

            WHEN N.Number<=455 THEN 'Customer Support Executive'

            WHEN N.Number<=463 THEN 'HR Executive'

            WHEN N.Number<=470 THEN 'Finance Executive'

            ELSE 'IT Support Engineer'

        END

    FROM Utility.Numbers N
    ORDER BY N.Number
)

INSERT INTO Master.Employees
(
      StoreID
    , FirstName
    , LastName
    , JobTitle
    , Department
    , HireDate
    , Email
    , PhoneNumber
    , Salary
    , ManagerID
    , CreatedDate
    , IsActive
)

SELECT

      EP.StoreID

    , FN.FirstName

    , LN.LastName

    , EP.JobTitle

    , JT.Department

    , DATEADD
      (
            DAY,
            -(ABS(CHECKSUM(NEWID()))%3650),
            GETDATE()
      )

    , LOWER
      (
            FN.FirstName+'.'
            +LN.LastName
            +CAST(EP.Number AS VARCHAR(10))
            +'@enterprise.com'
      )

    , CONCAT
      (
            '92',
            RIGHT('00000000'+CAST(EP.Number AS VARCHAR(8)),8)
      )

    , JT.MinSalary
      +
      (
            ABS(CHECKSUM(NEWID()))
            %
            CAST((JT.MaxSalary-JT.MinSalary+1) AS INT)
      )

    /* ManagerID */

    ,
    CASE

        WHEN EP.JobTitle IN
        (
            'Sales Executive',
            'Cashier',
            'Inventory Executive',
            'Customer Support Executive'
        )

        THEN 12 + ((EP.StoreID-1)*2) + 1

        WHEN EP.JobTitle IN
        (
            'HR Executive',
            'Finance Executive',
            'IT Support Engineer'
        )

        THEN ((EP.StoreID-1)%6)+7

    END

    ,GETDATE()

    ,1

FROM EmployeePool EP

JOIN Utility.JobTitles JT
ON JT.JobTitle=EP.JobTitle

JOIN Utility.FirstNames FN
ON FN.FirstNameID=((EP.Number*5)%100)+1

JOIN Utility.LastNames LN
ON LN.LastNameID=((EP.Number*9)%100)+1;
GO

PRINT 'Employees Generated Successfully';
PRINT '--------------------------------';

SELECT COUNT(*) AS TotalEmployees
FROM Master.Employees;

SELECT JobTitle,
       COUNT(*) AS TotalEmployees
FROM Master.Employees
GROUP BY JobTitle
ORDER BY TotalEmployees DESC;

SELECT Department,
       COUNT(*) AS TotalEmployees
FROM Master.Employees
GROUP BY Department;

SELECT StoreID,
       COUNT(*) AS EmployeesPerStore
FROM Master.Employees
GROUP BY StoreID
ORDER BY StoreID;

SELECT TOP (25)
       EmployeeID,
       FirstName,
       LastName,
       JobTitle,
       Department,
       Salary,
       ManagerID
FROM Master.Employees
ORDER BY EmployeeID;

-- Check duplicate emails
SELECT Email,
       COUNT(*) AS DuplicateCount
FROM Master.Employees
GROUP BY Email
HAVING COUNT(*) > 1;
GO