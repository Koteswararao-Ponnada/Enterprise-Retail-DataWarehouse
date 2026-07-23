/*==============================================================
Product Catalog
==============================================================*/

WITH ProductCatalog AS
(
    SELECT 'Apple' AS BrandName, 'Laptops' AS CategoryName, 'MacBook Air M4' AS ProductModel
    UNION ALL SELECT 'Apple','Laptops','MacBook Pro M4'
    UNION ALL SELECT 'Apple','Mobiles','iPhone 17'
    UNION ALL SELECT 'Apple','Tablets','iPad Air'

    UNION ALL SELECT 'Samsung','Mobiles','Galaxy S25'
    UNION ALL SELECT 'Samsung','Mobiles','Galaxy A56'
    UNION ALL SELECT 'Samsung','Tablets','Galaxy Tab S10'

    UNION ALL SELECT 'Dell','Laptops','Inspiron 15'
    UNION ALL SELECT 'Dell','Laptops','XPS 15'

    UNION ALL SELECT 'HP','Laptops','Pavilion 14'
    UNION ALL SELECT 'HP','Laptops','Victus 16'

    UNION ALL SELECT 'Lenovo','Laptops','ThinkPad E16'
    UNION ALL SELECT 'Lenovo','Laptops','IdeaPad Slim 5'
    UNION ALL SELECT 'Lenovo','Gaming','Legion 5'

    UNION ALL SELECT 'Asus','Laptops','ZenBook 14'
    UNION ALL SELECT 'Asus','Gaming','ROG Strix G16'
    UNION ALL SELECT 'Asus','Gaming','TUF A15'

    UNION ALL SELECT 'Sony','Televisions','Bravia XR'
    UNION ALL SELECT 'Sony','Gaming','PlayStation 5'

    UNION ALL SELECT 'LG','Televisions','OLED C5'
    UNION ALL SELECT 'LG','Accessories','UltraGear Monitor'

    UNION ALL SELECT 'Acer','Laptops','Aspire 7'
    UNION ALL SELECT 'Acer','Gaming','Predator Helios'

    UNION ALL SELECT 'Microsoft','Laptops','Surface Laptop 7'
    UNION ALL SELECT 'Microsoft','Tablets','Surface Pro 11'
)
SELECT *
FROM ProductCatalog;
GO

/*==============================================================
Product Variants
==============================================================*/

WITH Colors AS
(
    SELECT 'Black' AS Color
    UNION ALL SELECT 'Silver'
    UNION ALL SELECT 'White'
    UNION ALL SELECT 'Blue'
    UNION ALL SELECT 'Green'
    UNION ALL SELECT 'Gray'
    UNION ALL SELECT 'Midnight'
    UNION ALL SELECT 'Space Gray'
),

RAM AS
(
    SELECT '8 GB' AS RAM
    UNION ALL SELECT '16 GB'
    UNION ALL SELECT '32 GB'
    UNION ALL SELECT '64 GB'
),

Storage AS
(
    SELECT '128 GB' AS Storage
    UNION ALL SELECT '256 GB'
    UNION ALL SELECT '512 GB'
    UNION ALL SELECT '1 TB'
    UNION ALL SELECT '2 TB'
)

SELECT
    C.Color,
    R.RAM,
    S.Storage
FROM Colors C
CROSS JOIN RAM R
CROSS JOIN Storage S
ORDER BY
    C.Color,
    R.RAM,
    S.Storage;
GO

/*==============================================================
Step 3 : Generate Product Dataset (Preview Only)
==============================================================*/

WITH ProductCatalog AS
(
    SELECT 'Apple' AS BrandName, 'Laptops' AS CategoryName, 'MacBook Air M4' AS ProductModel
    UNION ALL SELECT 'Apple','Laptops','MacBook Pro M4'
    UNION ALL SELECT 'Apple','Mobiles','iPhone 17'
    UNION ALL SELECT 'Apple','Tablets','iPad Air'

    UNION ALL SELECT 'Samsung','Mobiles','Galaxy S25'
    UNION ALL SELECT 'Samsung','Mobiles','Galaxy A56'
    UNION ALL SELECT 'Samsung','Tablets','Galaxy Tab S10'

    UNION ALL SELECT 'Dell','Laptops','Inspiron 15'
    UNION ALL SELECT 'Dell','Laptops','XPS 15'

    UNION ALL SELECT 'HP','Laptops','Pavilion 14'
    UNION ALL SELECT 'HP','Laptops','Victus 16'

    UNION ALL SELECT 'Lenovo','Laptops','ThinkPad E16'
    UNION ALL SELECT 'Lenovo','Laptops','IdeaPad Slim 5'
    UNION ALL SELECT 'Lenovo','Gaming','Legion 5'

    UNION ALL SELECT 'Asus','Laptops','ZenBook 14'
    UNION ALL SELECT 'Asus','Gaming','ROG Strix G16'
    UNION ALL SELECT 'Asus','Gaming','TUF A15'

    UNION ALL SELECT 'Sony','Televisions','Bravia XR'
    UNION ALL SELECT 'Sony','Gaming','PlayStation 5'

    UNION ALL SELECT 'LG','Televisions','OLED C5'
    UNION ALL SELECT 'LG','Accessories','UltraGear Monitor'

    UNION ALL SELECT 'Acer','Laptops','Aspire 7'
    UNION ALL SELECT 'Acer','Gaming','Predator Helios'

    UNION ALL SELECT 'Microsoft','Laptops','Surface Laptop 7'
    UNION ALL SELECT 'Microsoft','Tablets','Surface Pro 11'
),

Colors AS
(
    SELECT 'Black' Color
    UNION ALL SELECT 'Silver'
    UNION ALL SELECT 'White'
    UNION ALL SELECT 'Blue'
    UNION ALL SELECT 'Green'
    UNION ALL SELECT 'Gray'
    UNION ALL SELECT 'Midnight'
    UNION ALL SELECT 'Space Gray'
),

RAM AS
(
    SELECT '8 GB' RAM
    UNION ALL SELECT '16 GB'
    UNION ALL SELECT '32 GB'
    UNION ALL SELECT '64 GB'
),

Storage AS
(
    SELECT '128 GB' Storage
    UNION ALL SELECT '256 GB'
    UNION ALL SELECT '512 GB'
    UNION ALL SELECT '1 TB'
    UNION ALL SELECT '2 TB'
)

SELECT TOP (100)

      B.BrandID
    , C.CategoryID
    , S.SupplierID

    , PC.ProductModel + ' '
        + CL.Color + ' '
        + R.RAM + ' '
        + ST.Storage AS ProductName

    , CONCAT
      (
        PC.BrandName,
        ' ',
        PC.ProductModel,
        ' ',
        CL.Color,
        ', ',
        R.RAM,
        ', ',
        ST.Storage
      ) AS ProductDescription

    , CONCAT
      (
        LEFT(PC.BrandName,3),
        '-',
        RIGHT('000000'+CAST(ROW_NUMBER() OVER(ORDER BY NEWID()) AS VARCHAR(6)),6)
      ) AS SKU

    , CONCAT
      (
        '89',
        RIGHT('000000000000'+CAST(ABS(CHECKSUM(NEWID())) AS VARCHAR(12)),12)
      ) AS Barcode

    , CAST(ROUND((RAND(CHECKSUM(NEWID()))*150000)+5000,2) AS DECIMAL(18,2)) AS UnitPrice

    , CAST(ROUND((RAND(CHECKSUM(NEWID()))*120000)+3000,2) AS DECIMAL(18,2)) AS CostPrice

    , CAST(ROUND((RAND(CHECKSUM(NEWID()))*4)+0.30,2) AS DECIMAL(10,2)) AS Weight

    , CL.Color
    , R.RAM
    , ST.Storage

FROM ProductCatalog PC

CROSS JOIN Colors CL
CROSS JOIN RAM R
CROSS JOIN Storage ST

JOIN Master.Brands B
ON B.BrandName = PC.BrandName

JOIN Master.Categories C
ON C.CategoryName = PC.CategoryName

CROSS APPLY
(
    SELECT TOP 1 SupplierID
    FROM Master.Suppliers
    ORDER BY NEWID()
) S

ORDER BY NEWID();
GO

/*==============================================================
Generate 5000 Products
==============================================================*/

DELETE FROM Master.Products;
GO

;WITH ProductCatalog AS
(
    SELECT 'Apple' AS BrandName,'Laptops' AS CategoryName,'MacBook Air M4' AS ProductModel
    UNION ALL SELECT 'Apple','Laptops','MacBook Pro M4'
    UNION ALL SELECT 'Apple','Mobiles','iPhone 17'
    UNION ALL SELECT 'Apple','Tablets','iPad Air'

    UNION ALL SELECT 'Samsung','Mobiles','Galaxy S25'
    UNION ALL SELECT 'Samsung','Mobiles','Galaxy A56'
    UNION ALL SELECT 'Samsung','Tablets','Galaxy Tab S10'

    UNION ALL SELECT 'Dell','Laptops','Inspiron 15'
    UNION ALL SELECT 'Dell','Laptops','XPS 15'

    UNION ALL SELECT 'HP','Laptops','Pavilion 14'
    UNION ALL SELECT 'HP','Laptops','Victus 16'

    UNION ALL SELECT 'Lenovo','Laptops','ThinkPad E16'
    UNION ALL SELECT 'Lenovo','Laptops','IdeaPad Slim 5'
    UNION ALL SELECT 'Lenovo','Gaming','Legion 5'

    UNION ALL SELECT 'Asus','Laptops','ZenBook 14'
    UNION ALL SELECT 'Asus','Gaming','ROG Strix G16'
    UNION ALL SELECT 'Asus','Gaming','TUF A15'

    UNION ALL SELECT 'Sony','Televisions','Bravia XR'
    UNION ALL SELECT 'Sony','Gaming','PlayStation 5'

    UNION ALL SELECT 'LG','Televisions','OLED C5'
    UNION ALL SELECT 'LG','Accessories','UltraGear Monitor'

    UNION ALL SELECT 'Acer','Laptops','Aspire 7'
    UNION ALL SELECT 'Acer','Gaming','Predator Helios'

    UNION ALL SELECT 'Microsoft','Laptops','Surface Laptop 7'
    UNION ALL SELECT 'Microsoft','Tablets','Surface Pro 11'
),

Colors AS
(
    SELECT 'Black' Color
    UNION ALL SELECT 'Silver'
    UNION ALL SELECT 'White'
    UNION ALL SELECT 'Blue'
    UNION ALL SELECT 'Green'
    UNION ALL SELECT 'Gray'
    UNION ALL SELECT 'Midnight'
    UNION ALL SELECT 'Space Gray'
),

RAM AS
(
    SELECT '8 GB' RAM
    UNION ALL SELECT '16 GB'
    UNION ALL SELECT '32 GB'
    UNION ALL SELECT '64 GB'
),

Storage AS
(
    SELECT '128 GB' Storage
    UNION ALL SELECT '256 GB'
    UNION ALL SELECT '512 GB'
    UNION ALL SELECT '1 TB'
    UNION ALL SELECT '2 TB'
),

ProductData AS
(
    SELECT
        ROW_NUMBER() OVER(ORDER BY NEWID()) AS RowNum,

        B.BrandID,
        C.CategoryID,

        (
            SELECT TOP 1 SupplierID
            FROM Master.Suppliers
            ORDER BY NEWID()
        ) SupplierID,

        PC.BrandName,
        PC.ProductModel,

        CL.Color,
        R.RAM,
        ST.Storage

    FROM ProductCatalog PC

    CROSS JOIN Colors CL
    CROSS JOIN RAM R
    CROSS JOIN Storage ST

    JOIN Master.Brands B
        ON B.BrandName=PC.BrandName

    JOIN Master.Categories C
        ON C.CategoryName=PC.CategoryName
)

INSERT INTO Master.Products
(
    CategoryID,
    BrandID,
    SupplierID,
    ProductName,
    ProductDescription,
    UnitPrice,
    CostPrice,
    Barcode,
    Weight,
    CreatedDate,
    IsActive,
    SKU,
    Color,
    RAM,
    Storage
)

SELECT TOP (5000)

    CategoryID,

    BrandID,

    SupplierID,

    ProductModel + ' ' + Color + ' ' + RAM + ' ' + Storage,

    BrandName + ' ' + ProductModel,

    CAST(ROUND((RAND(CHECKSUM(NEWID()))*150000)+5000,2) AS DECIMAL(18,2)),

    CAST(ROUND((RAND(CHECKSUM(NEWID()))*120000)+3000,2) AS DECIMAL(18,2)),

    CONCAT
    (
        '89',
        RIGHT('000000000000'+CAST(RowNum AS VARCHAR(12)),12)
    ),

    CAST(ROUND((RAND(CHECKSUM(NEWID()))*4)+0.50,2) AS DECIMAL(10,2)),

    GETDATE(),

    1,

    CONCAT
    (
        LEFT(BrandName,3),
        '-',
        RIGHT('000000'+CAST(RowNum AS VARCHAR(6)),6)
    ),

    Color,

    RAM,

    Storage

FROM ProductData
ORDER BY NEWID();
GO