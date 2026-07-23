USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.ProductColors;
GO

INSERT INTO Utility.ProductColors (ColorName)
VALUES
('Black'),
('White'),
('Silver'),
('Space Gray'),
('Midnight'),
('Blue'),
('Red'),
('Green'),
('Purple'),
('Pink'),
('Gold'),
('Titanium'),
('Natural Titanium'),
('Starlight'),
('Graphite'),
('Platinum'),
('Ocean Blue'),
('Arctic White'),
('Charcoal Black'),
('Rose Gold');
GO

-- Verification
SELECT COUNT(*) AS TotalColors
FROM Utility.ProductColors;

SELECT *
FROM Utility.ProductColors
ORDER BY ColorID;
GO