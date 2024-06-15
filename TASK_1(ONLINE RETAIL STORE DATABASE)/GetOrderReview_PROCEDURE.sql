CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOrderOverview_procedure`(IN p_OrderID INT)
BEGIN
SELECT
        o.OrderID,
        o.OrderDate,
        c.FirstName,
        c.LastName,
        c.Email,
        p.ProductName,
        od.Quantity,
        od.Price,
        py.PaymentDate,
        py.PaymentMethod,
        py.Amount AS PaymentAmount
    FROM
        Orders o
    JOIN
        Customers c ON o.CustomerID = c.CustomerID
    JOIN
        OrderDetails od ON o.OrderID = od.OrderID
    JOIN
        Products p ON od.ProductID = p.ProductID
    JOIN
        Payments py ON o.OrderID = py.OrderID
    WHERE
        o.OrderID = p_OrderID;

END