CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `retail_view` AS
    SELECT 
        `o`.`OrderID` AS `OrderID`,
        `o`.`OrderDate` AS `OrderDate`,
        `c`.`FirstName` AS `FirstName`,
        `c`.`LastName` AS `LastName`,
        `c`.`Email` AS `Email`,
        `p`.`ProductName` AS `ProductName`,
        `od`.`Quantity` AS `Quantity`,
        `od`.`Price` AS `Price`,
        `py`.`PaymentDate` AS `PaymentDate`,
        `py`.`PaymentMethod` AS `PaymentMethod`,
        `py`.`Amount` AS `PaymentAmount`
    FROM
        ((((`orders` `o`
        JOIN `customers` `c` ON ((`o`.`CustomerID` = `c`.`CustomerID`)))
        JOIN `orderdetails` `od` ON ((`o`.`OrderID` = `od`.`OrderID`)))
        JOIN `products` `p` ON ((`od`.`ProductID` = `p`.`ProductID`)))
        JOIN `payments` `py` ON ((`o`.`OrderID` = `py`.`OrderID`)))