/*
==============================================================
Table : Countries
Schema: Master
==============================================================
*/

CREATE TABLE Master.Countries
(
    CountryID INT IDENTITY(1,1) PRIMARY KEY,

    CountryName NVARCHAR(100) NOT NULL,

    CountryCode CHAR(3) NOT NULL,

    CurrencyCode CHAR(3) NOT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Regions
Schema: Master
==============================================================
*/

CREATE TABLE Master.Regions
(
    RegionID INT IDENTITY(1,1) PRIMARY KEY,

    CountryID INT NOT NULL,

    RegionName NVARCHAR(100) NOT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Cities
Schema: Master
==============================================================
*/

CREATE TABLE Master.Cities
(
    CityID INT IDENTITY(1,1) PRIMARY KEY,

    RegionID INT NOT NULL,

    CityName NVARCHAR(100) NOT NULL,

    PostalCode NVARCHAR(20) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Stores
Schema: Master
==============================================================
*/

CREATE TABLE Master.Stores
(
    StoreID INT IDENTITY(1,1) PRIMARY KEY,

    CityID INT NOT NULL,

    StoreName NVARCHAR(150) NOT NULL,

    StoreType NVARCHAR(50) NOT NULL,

    AddressLine NVARCHAR(250) NULL,

    PhoneNumber NVARCHAR(20) NULL,

    Email NVARCHAR(100) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Categories
Schema: Master
==============================================================
*/

CREATE TABLE Master.Categories
(
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,

    CategoryName NVARCHAR(100) NOT NULL,

    Description NVARCHAR(500) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Brands
Schema: Master
==============================================================
*/

CREATE TABLE Master.Brands
(
    BrandID INT IDENTITY(1,1) PRIMARY KEY,

    BrandName NVARCHAR(100) NOT NULL,

    CountryID INT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Suppliers
Schema: Master
==============================================================
*/

CREATE TABLE Master.Suppliers
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,

    SupplierName NVARCHAR(150) NOT NULL,

    CityID INT NOT NULL,

    ContactPerson NVARCHAR(100) NULL,

    PhoneNumber NVARCHAR(20) NULL,

    Email NVARCHAR(100) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Customers
Schema: Master
==============================================================
*/

CREATE TABLE Master.Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,

    FirstName NVARCHAR(100) NOT NULL,

    LastName NVARCHAR(100) NOT NULL,

    Gender CHAR(1) NULL,

    DateOfBirth DATE NULL,

    Email NVARCHAR(200) NOT NULL,

    PhoneNumber NVARCHAR(20) NULL,

    CityID INT NOT NULL,

    RegistrationDate DATE NOT NULL DEFAULT GETDATE(),

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Employees
Schema: Master
==============================================================
*/

CREATE TABLE Master.Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,

    StoreID INT NOT NULL,

    FirstName NVARCHAR(100) NOT NULL,

    LastName NVARCHAR(100) NOT NULL,

    JobTitle NVARCHAR(100) NOT NULL,

    HireDate DATE NOT NULL,

    Email NVARCHAR(200) NULL,

    PhoneNumber NVARCHAR(20) NULL,

    Salary DECIMAL(18,2) NULL,

    ManagerID INT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Products
Schema: Master
==============================================================
*/

CREATE TABLE Master.Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,

    CategoryID INT NOT NULL,

    BrandID INT NOT NULL,

    SupplierID INT NOT NULL,

    ProductName NVARCHAR(200) NOT NULL,

    ProductDescription NVARCHAR(500) NULL,

    UnitPrice DECIMAL(18,2) NOT NULL,

    CostPrice DECIMAL(18,2) NOT NULL,

    Barcode NVARCHAR(100) NULL,

    Weight DECIMAL(10,2) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*
==============================================================
Table : Promotions
Schema: Master
==============================================================
*/

CREATE TABLE Master.Promotions
(
    PromotionID INT IDENTITY(1,1) PRIMARY KEY,

    PromotionName NVARCHAR(150) NOT NULL,

    DiscountPercentage DECIMAL(5,2) NOT NULL,

    StartDate DATE NOT NULL,

    EndDate DATE NOT NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT GETDATE(),

    ModifiedDate DATETIME2 NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO