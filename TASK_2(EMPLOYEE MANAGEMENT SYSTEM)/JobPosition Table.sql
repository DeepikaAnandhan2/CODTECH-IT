CREATE TABLE JobPositions (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
