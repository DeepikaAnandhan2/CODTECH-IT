CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessPayment_procedure`(
	IN p_OrderID INT,
    IN p_Amount DECIMAL(10, 2),
    IN p_PaymentMethod VARCHAR(50))
BEGIN
    INSERT INTO Payments (OrderID, Amount, PaymentMethod)
    VALUES (p_OrderID, p_Amount, p_PaymentMethod);

END