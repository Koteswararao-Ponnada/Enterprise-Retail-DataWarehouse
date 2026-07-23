USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.RAMSizes;
GO

INSERT INTO Utility.RAMSizes (RAMSize)
VALUES
('4GB'),
('8GB'),
('12GB'),
('16GB'),
('24GB'),
('32GB'),
('64GB');
GO

-- Verification
SELECT COUNT(*) AS TotalRAMSizes
FROM Utility.RAMSizes;

SELECT *
FROM Utility.RAMSizes
ORDER BY RAMID;
GO