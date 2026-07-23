USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : OLTP Database
Script Name    : 08_Create_Indexes.sql
Description    : Creates indexes for OLTP performance tuning
==============================================================*/

--------------------------------------------------------------
-- Customers
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Customers_Email
ON Master.Customers(Email);
GO

CREATE NONCLUSTERED INDEX IX_Customers_LastName_FirstName
ON Master.Customers(LastName, FirstName);
GO

CREATE NONCLUSTERED INDEX IX_Customers_City
ON Master.Customers(CityID);
GO

--------------------------------------------------------------
-- Products
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Products_Category
ON Master.Products(CategoryID);
GO

CREATE NONCLUSTERED INDEX IX_Products_Brand
ON Master.Products(BrandID);
GO

CREATE NONCLUSTERED INDEX IX_Products_ProductName
ON Master.Products(ProductName);
GO

CREATE NONCLUSTERED INDEX IX_Products_Supplier
ON Master.Products(SupplierID);
GO

--------------------------------------------------------------
-- Employees
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Employees_Store
ON Master.Employees(StoreID);
GO

CREATE NONCLUSTERED INDEX IX_Employees_Manager
ON Master.Employees(ManagerID);
GO

--------------------------------------------------------------
-- Orders
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Orders_Customer
ON Sales.Orders(CustomerID);
GO

CREATE NONCLUSTERED INDEX IX_Orders_OrderDate
ON Sales.Orders(OrderDate);
GO

CREATE NONCLUSTERED INDEX IX_Orders_Status
ON Sales.Orders(OrderStatusID);
GO

CREATE NONCLUSTERED INDEX IX_Orders_Store
ON Sales.Orders(StoreID);
GO

--Composite index 
CREATE NONCLUSTERED INDEX IX_Orders_Customer_OrderDate
ON Sales.Orders
(
    CustomerID,
    OrderDate
);
GO

--------------------------------------------------------------
-- OrderDetails
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_OrderDetails_Order
ON Sales.OrderDetails(OrderID);
GO

CREATE NONCLUSTERED INDEX IX_OrderDetails_Product
ON Sales.OrderDetails(ProductID);
GO

--------------------------------------------------------------
-- Payments
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Payments_Order
ON Sales.Payments(OrderID);
GO

CREATE NONCLUSTERED INDEX IX_Payments_Method
ON Sales.Payments(PaymentMethodID);
GO

CREATE NONCLUSTERED INDEX IX_Payments_Status
ON Sales.Payments(PaymentStatusID);
GO

--------------------------------------------------------------
-- Shipments
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Shipments_Order
ON Sales.Shipments(OrderID);
GO

--------------------------------------------------------------
-- Returns
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Returns_Order
ON Sales.Returns(OrderID);
GO

--------------------------------------------------------------
-- Inventory
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_Inventory_Product
ON Inventory.Inventory(ProductID);
GO

CREATE NONCLUSTERED INDEX IX_Inventory_Store
ON Inventory.Inventory(StoreID);
GO

--------------------------------------------------------------
-- StockMovements
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_StockMovements_Product
ON Inventory.StockMovements(ProductID);
GO

CREATE NONCLUSTERED INDEX IX_StockMovements_Date
ON Inventory.StockMovements(MovementDate);
GO

--------------------------------------------------------------
-- PriceHistory
--------------------------------------------------------------

CREATE NONCLUSTERED INDEX IX_PriceHistory_Product
ON Inventory.PriceHistory(ProductID);
GO

CREATE NONCLUSTERED INDEX IX_PriceHistory_EffectiveDate
ON Inventory.PriceHistory(EffectiveDate);
GO

--Covering index
CREATE NONCLUSTERED INDEX IX_Orders_Customer_Covering
ON Sales.Orders(CustomerID)
INCLUDE
(
    OrderDate,
    TotalAmount,
    OrderStatusID
);
GO

--Filtered index
CREATE NONCLUSTERED INDEX IX_Customers_Active
ON Master.Customers(CustomerID)
WHERE IsActive = 1;
GO

CREATE NONCLUSTERED INDEX IX_Products_Active
ON Master.Products(ProductID)
WHERE IsActive = 1;
GO

