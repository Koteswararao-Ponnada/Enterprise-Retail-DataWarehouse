USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 08_Generate_Orders.sql
Description    : Generate 100000 Orders
==============================================================*/

DELETE FROM Sales.OrderDetails;
DELETE FROM Sales.Payments;
DELETE FROM Sales.Shipments;
DELETE FROM Sales.Returns;
DELETE FROM Sales.Orders;

GO

;WITH OrderData AS
(
    SELECT TOP (100000)

        ROW_NUMBER() OVER(ORDER BY NEWID()) AS RowNum,

        (
            SELECT TOP 1 CustomerID
            FROM Master.Customers
            ORDER BY NEWID()
        ) AS CustomerID,

        (
            SELECT TOP 1 EmployeeID
            FROM Master.Employees
            ORDER BY NEWID()
        ) AS EmployeeID,

        (
            SELECT TOP 1 StoreID
            FROM Master.Stores
            ORDER BY NEWID()
        ) AS StoreID,

        DATEADD
        (
            DAY,
            -ABS(CHECKSUM(NEWID())) % 730,
            GETDATE()
        ) AS OrderDate,

        CASE
            WHEN ABS(CHECKSUM(NEWID())) % 100 < 5 THEN 6      -- Cancelled
            WHEN ABS(CHECKSUM(NEWID())) % 100 < 10 THEN 7     -- Returned
            WHEN ABS(CHECKSUM(NEWID())) % 100 < 60 THEN 5     -- Delivered
            WHEN ABS(CHECKSUM(NEWID())) % 100 < 75 THEN 4     -- Shipped
            WHEN ABS(CHECKSUM(NEWID())) % 100 < 90 THEN 3     -- Packed
            ELSE 2                                            -- Processing
        END AS OrderStatusID,

        CAST
        (
            (RAND(CHECKSUM(NEWID())) * 180000) + 1000
            AS DECIMAL(18,2)
        ) AS TotalAmount

    FROM Utility.Numbers
)

INSERT INTO Sales.Orders
(
    OrderNumber,
    CustomerID,
    EmployeeID,
    StoreID,
    OrderDate,
    OrderStatusID,
    TotalAmount,
    CreatedDate,
    IsActive
)
SELECT
    CONCAT('ORD-',RIGHT('0000000'+CAST(RowNum AS VARCHAR(7)),7)),
    CustomerID,
    EmployeeID,
    StoreID,
    OrderDate,
    OrderStatusID,
    TotalAmount,
    GETDATE(),
    1
FROM OrderData;
GO

------------------------------------------------------------
-- Validation
------------------------------------------------------------

SELECT COUNT(*) AS TotalOrders
FROM Sales.Orders;
GO

SELECT TOP 20 *
FROM Sales.Orders
ORDER BY OrderID DESC;
GO