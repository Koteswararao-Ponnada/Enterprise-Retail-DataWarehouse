USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 10_Generate_Payments.sql
Description    : Generate Payments
==============================================================*/

SET NOCOUNT ON;
GO

--------------------------------------------------------------
-- Delete Existing Data
--------------------------------------------------------------

DELETE FROM Sales.Payments;
GO

--------------------------------------------------------------
-- Generate Payments
--------------------------------------------------------------

INSERT INTO Sales.Payments
(
    OrderID,
    PaymentDate,
    PaymentMethodID,
    PaymentStatusID,
    Amount,
    TransactionReference
)
SELECT

    O.OrderID,

    DATEADD
    (
        MINUTE,
        ABS(CHECKSUM(NEWID())) % 120,
        O.OrderDate
    ),

    ((ABS(CHECKSUM(NEWID())) % 6) + 1),

    CASE
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 92 THEN 2      -- Success
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 97 THEN 1      -- Pending
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 99 THEN 4      -- Refunded
        ELSE 3                                             -- Failed
    END,

    O.TotalAmount,

    CONCAT
    (
        'TXN',
        FORMAT(O.OrderID,'000000'),
        RIGHT(CAST(ABS(CHECKSUM(NEWID())) AS VARCHAR(20)),6)
    )

FROM Sales.Orders O;
GO

--------------------------------------------------------------
-- Validation
--------------------------------------------------------------

SELECT COUNT(*) AS TotalPayments
FROM Sales.Payments;

SELECT TOP 20 *
FROM Sales.Payments;
GO