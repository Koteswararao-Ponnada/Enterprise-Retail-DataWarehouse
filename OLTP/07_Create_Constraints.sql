USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : OLTP Database
Script Name    : 07_Create_Constraints.sql
Description    : Creates Foreign Keys, Unique Constraints,
                 Check Constraints and Default Constraints
==============================================================*/

ALTER TABLE Master.Regions
ADD CONSTRAINT FK_Regions_Countries
FOREIGN KEY (CountryID)
REFERENCES Master.Countries(CountryID);
GO

ALTER TABLE Master.Cities
ADD CONSTRAINT FK_Cities_Regions
FOREIGN KEY (RegionID)
REFERENCES Master.Regions(RegionID);
GO

ALTER TABLE Master.Stores
ADD CONSTRAINT FK_Stores_Cities
FOREIGN KEY (CityID)
REFERENCES Master.Cities(CityID);
GO

ALTER TABLE Master.Brands
ADD CONSTRAINT FK_Brands_Countries
FOREIGN KEY (CountryID)
REFERENCES Master.Countries(CountryID);
GO

ALTER TABLE Master.Suppliers
ADD CONSTRAINT FK_Suppliers_Cities
FOREIGN KEY (CityID)
REFERENCES Master.Cities(CityID);
GO

ALTER TABLE Master.Customers
ADD CONSTRAINT FK_Customers_Cities
FOREIGN KEY (CityID)
REFERENCES Master.Cities(CityID);
GO

ALTER TABLE Master.Employees
ADD CONSTRAINT FK_Employees_Stores
FOREIGN KEY (StoreID)
REFERENCES Master.Stores(StoreID);
GO

ALTER TABLE Master.Employees
ADD CONSTRAINT FK_Employees_Manager
FOREIGN KEY (ManagerID)
REFERENCES Master.Employees(EmployeeID);
GO

ALTER TABLE Master.Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Master.Categories(CategoryID);
GO

ALTER TABLE Master.Products
ADD CONSTRAINT FK_Products_Brands
FOREIGN KEY (BrandID)
REFERENCES Master.Brands(BrandID);
GO

ALTER TABLE Master.Products
ADD CONSTRAINT FK_Products_Suppliers
FOREIGN KEY (SupplierID)
REFERENCES Master.Suppliers(SupplierID);
GO

ALTER TABLE Sales.Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Master.Customers(CustomerID);
GO

ALTER TABLE Sales.Orders
ADD CONSTRAINT FK_Orders_Employees
FOREIGN KEY (EmployeeID)
REFERENCES Master.Employees(EmployeeID);
GO

ALTER TABLE Sales.Orders
ADD CONSTRAINT FK_Orders_Stores
FOREIGN KEY (StoreID)
REFERENCES Master.Stores(StoreID);
GO

ALTER TABLE Sales.Orders
ADD CONSTRAINT FK_Orders_OrderStatus
FOREIGN KEY (OrderStatusID)
REFERENCES Reference.OrderStatus(OrderStatusID);
GO

ALTER TABLE Sales.OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID)
REFERENCES Sales.Orders(OrderID);
GO

ALTER TABLE Sales.OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductID)
REFERENCES Master.Products(ProductID);
GO

ALTER TABLE Sales.Payments
ADD CONSTRAINT FK_Payments_Orders
FOREIGN KEY (OrderID)
REFERENCES Sales.Orders(OrderID);
GO

ALTER TABLE Sales.Payments
ADD CONSTRAINT FK_Payments_Method
FOREIGN KEY (PaymentMethodID)
REFERENCES Reference.PaymentMethods(PaymentMethodID);
GO

ALTER TABLE Sales.Payments
ADD CONSTRAINT FK_Payments_Status
FOREIGN KEY (PaymentStatusID)
REFERENCES Reference.PaymentStatus(PaymentStatusID);
GO

ALTER TABLE Sales.Shipments
ADD CONSTRAINT FK_Shipments_Orders
FOREIGN KEY (OrderID)
REFERENCES Sales.Orders(OrderID);
GO

ALTER TABLE Sales.Shipments
ADD CONSTRAINT FK_Shipments_Status
FOREIGN KEY (ShipmentStatusID)
REFERENCES Reference.ShipmentStatus(ShipmentStatusID);
GO

ALTER TABLE Sales.Returns
ADD CONSTRAINT FK_Returns_Orders
FOREIGN KEY (OrderID)
REFERENCES Sales.Orders(OrderID);
GO

ALTER TABLE Sales.Returns
ADD CONSTRAINT FK_Returns_Reason
FOREIGN KEY (ReturnReasonID)
REFERENCES Reference.ReturnReasons(ReturnReasonID);
GO

ALTER TABLE Sales.Returns
ADD CONSTRAINT FK_Returns_Status
FOREIGN KEY (ReturnStatusID)
REFERENCES Reference.ReturnStatus(ReturnStatusID);
GO

ALTER TABLE Inventory.Inventory
ADD CONSTRAINT FK_Inventory_Products
FOREIGN KEY (ProductID)
REFERENCES Master.Products(ProductID);
GO

ALTER TABLE Inventory.Inventory
ADD CONSTRAINT FK_Inventory_Stores
FOREIGN KEY (StoreID)
REFERENCES Master.Stores(StoreID);
GO

ALTER TABLE Inventory.StockMovements
ADD CONSTRAINT FK_StockMovements_Products
FOREIGN KEY (ProductID)
REFERENCES Master.Products(ProductID);
GO

ALTER TABLE Inventory.StockMovements
ADD CONSTRAINT FK_StockMovements_Stores
FOREIGN KEY (StoreID)
REFERENCES Master.Stores(StoreID);
GO

ALTER TABLE Inventory.PriceHistory
ADD CONSTRAINT FK_PriceHistory_Products
FOREIGN KEY (ProductID)
REFERENCES Master.Products(ProductID);
GO

ALTER TABLE Inventory.PriceHistory
ADD CONSTRAINT FK_PriceHistory_Employees
FOREIGN KEY (ChangedByEmployeeID)
REFERENCES Master.Employees(EmployeeID);
GO
--Unique Constraints
ALTER TABLE Master.Customers
ADD CONSTRAINT UQ_Customers_Email UNIQUE (Email);
GO

ALTER TABLE Master.Products
ADD CONSTRAINT UQ_Products_Barcode UNIQUE (Barcode);
GO
--Check Constraints
ALTER TABLE Master.Products
ADD CONSTRAINT CHK_Product_UnitPrice
CHECK (UnitPrice >= 0);
GO

ALTER TABLE Master.Products
ADD CONSTRAINT CHK_Product_CostPrice
CHECK (CostPrice >= 0);
GO

ALTER TABLE Sales.OrderDetails
ADD CONSTRAINT CHK_OrderDetails_Quantity
CHECK (Quantity > 0);
GO

ALTER TABLE Inventory.Inventory
ADD CONSTRAINT CHK_Inventory_Quantity
CHECK (QuantityOnHand >= 0);
GO

ALTER TABLE Master.Customers
ADD CONSTRAINT CHK_Customers_Gender
CHECK (Gender IN ('M','F'));
GO