USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : Utility
Script Name    : 02_Create_Lookup_Tables.sql
Description    : Creates lookup tables used for sample data generation.
Author         : Koteswararao Ponnada
==============================================================*/

--------------------------------------------------------------
-- First Names
--------------------------------------------------------------

IF OBJECT_ID('Utility.FirstNames','U') IS NOT NULL
    DROP TABLE Utility.FirstNames;
GO

CREATE TABLE Utility.FirstNames
(
    FirstNameID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL
);
GO

--------------------------------------------------------------
-- Last Names
--------------------------------------------------------------

IF OBJECT_ID('Utility.LastNames','U') IS NOT NULL
    DROP TABLE Utility.LastNames;
GO

CREATE TABLE Utility.LastNames
(
    LastNameID INT IDENTITY(1,1) PRIMARY KEY,
    LastName NVARCHAR(100) NOT NULL
);
GO

--------------------------------------------------------------
-- Email Domains
--------------------------------------------------------------

IF OBJECT_ID('Utility.EmailDomains','U') IS NOT NULL
    DROP TABLE Utility.EmailDomains;
GO

CREATE TABLE Utility.EmailDomains
(
    DomainID INT IDENTITY(1,1) PRIMARY KEY,
    DomainName NVARCHAR(100) NOT NULL
);
GO

--------------------------------------------------------------
-- Job Titles
--------------------------------------------------------------

IF OBJECT_ID('Utility.JobTitles','U') IS NOT NULL
    DROP TABLE Utility.JobTitles;
GO

CREATE TABLE Utility.JobTitles
(
    JobTitleID INT IDENTITY(1,1) PRIMARY KEY,
    JobTitle NVARCHAR(100) NOT NULL
);
GO

--------------------------------------------------------------
-- Courier Companies
--------------------------------------------------------------

IF OBJECT_ID('Utility.CourierNames','U') IS NOT NULL
    DROP TABLE Utility.CourierNames;
GO

CREATE TABLE Utility.CourierNames
(
    CourierID INT IDENTITY(1,1) PRIMARY KEY,
    CourierName NVARCHAR(100) NOT NULL
);
GO

--------------------------------------------------------------
-- Supplier Companies
--------------------------------------------------------------

IF OBJECT_ID('Utility.SupplierNames','U') IS NOT NULL
    DROP TABLE Utility.SupplierNames;
GO

CREATE TABLE Utility.SupplierNames
(
    SupplierCompanyID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName NVARCHAR(150) NOT NULL
);
GO

--------------------------------------------------------------
-- Product Models
--------------------------------------------------------------

IF OBJECT_ID('Utility.ProductModels','U') IS NOT NULL
    DROP TABLE Utility.ProductModels;
GO

CREATE TABLE Utility.ProductModels
(
    ProductModelID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(100) NOT NULL,
    CategoryName NVARCHAR(100) NOT NULL,
    ProductModel NVARCHAR(150) NOT NULL
);
GO

--------------------------------------------------------------
-- Product Colors
--------------------------------------------------------------

IF OBJECT_ID('Utility.ProductColors','U') IS NOT NULL
    DROP TABLE Utility.ProductColors;
GO

CREATE TABLE Utility.ProductColors
(
    ColorID INT IDENTITY(1,1) PRIMARY KEY,
    ColorName NVARCHAR(50) NOT NULL
);
GO

--------------------------------------------------------------
-- RAM Sizes
--------------------------------------------------------------

IF OBJECT_ID('Utility.RAMSizes','U') IS NOT NULL
    DROP TABLE Utility.RAMSizes;
GO

CREATE TABLE Utility.RAMSizes
(
    RAMID INT IDENTITY(1,1) PRIMARY KEY,
    RAMSize NVARCHAR(30) NOT NULL
);
GO

--------------------------------------------------------------
-- Storage Sizes
--------------------------------------------------------------

IF OBJECT_ID('Utility.StorageSizes','U') IS NOT NULL
    DROP TABLE Utility.StorageSizes;
GO

CREATE TABLE Utility.StorageSizes
(
    StorageID INT IDENTITY(1,1) PRIMARY KEY,
    StorageSize NVARCHAR(30) NOT NULL
);
GO

