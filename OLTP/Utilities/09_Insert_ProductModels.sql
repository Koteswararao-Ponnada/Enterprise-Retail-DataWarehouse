USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.ProductModels;
GO

INSERT INTO Utility.ProductModels
(
    BrandName,
    CategoryName,
    ProductModel
)
VALUES

-- Apple
('Apple','Laptops','MacBook Air M4'),
('Apple','Laptops','MacBook Pro 14'),
('Apple','Laptops','MacBook Pro 16'),
('Apple','Mobiles','iPhone 16'),
('Apple','Mobiles','iPhone 16 Pro'),
('Apple','Tablets','iPad Air'),
('Apple','Tablets','iPad Pro'),

-- Samsung
('Samsung','Mobiles','Galaxy S25'),
('Samsung','Mobiles','Galaxy S25 Ultra'),
('Samsung','Tablets','Galaxy Tab S10'),
('Samsung','Televisions','Neo QLED 65'),
('Samsung','Televisions','Crystal UHD 55'),

-- Dell
('Dell','Laptops','Inspiron 15'),
('Dell','Laptops','Latitude 5450'),
('Dell','Laptops','XPS 13'),

-- HP
('HP','Laptops','Pavilion 14'),
('HP','Laptops','Envy x360'),
('HP','Laptops','Victus 15'),

-- Lenovo
('Lenovo','Laptops','ThinkPad E14'),
('Lenovo','Laptops','IdeaPad Slim 5'),
('Lenovo','Laptops','Legion Pro 5'),

-- Asus
('Asus','Laptops','Vivobook 15'),
('Asus','Gaming','ROG Strix G16'),
('Asus','Gaming','TUF Gaming F15'),

-- Acer
('Acer','Laptops','Aspire 7'),
('Acer','Laptops','Swift Go 14'),
('Acer','Gaming','Predator Helios Neo'),

-- Sony
('Sony','Televisions','Bravia XR'),
('Sony','Accessories','WH-1000XM6'),

-- LG
('LG','Televisions','OLED C5'),
('LG','Home Appliances','Smart Refrigerator'),

-- Microsoft
('Microsoft','Laptops','Surface Laptop'),
('Microsoft','Tablets','Surface Pro');
GO

SELECT COUNT(*) AS TotalModels
FROM Utility.ProductModels;

SELECT *
FROM Utility.ProductModels
ORDER BY BrandName, CategoryName;
GO