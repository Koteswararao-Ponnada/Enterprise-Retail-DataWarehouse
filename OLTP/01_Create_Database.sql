/*==============================================================
 Project        : Enterprise Retail Data Warehouse
 Module         : OLTP Database
 Script Name    : 01_Create_Database.sql
 Author         : Koteswararao Ponnada
 Description    : Creates the Enterprise Retail OLTP database
==============================================================*/

USE master;
GO

-- Drop database if it already exists
IF DB_ID('EnterpriseRetailOLTP') IS NOT NULL
BEGIN
    ALTER DATABASE EnterpriseRetailOLTP
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE EnterpriseRetailOLTP;
END;
GO

-- Create Database
CREATE DATABASE EnterpriseRetailOLTP;
GO

-- Use Database
USE EnterpriseRetailOLTP;
GO

PRINT 'EnterpriseRetailOLTP database created successfully.';
GO