USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.StorageSizes;
GO

INSERT INTO Utility.StorageSizes (StorageSize)
VALUES
('64GB'),
('128GB'),
('256GB'),
('512GB'),
('1TB'),
('2TB'),
('4TB');
GO

-- Verification
SELECT COUNT(*) AS TotalStorageSizes
FROM Utility.StorageSizes;

SELECT *
FROM Utility.StorageSizes
ORDER BY StorageID;
GO