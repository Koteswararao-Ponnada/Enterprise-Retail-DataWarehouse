USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 12_Generate_Returns.sql
Description    : Generate Returns
==============================================================*/

SET NOCOUNT ON;
GO

--------------------------------------------------------------
-- Delete Existing Data
--------------------------------------------------------------

DELETE FROM Sales.Returns;
GO

INSERT INTO Sales.Returns
(
    OrderID,
    ReturnDate,
    ReturnReasonID,
    RefundAmount,
    ReturnStatusID
)
SELECT TOP (2500)

    O.OrderID,

    DATEADD
    (
        DAY,
        ABS(CHECKSUM(NEWID())) % 30,
        O.OrderDate
    ),

    ABS(CHECKSUM(NEWID())) % 5 + 1,

    O.TotalAmount,

    CASE
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 80 THEN 4
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 95 THEN 2
        ELSE 3
    END

FROM Sales.Orders O
WHERE O.OrderStatusID = 5
ORDER BY NEWID();
GO

--------------------------------------------------------------
-- Validation
--------------------------------------------------------------

SELECT COUNT(*) AS TotalReturns
FROM Sales.Returns;

SELECT TOP 20 *
FROM Sales.Returns;
GO