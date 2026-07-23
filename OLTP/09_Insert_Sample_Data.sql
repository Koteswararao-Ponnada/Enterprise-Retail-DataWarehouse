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

