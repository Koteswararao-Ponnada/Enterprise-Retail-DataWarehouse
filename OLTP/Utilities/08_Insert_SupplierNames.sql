USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.SupplierNames;
GO

INSERT INTO Utility.SupplierNames (CompanyName)
VALUES
('TechSource Solutions Pvt Ltd'),
('Prime Electronics India'),
('Global Digital Supplies'),
('Vision Technologies'),
('Elite IT Distributors'),
('NextGen Electronics'),
('Smart Device Wholesale'),
('Apex Technology Solutions'),
('Future Retail Supply'),
('Zenith Trading Company'),
('Bright Star Electronics'),
('Universal Tech Distributors'),
('Infinity Gadgets'),
('Pioneer Electronics'),
('BlueChip Technologies'),
('Digital World Supplies'),
('Vertex Solutions'),
('Sigma Electronics'),
('Orbit Technologies'),
('Nova Retail Supply'),
('Reliable IT Products'),
('Mega Electronics Hub'),
('Crystal Tech Systems'),
('National Device Suppliers'),
('Supreme Digital World'),
('Skyline Electronics'),
('Platinum Tech Solutions'),
('Rapid Distribution Services'),
('Eastern Technology'),
('Western Electronics'),
('South India Distributors'),
('North India Technologies'),
('Central Wholesale Traders'),
('Phoenix Electronics'),
('Galaxy Tech Supply'),
('Micro Systems India'),
('Future Vision Technologies'),
('Golden Retail Solutions'),
('Precision Electronics'),
('Reliable Supply Chain');
GO

-- Verification
SELECT COUNT(*) AS TotalSupplierNames
FROM Utility.SupplierNames;

SELECT *
FROM Utility.SupplierNames
ORDER BY SupplierCompanyID;
GO