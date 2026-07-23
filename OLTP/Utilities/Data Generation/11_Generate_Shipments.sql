USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 11_Generate_Shipments.sql
Description    : Generate Shipments
==============================================================*/

SET NOCOUNT ON;
GO

--------------------------------------------------------------
-- Delete Existing Data
--------------------------------------------------------------

DELETE FROM Sales.Shipments;
GO

--------------------------------------------------------------
-- Generate Shipments
--------------------------------------------------------------

INSERT INTO Sales.Shipments
(
    OrderID,
    ShippedDate,
    DeliveredDate,
    CourierName,
    TrackingNumber,
    ShipmentStatusID
)
SELECT

    O.OrderID,

    DATEADD(DAY,
            ABS(CHECKSUM(NEWID())) % 3 + 1,
            O.OrderDate),

    CASE
        WHEN O.OrderStatusID = 5
        THEN DATEADD
             (
                DAY,
                ABS(CHECKSUM(NEWID())) % 5 + 4,
                O.OrderDate
             )
        ELSE NULL
    END,

    CASE ABS(CHECKSUM(NEWID())) % 6
        WHEN 0 THEN 'Blue Dart'
        WHEN 1 THEN 'DTDC'
        WHEN 2 THEN 'Delhivery'
        WHEN 3 THEN 'Ecom Express'
        WHEN 4 THEN 'India Post'
        ELSE 'XpressBees'
    END,

    CONCAT
    (
        'TRK',
        FORMAT(O.OrderID,'000000'),
        RIGHT(CAST(ABS(CHECKSUM(NEWID())) AS VARCHAR(20)),5)
    ),

    CASE
        WHEN O.OrderStatusID = 1 THEN 1          -- Pending
        WHEN O.OrderStatusID = 2 THEN 2          -- Packed
        WHEN O.OrderStatusID IN (3,4) THEN 3     -- In Transit
        WHEN O.OrderStatusID = 5 THEN 4          -- Delivered
        ELSE 5                                  -- Returned
    END

FROM Sales.Orders O
WHERE O.OrderStatusID <> 6;      -- Cancelled Orders
GO

--------------------------------------------------------------
-- Validation
--------------------------------------------------------------

SELECT COUNT(*) AS TotalShipments
FROM Sales.Shipments;

SELECT TOP 20 *
FROM Sales.Shipments;
GO