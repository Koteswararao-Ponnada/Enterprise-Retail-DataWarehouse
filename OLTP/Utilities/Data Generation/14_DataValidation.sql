USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Script Name    : 14_DataValidation.sql
Description    : Validate Generated Data
==============================================================*/

PRINT '============= MASTER =============';

SELECT COUNT(*) AS Customers FROM Master.Customers;
SELECT COUNT(*) AS Employees FROM Master.Employees;
SELECT COUNT(*) AS Suppliers FROM Master.Suppliers;
SELECT COUNT(*) AS Products FROM Master.Products;
SELECT COUNT(*) AS Stores FROM Master.Stores;

PRINT '============= SALES =============';

SELECT COUNT(*) AS Orders FROM Sales.Orders;
SELECT COUNT(*) AS OrderDetails FROM Sales.OrderDetails;
SELECT COUNT(*) AS Payments FROM Sales.Payments;
SELECT COUNT(*) AS Shipments FROM Sales.Shipments;
SELECT COUNT(*) AS Returns FROM Sales.Returns;

PRINT '============= INVENTORY =============';

SELECT COUNT(*) AS Inventory FROM Inventory.Inventory;
SELECT COUNT(*) AS PriceHistory FROM Inventory.PriceHistory;

PRINT '============= SAMPLE DATA =============';

SELECT TOP 10 * FROM Master.Customers;
SELECT TOP 10 * FROM Master.Products;
SELECT TOP 10 * FROM Sales.Orders;
SELECT TOP 10 * FROM Sales.OrderDetails;
SELECT TOP 10 * FROM Sales.Payments;
SELECT TOP 10 * FROM Sales.Shipments;
SELECT TOP 10 * FROM Sales.Returns;

PRINT '============= DATA QUALITY =============';

SELECT
    COUNT(DISTINCT CustomerID) AS CustomersWithOrders
FROM Sales.Orders;

SELECT
    COUNT(DISTINCT ProductID) AS ProductsSold
FROM Sales.OrderDetails;

SELECT
    SUM(TotalAmount) AS TotalSales
FROM Sales.Orders;

SELECT
    AVG(TotalAmount) AS AverageOrderValue
FROM Sales.Orders;

SELECT
    MAX(OrderDate) AS LatestOrder,
    MIN(OrderDate) AS EarliestOrder
FROM Sales.Orders;

PRINT '============= VALIDATION COMPLETED =============';
GO