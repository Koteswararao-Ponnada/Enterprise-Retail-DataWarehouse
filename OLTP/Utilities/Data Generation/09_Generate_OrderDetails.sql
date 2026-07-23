USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 09_Generate_OrderDetails.sql
Description    : Generate Order Details
==============================================================*/

SET NOCOUNT ON;
GO

--------------------------------------------------------------
-- Delete Existing Data
--------------------------------------------------------------

DELETE FROM Sales.OrderDetails;
GO

--------------------------------------------------------------
-- Generate Order Details
--------------------------------------------------------------

;WITH OrderItems AS
(
    SELECT
        O.OrderID,
        N.Number AS ItemNo
    FROM Sales.Orders O
    CROSS JOIN
    (
        SELECT TOP (3) Number
        FROM Utility.Numbers
        ORDER BY Number
    ) N
)

INSERT INTO Sales.OrderDetails
(
    OrderID,
    ProductID,
    Quantity,
    UnitPrice,
    DiscountAmount,
    LineTotal
)
SELECT

    OI.OrderID,

    P.ProductID,

    Qty,

    P.UnitPrice,

    Discount,

    ((P.UnitPrice * Qty) - Discount)

FROM OrderItems OI

CROSS APPLY
(
    SELECT TOP 1
        ProductID,
        UnitPrice
    FROM Master.Products
    ORDER BY NEWID()
) P

CROSS APPLY
(
    SELECT
        ABS(CHECKSUM(NEWID())) % 5 + 1 AS Qty,
        CAST((ABS(CHECKSUM(NEWID())) % 500) AS DECIMAL(18,2)) AS Discount
) D;
GO

--------------------------------------------------------------
-- Update Order Total
--------------------------------------------------------------

UPDATE O
SET TotalAmount = X.Total
FROM Sales.Orders O
JOIN
(
    SELECT
        OrderID,
        SUM(LineTotal) AS Total
    FROM Sales.OrderDetails
    GROUP BY OrderID
) X
ON O.OrderID = X.OrderID;
GO

--------------------------------------------------------------
-- Validation
--------------------------------------------------------------

SELECT COUNT(*) AS TotalOrderDetails
FROM Sales.OrderDetails;

SELECT TOP 10
OrderDetailID,
OrderID,
ProductID,
Quantity,
UnitPrice,
DiscountAmount,
LineTotal
FROM Sales.OrderDetails;

SELECT TOP 10
OrderID,
TotalAmount
FROM Sales.Orders;
GO