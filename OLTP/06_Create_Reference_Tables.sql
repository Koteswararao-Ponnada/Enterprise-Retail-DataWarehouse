USE EnterpriseRetailOLTP;
GO

/*==============================================================
Project        : Enterprise Retail Data Warehouse
Module         : OLTP Database
Script Name    : 06_Create_Reference_Tables.sql
Description    : Creates reference (lookup) tables
==============================================================*/

/*==============================================================
Table : OrderStatus
Schema: Reference
==============================================================*/

CREATE TABLE Reference.OrderStatus
(
    OrderStatusID INT IDENTITY(1,1) PRIMARY KEY,

    StatusName NVARCHAR(50) NOT NULL,

    StatusDescription NVARCHAR(200) NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*==============================================================
Table : PaymentMethods
Schema: Reference
==============================================================*/

CREATE TABLE Reference.PaymentMethods
(
    PaymentMethodID INT IDENTITY(1,1) PRIMARY KEY,

    PaymentMethodName NVARCHAR(50) NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*==============================================================
Table : PaymentStatus
Schema: Reference
==============================================================*/

CREATE TABLE Reference.PaymentStatus
(
    PaymentStatusID INT IDENTITY(1,1) PRIMARY KEY,

    StatusName NVARCHAR(50) NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*==============================================================
Table : ShipmentStatus
Schema: Reference
==============================================================*/

CREATE TABLE Reference.ShipmentStatus
(
    ShipmentStatusID INT IDENTITY(1,1) PRIMARY KEY,

    StatusName NVARCHAR(50) NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*==============================================================
Table : ReturnReasons
Schema: Reference
==============================================================*/

CREATE TABLE Reference.ReturnReasons
(
    ReturnReasonID INT IDENTITY(1,1) PRIMARY KEY,

    ReasonName NVARCHAR(100) NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

/*==============================================================
Table : ReturnStatus
Schema: Reference
==============================================================*/

CREATE TABLE Reference.ReturnStatus
(
    ReturnStatusID INT IDENTITY(1,1) PRIMARY KEY,

    StatusName NVARCHAR(50) NOT NULL,

    IsActive BIT NOT NULL DEFAULT 1
);
GO

