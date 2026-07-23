/*
==============================================================
Table : Orders
Schema: Sales
==============================================================
*/

CREATE TABLE Sales.Orders
(
    OrderID INT IDENTITY(1001,1) PRIMARY KEY,

    CustomerID INT NOT NULL,

    EmployeeID INT NOT NULL,

    StoreID INT NOT NULL,

    OrderDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    OrderStatus NVARCHAR(30) NOT NULL,

    TotalAmount DECIMAL(18,2) NOT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : OrderDetails
Schema: Sales
==============================================================
*/

CREATE TABLE Sales.OrderDetails
(
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,

    ProductID INT NOT NULL,

    Quantity INT NOT NULL,

    UnitPrice DECIMAL(18,2) NOT NULL,

    DiscountAmount DECIMAL(18,2) DEFAULT 0,

    LineTotal DECIMAL(18,2) NOT NULL
);
GO

/*
==============================================================
Table : Payments
Schema: Sales
==============================================================
*/

CREATE TABLE Sales.Payments
(
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,

    PaymentDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    PaymentMethod NVARCHAR(50) NOT NULL,

    PaymentStatus NVARCHAR(30) NOT NULL,

    Amount DECIMAL(18,2) NOT NULL,

    TransactionReference NVARCHAR(100) NULL
);
GO

/*
==============================================================
Table : Shipments
Schema: Sales
==============================================================
*/

CREATE TABLE Sales.Shipments
(
    ShipmentID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,

    ShippedDate DATETIME2 NULL,

    DeliveredDate DATETIME2 NULL,

    CourierName NVARCHAR(100),

    TrackingNumber NVARCHAR(100),

    ShipmentStatus NVARCHAR(30)
);
GO

/*
==============================================================
Table : Returns
Schema: Sales
==============================================================
*/

CREATE TABLE Sales.Returns
(
    ReturnID INT IDENTITY(1,1) PRIMARY KEY,

    OrderID INT NOT NULL,

    ReturnDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ReturnReason NVARCHAR(300),

    RefundAmount DECIMAL(18,2),

    ReturnStatus NVARCHAR(30)
);
GO