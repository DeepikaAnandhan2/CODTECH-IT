CREATE DEFINER=`root`@`localhost` PROCEDURE `createOrder_procedure`(
IN p_CustomerID INT,
    OUT p_OrderID INT)
BEGIN
   DECLARE v_TotalAmount DECIMAL(10, 2);
    
    -- Insert into Orders table
    INSERT INTO Orders (CustomerID, TotalAmount)
    VALUES (p_CustomerID, 0);
    
    -- Get the newly inserted OrderID
    SET p_OrderID = LAST_INSERT_ID();
    
    -- Initialize total amount
    SET v_TotalAmount = 0;

    -- You can add additional logic here if needed
    
    -- Return the OrderID
    SELECT p_OrderID AS NewOrderID;
END