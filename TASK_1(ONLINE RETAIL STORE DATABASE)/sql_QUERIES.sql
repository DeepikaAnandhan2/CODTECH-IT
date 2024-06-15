-- Inserting products into the Products table
INSERT INTO Products (ProductName, ProductDescription, Price, Stock)
VALUES
('Monitor', '27-inch 4K UHD monitor with HDR support', 989.99, 50),
('Laptop', 'A high performance laptop with 16GB RAM and 512GB SSD', 999.99, 50),
('Smartphone', 'Latest model smartphone with 128GB storage', 699.99, 150),
('Headphones', 'Noise cancelling over-ear headphones', 199.99, 75),
('Smartwatch', 'Fitness tracking smartwatch with heart rate monitor', 149.99, 100),
('Tablet', '10-inch tablet with 64GB storage', 299.99, 200),
('Bluetooth Speaker', 'Portable Bluetooth speaker with 12-hour battery life', 59.99, 120),
('External Hard Drive', '1TB external hard drive with USB 3.0', 89.99, 80),
('Gaming Console', 'Next-gen gaming console with 1TB storage', 499.99, 30),
('Digital Camera', 'High-resolution digital camera with 20MP sensor', 249.99, 60),
('Wireless Mouse', 'Ergonomic wireless mouse with adjustable DPI', 29.99, 300);
-- Inserting example customers into the Customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm Street,  Springfield, IL, 62701'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak Avenue, Springfield, IL, 62702'),
('Alice', 'Johnson', 'alice.johnson@example.com', '5551234567', '789 Pine Road, Springfield, IL, 62703'),
('Bob', 'Brown', 'bob.brown@example.com', '5559876543', '101 Maple Street, Springfield, IL, 62704'),
('Charlie', 'Davis', 'charlie.davis@example.com', '5555555555', '202 Cedar Avenue, Springfield, IL, 62705');

INSERT INTO Orders (CustomerID, TotalAmount)
VALUES (1, 0);
SET @OrderID = LAST_INSERT_ID();

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
('1', 101, 2, 999.99), -- 2 Laptops for John Doe (Price should be retrieved from Products)
('1', 102, 1, 699.99), -- 1 Smartphone for John Doe
('2', 105, 1, 299.99), -- 1 Tablet for Jane Smith
('2', 110, 2, 29.99), -- 2 Wireless Mice for Jane Smith
('3', 111, 1, 349.99), -- 1 4K Monitor for Alice Johnson
('4', 106, 3, 59.99), -- 3 Bluetooth Speakers for Bob Brown
('5', 108, 1, 499.99); -- 1 Gaming Console for Charlie Davis

UPDATE Orders SET TotalAmount = (
    SELECT SUM(Price * Quantity)
    FROM OrderDetails
    WHERE OrderID =1
) WHERE OrderID = 1;

UPDATE Orders SET TotalAmount = (
    SELECT SUM(Price * Quantity)
    FROM OrderDetails
    WHERE OrderID = 2
) WHERE OrderID = 2;

UPDATE Orders SET TotalAmount = (
    SELECT SUM(Price * Quantity)
    FROM OrderDetails
    WHERE OrderID =3
) WHERE OrderID = 3;

UPDATE Orders SET TotalAmount = (
    SELECT SUM(Price * Quantity)
    FROM OrderDetails
    WHERE OrderID = 4
) WHERE OrderID = 4;

UPDATE Orders SET TotalAmount = (
    SELECT SUM(Price * Quantity)
    FROM OrderDetails
    WHERE OrderID = 5
) WHERE OrderID =5;

commit;

-- Start transaction to ensure data integrity
START TRANSACTION;

-- Insert payments for orders
INSERT INTO Payments (OrderID, Amount, PaymentMethod)
VALUES
(1, (SELECT TotalAmount FROM Orders WHERE OrderID = 1), 'Credit Card'),  -- Payment for John Doe's order
(2, (SELECT TotalAmount FROM Orders WHERE OrderID = 2), 'PayPal'),      -- Payment for Jane Smith's order
(3, (SELECT TotalAmount FROM Orders WHERE OrderID = 3), 'Credit Card'), -- Payment for Alice Johnson's order
(4, (SELECT TotalAmount FROM Orders WHERE OrderID = 4), 'Bank Transfer'), -- Payment for Bob Brown's order
(5, (SELECT TotalAmount FROM Orders WHERE OrderID =5), 'Credit Card'); -- Payment for Charlie Davis's order

-- Commit the transaction
COMMIT;

UPDATE Payments
set Amount='1900.00'
where PaymentID='2';



-- Check the structure of the view
DESCRIBE retail_view;


-- Retrieve some data from the view
SELECT * FROM retail_view LIMIT 10;
SELECT * FROM retail_view WHERE OrderID = 1;

-- Create an order for CustomerID 1
CALL createOrder_procedure(1, @NewOrderID);

-- Check the newly created OrderID
SELECT @NewOrderID AS NewOrderID;

-- Add products to the order
CALL AddOrderDetail_procedure(@NewOrderID, 101, 2); -- Add 2 units of ProductID 1
CALL AddOrderDetail_procedure(@NewOrderID, 102, 1); -- Add 1 unit of ProductID 2

-- Get the total amount for the order
SELECT TotalAmount INTO @TotalAmount FROM Orders WHERE OrderID = @NewOrderID;

-- Process the payment
CALL ProcessPayment_procedure(@NewOrderID, @TotalAmount, 'Credit Card');

-- Retrieve the order overview
CALL GetOrderOverview_procedure(@NewOrderID);





