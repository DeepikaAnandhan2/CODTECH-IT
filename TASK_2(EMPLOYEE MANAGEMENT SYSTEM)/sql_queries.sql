-- Insertion into Departments
INSERT INTO Departments (DepartmentName, Location)
VALUES
('Human Resources', 'India'),
('Engineering', 'New York'),
('Marketing', 'India'),
('Finance', 'US'),
('Sales', 'Los Angeles');

-- Insertion into JobPositions
INSERT INTO JobPositions (PositionName, DepartmentID)
VALUES
('HR Manager', 1),      -- Human Resources
('HR Assistant', 1),    -- Human Resources
('Software Engineer', 2), -- Engineering
('Senior Developer', 2), -- Engineering
('Marketing Specialist', 3), -- Marketing
('Marketing Manager', 3), -- Marketing
('Accountant', 4),      -- Finance
('Financial Analyst', 4), -- Finance
('Sales Representative', 5), -- Sales
('Sales Manager', 5);   -- Sales

-- Insertion into Employees
INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, DepartmentID, PositionID)
VALUES
('Ram', 'Kumar', 'ram.kumar@example.com', '999-567-9876', '2020-01-15', 2, 3),  -- Engineering, Software Engineer
('Priya', 'Verma', 'priya.verma@example.com', '867-555-1234', '2019-03-23', 1, 1),      -- Human Resources, HR Manager
('Peter', 'Paul', 'peter.paul@example.com', '789-535-5678', '2021-05-12', 3, 5), -- Marketing, Marketing Specialist
('Anitha', 'Rajan', 'anitha.rajan@example.com','637-997-6789', '2018-07-01', 4, 7), -- Finance, Accountant
('Vedha', 'Shree', 'vedha.shree@example.com', '989-955-4321', '2017-11-30', 5, 9); -- Sales, Sales Representative
-- Insertion into Salaries
INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate)
VALUES
(1, 90000.00, '2024-01-15'),  
(2, 75000.00, '2021-03-23'),   
(3, 65000.00, '2024-05-12'),  
(4, 80000.00, '2023-07-01'),   
(5, 70000.00, '2022-11-30');   

--- by using JOIN statement
SELECT 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    e.Email
FROM 
    Employees e
JOIN 
     JobPositions j ON e.PositionID = j.PositionID 
WHERE 
    j. PositionName ='Accountant';



-- Update the salary for employee with ID 1
CALL UpdateSalaryProcedure(1, 95000.00, '2022-06-01');

-- Get the current salary for employee with ID 1
SELECT GetCurrentSalary(1) AS CurrentSalary;

-- Verify the results
SELECT * FROM Salaries WHERE EmployeeID = 1;
    