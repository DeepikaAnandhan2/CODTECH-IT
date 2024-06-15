CREATE DEFINER=`root`@`localhost` PROCEDURE `AddOrderDetail_procedure`(IN p_OrderID INT,
    IN p_ProductID INT,
    IN p_Quantity INT)
BEGIN
DECLARE v_Price DECIMAL(10, 2);
    
    -- Get product price
    SELECT Price INTO v_Price FROM Products WHERE ProductID = p_ProductID;
    
    -- Check if Price is NULL
    IF v_Price IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ProductID not found or Price is NULL';
    END IF;
    
    -- Insert order detail
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
    VALUES (p_OrderID, p_ProductID, p_Quantity, v_Price);
    
    -- Update order total amount
    UPDATE Orders
    SET TotalAmount = (SELECT SUM(Quantity * Price) FROM OrderDetails WHERE OrderID = p_OrderID)
    WHERE OrderID = p_OrderID;
END