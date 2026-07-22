/*
==============================================================
 Project        : Enterprise Retail Data Warehouse
 Module         : OLTP Database
 Script Name    : 02_Create_Schemas.sql
 Author         : Koteswararao Ponnada
 Description    : Creates business schemas
==============================================================
*/

USE EnterpriseRetailOLTP;
GO

------------------------------------------------------------
-- Master Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Master')
    EXEC('CREATE SCHEMA Master');
GO

------------------------------------------------------------
-- Sales Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Sales')
    EXEC('CREATE SCHEMA Sales');
GO

------------------------------------------------------------
-- Inventory Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Inventory')
    EXEC('CREATE SCHEMA Inventory');
GO

------------------------------------------------------------
-- Purchasing Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Purchasing')
    EXEC('CREATE SCHEMA Purchasing');
GO

------------------------------------------------------------
-- Finance Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Finance')
    EXEC('CREATE SCHEMA Finance');
GO

------------------------------------------------------------
-- HR Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'HR')
    EXEC('CREATE SCHEMA HR');
GO

------------------------------------------------------------
-- Audit Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Audit')
    EXEC('CREATE SCHEMA Audit');
GO

------------------------------------------------------------
-- Stage Schema
------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Stage')
    EXEC('CREATE SCHEMA Stage');
GO

PRINT 'All Schemas Created Successfully.';
GO