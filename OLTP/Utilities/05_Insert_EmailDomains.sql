USE EnterpriseRetailOLTP;
GO

TRUNCATE TABLE Utility.EmailDomains;
GO

INSERT INTO Utility.EmailDomains (DomainName)
VALUES
('gmail.com'),
('outlook.com'),
('yahoo.com'),
('hotmail.com'),
('icloud.com'),
('enterprise.com'),
('supplier.com');
GO

SELECT *
FROM Utility.EmailDomains;
GO