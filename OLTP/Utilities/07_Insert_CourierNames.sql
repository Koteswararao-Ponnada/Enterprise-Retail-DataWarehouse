USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.CourierNames;
GO

INSERT INTO Utility.CourierNames (CourierName)
VALUES
('Blue Dart'),
('DTDC'),
('Delhivery'),
('Ecom Express'),
('XpressBees'),
('India Post'),
('FedEx'),
('DHL'),
('UPS'),
('Shadowfax'),
('Amazon Transportation Services'),
('Ekart Logistics'),
('Aramex'),
('TNT Express'),
('Professional Couriers'),
('Trackon Couriers'),
('Gati'),
('Safexpress'),
('VRL Logistics'),
('First Flight');
GO

-- Verification
SELECT COUNT(*) AS TotalCourierNames
FROM Utility.CourierNames;

SELECT *
FROM Utility.CourierNames
ORDER BY CourierID;
GO