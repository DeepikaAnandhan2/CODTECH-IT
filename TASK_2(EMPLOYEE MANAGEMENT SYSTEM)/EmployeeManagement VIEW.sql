CREATE VIEW `EmployeeManagementView` AS
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    e.Email, 
    e.Phone, 
    e.HireDate, 
    d.DepartmentName, 
    jp.PositionName, 
    s.SalaryAmount, 
    s.EffectiveDate
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
JOIN 
    JobPositions jp ON e.PositionID = jp.PositionID
JOIN 
    Salaries s ON e.EmployeeID = s.EmployeeID
WHERE 
    s.EffectiveDate = (
        SELECT MAX(s2.EffectiveDate)
        FROM Salaries s2
        WHERE s2.EmployeeID = e.EmployeeID
    );

