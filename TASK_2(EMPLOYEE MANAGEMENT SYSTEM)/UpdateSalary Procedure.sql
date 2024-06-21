CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSalaryProcedure`( IN empID INT,
    IN newSalary DECIMAL(10, 2),
    IN effectiveDate DATE)
BEGIN
DECLARE existingSalaryCount INT;

    -- Check if the employee has an existing salary
    SELECT COUNT(*) INTO existingSalaryCount
    FROM Salaries
    WHERE EmployeeID = empID;

    -- If there is an existing salary, deactivate it
    IF existingSalaryCount > 0 THEN
        UPDATE Salaries
        SET IsActive = FALSE
        WHERE EmployeeID = empID AND IsActive = TRUE;
    END IF;

    -- Insert the new salary
    INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate, IsActive)
    VALUES (empID, newSalary, effectiveDate, TRUE);
    

END