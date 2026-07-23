/*==============================================================
Part A : Reference Data
==============================================================*/

USE EnterpriseRetailOLTP;
GO

INSERT INTO Reference.OrderStatus
(StatusName, StatusDescription)
VALUES
('Pending','Order has been placed'),
('Processing','Order is being processed'),
('Packed','Order has been packed'),
('Shipped','Order has been shipped'),
('Delivered','Order delivered successfully'),
('Cancelled','Order cancelled'),
('Returned','Customer returned the order');
GO

INSERT INTO Reference.PaymentMethods
(PaymentMethodName)
VALUES
('Cash'),
('Credit Card'),
('Debit Card'),
('UPI'),
('Net Banking'),
('Gift Card');
GO

INSERT INTO Reference.PaymentStatus
(StatusName)
VALUES
('Pending'),
('Success'),
('Failed'),
('Refunded');
GO

INSERT INTO Reference.ShipmentStatus
(StatusName)
VALUES
('Pending'),
('Packed'),
('In Transit'),
('Delivered'),
('Returned');
GO

INSERT INTO Reference.ReturnReasons
(ReasonName)
VALUES
('Damaged Product'),
('Wrong Product'),
('Quality Issue'),
('Late Delivery'),
('Customer Changed Mind');
GO

INSERT INTO Reference.ReturnStatus
(StatusName)
VALUES
('Requested'),
('Approved'),
('Rejected'),
('Refunded');
GO

/*==============================================================
Part A : Reference Data
==============================================================*/
/*==============================================================
Master.Countries
==============================================================*/

INSERT INTO Master.Countries
(
    CountryName,
    CountryCode,
    CurrencyCode
)
VALUES
('India','IND','INR'),
('United States','USA','USD'),
('United Kingdom','GBR','GBP'),
('Canada','CAN','CAD'),
('Australia','AUS','AUD'),
('Germany','DEU','EUR'),
('France','FRA','EUR'),
('Japan','JPN','JPY'),
('Singapore','SGP','SGD'),
('United Arab Emirates','ARE','AED');
GO

/*==============================================================
Master.Regions
==============================================================*/

INSERT INTO Master.Regions
(
    CountryID,
    RegionName
)
VALUES
(1,'Andhra Pradesh'),
(1,'Telangana'),
(1,'Karnataka'),
(1,'Tamil Nadu'),
(1,'Maharashtra'),
(2,'California'),
(2,'Texas'),
(2,'Florida'),
(3,'England'),
(4,'Ontario'),
(5,'New South Wales'),
(6,'Bavaria'),
(7,'Île-de-France'),
(8,'Tokyo'),
(9,'Central Singapore'),
(10,'Dubai');
GO

/*==============================================================
Master.Cities
==============================================================*/

INSERT INTO Master.Cities
(
    RegionID,
    CityName,
    PostalCode
)
VALUES
(1,'Visakhapatnam','530001'),
(1,'Vijayawada','520001'),
(2,'Hyderabad','500001'),
(3,'Bengaluru','560001'),
(4,'Chennai','600001'),
(5,'Mumbai','400001'),
(6,'Los Angeles','90001'),
(6,'San Francisco','94101'),
(7,'Houston','77001'),
(8,'Miami','33101'),
(9,'London','EC1A'),
(10,'Toronto','M5H'),
(11,'Sydney','2000'),
(12,'Munich','80331'),
(13,'Paris','75001'),
(14,'Tokyo','100-0001'),
(15,'Singapore','018989'),
(16,'Dubai','00000');
GO

/*==============================================================
Master.Stores
==============================================================*/

INSERT INTO Master.Stores
(
    CityID,
    StoreName,
    StoreType,
    AddressLine,
    PhoneNumber,
    Email
)
VALUES
(1,'Vizag Central Store','Retail','Dwaraka Nagar','9000000001','vizag@enterprise.com'),
(2,'Vijayawada Store','Retail','MG Road','9000000002','vijayawada@enterprise.com'),
(3,'Hyderabad Mega Store','Retail','Hitech City','9000000003','hyderabad@enterprise.com'),
(4,'Bengaluru Tech Store','Retail','Electronic City','9000000004','bangalore@enterprise.com'),
(5,'Chennai Store','Retail','Anna Salai','9000000005','chennai@enterprise.com'),
(6,'Mumbai Flagship Store','Retail','BKC','9000000006','mumbai@enterprise.com');
GO

/*==============================================================
Master.Categories
==============================================================*/

INSERT INTO Master.Categories
(
    CategoryName,
    Description
)
VALUES
('Laptops','Laptop Computers'),
('Mobiles','Smartphones'),
('Tablets','Tablet Devices'),
('Accessories','Computer Accessories'),
('Televisions','LED and Smart TVs'),
('Home Appliances','Home Electronics'),
('Furniture','Office and Home Furniture'),
('Gaming','Gaming Consoles'),
('Networking','Networking Devices'),
('Storage','Storage Devices');
GO

/*==============================================================
Master.Brands
==============================================================*/

INSERT INTO Master.Brands
(
    BrandName,
    CountryID
)
VALUES
('Apple',2),
('Samsung',10),
('Dell',2),
('HP',2),
('Lenovo',8),
('Asus',8),
('Sony',8),
('LG',10),
('Acer',8),
('Microsoft',2);
GO

