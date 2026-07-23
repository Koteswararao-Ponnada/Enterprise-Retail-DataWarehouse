USE EnterpriseRetailOLTP;
GO

/*==============================================================
 Project        : Enterprise Retail Data Warehouse
 Module         : Data Generation
 Script Name    : 05_Generate_Suppliers.sql
 Author         : Koteswararao Ponnada
 Description    : Generates 200 realistic suppliers
==============================================================*/

SET NOCOUNT ON;
GO

/*==============================================================
Delete Existing Data
==============================================================*/

DELETE FROM Master.Suppliers;
GO

DBCC CHECKIDENT ('Master.Suppliers', RESEED, 0);
GO

/*==============================================================
Generate Suppliers
==============================================================*/

INSERT INTO Master.Suppliers
(
      SupplierName
    , CityID
    , ContactPerson
    , PhoneNumber
    , Email
    , CreatedDate
    , IsActive
)

SELECT TOP (200)

    CONCAT
    (
        'Supplier ',
        RIGHT('000'+CAST(N.Number AS VARCHAR(3)),3)
    ),

    ((N.Number-1) %
    (SELECT COUNT(*) FROM Master.Cities))+1,

    CONCAT
    (
        FN.FirstName,
        ' ',
        LN.LastName
    ),

    CONCAT
    (
        '93',
        RIGHT('00000000'+CAST(N.Number AS VARCHAR(8)),8)
    ),

    LOWER
    (
        CONCAT
        (
            'supplier',
            N.Number,
            '@supplier.com'
        )
    ),

    DATEADD
    (
        DAY,
        -(ABS(CHECKSUM(NEWID()))%1825),
        GETDATE()
    ),

    1

FROM Utility.Numbers N

JOIN Utility.FirstNames FN
ON FN.FirstNameID=((N.Number*7)%100)+1

JOIN Utility.LastNames LN
ON LN.LastNameID=((N.Number*13)%100)+1

ORDER BY N.Number;
GO