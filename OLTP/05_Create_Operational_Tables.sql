/*
==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : OLTP Database
Script Name    : 05_Create_Operational_Tables.sql
Table          : Inventory
Schema         : Inventory
Description    : Stores current stock available for each product
==============================================================
*/

CREATE TABLE Inventory.Inventory
(
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,

    ProductID INT NOT NULL,

    StoreID INT NOT NULL,

    QuantityOnHand INT NOT NULL,

    ReorderLevel INT NOT NULL,

    LastStockUpdate DATETIME2 NOT NULL DEFAULT GETDATE(),

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : StockMovements
Schema: Inventory
==============================================================
*/

CREATE TABLE Inventory.StockMovements
(
    StockMovementID INT IDENTITY(1,1) PRIMARY KEY,

    ProductID INT NOT NULL,

    StoreID INT NOT NULL,

    MovementType NVARCHAR(30) NOT NULL,

    Quantity INT NOT NULL,

    MovementDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ReferenceNumber NVARCHAR(100) NULL,

    Remarks NVARCHAR(300) NULL
);
GO

/*
==============================================================
Table : PriceHistory
Schema: Inventory
==============================================================
*/

CREATE TABLE Inventory.PriceHistory
(
    PriceHistoryID INT IDENTITY(1,1) PRIMARY KEY,

    ProductID INT NOT NULL,

    OldPrice DECIMAL(18,2) NOT NULL,

    NewPrice DECIMAL(18,2) NOT NULL,

    EffectiveDate DATETIME2 NOT NULL,

    ChangedByEmployeeID INT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE()
);
GO