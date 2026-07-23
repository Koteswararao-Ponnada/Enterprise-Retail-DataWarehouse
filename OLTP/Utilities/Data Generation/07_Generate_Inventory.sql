USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 07_Generate_Inventory.sql
Description    : Generate Inventory Data
==============================================================*/

-- Rerunnable
DELETE FROM Inventory.Inventory;
GO

INSERT INTO Inventory.Inventory
(
    ProductID,
    StoreID,
    QuantityOnHand,
    ReorderLevel,
    LastStockUpdate,
    CreatedDate,
    ModifiedDate,
    IsActive
)
SELECT
    P.ProductID,

    S.StoreID,

    ABS(CHECKSUM(NEWID())) % 500 + 10 AS QuantityOnHand,

    ABS(CHECKSUM(NEWID())) % 40 + 10 AS ReorderLevel,

    DATEADD(DAY,-ABS(CHECKSUM(NEWID())) % 30,GETDATE()),

    GETDATE(),

    NULL,

    1

FROM Master.Products P
CROSS JOIN Master.Stores S;
GO

/*==============================================================
Validation
==============================================================*/

SELECT COUNT(*) AS TotalInventoryRows
FROM Inventory.Inventory;
GO

SELECT TOP (20)
InventoryID,
ProductID,
StoreID,
QuantityOnHand,
ReorderLevel,
LastStockUpdate
FROM Inventory.Inventory
ORDER BY InventoryID;
GO