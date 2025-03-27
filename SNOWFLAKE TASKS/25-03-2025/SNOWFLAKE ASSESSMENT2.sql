CREATE OR REPLACE DATABASE ASSESSMENTS;



CREATE OR REPLACE TABLE Employee (
    EmployeeID INT AUTOINCREMENT PRIMARY KEY,
    FirstName STRING NOT NULL,
    LastName STRING NOT NULL,
    Email STRING UNIQUE NOT NULL,
    PhoneNumber STRING,
    JobTitle STRING,
    Department STRING,
    Salary NUMBER(10,2) NOT NULL,
    HireDate DATE NOT NULL,
    ManagerID INT,
    CONSTRAINT fk_manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);


INSERT INTO Employee (FirstName, LastName, Email, PhoneNumber, JobTitle, Department, Salary, HireDate, ManagerID) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Software Engineer', 'IT', 80000.00, '2023-01-15', NULL),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'Project Manager', 'IT', 95000.00, '2022-05-10', 1),
('Emily', 'Johnson', 'emily.johnson@example.com', '345-678-9012', 'HR Manager', 'Human Resources', 75000.00, '2021-09-20', NULL),
('Michael', 'Brown', 'michael.brown@example.com', '456-789-0123', 'Data Analyst', 'Finance', 72000.00, '2023-02-10', 2),
('Chris', 'Williams', 'chris.williams@example.com', '567-890-1234', 'Marketing Specialist', 'Marketing', 68000.00, '2022-08-01', NULL),
('Robert', 'Taylor', 'robert.taylor@example.com', '678-901-2345', 'DevOps Engineer', 'IT', 85000.00, '2022-11-15', 1),
('Sophia', 'Martinez', 'sophia.martinez@example.com', '789-012-3456', 'Financial Analyst', 'Finance', 78000.00, '2023-03-12', 4),
('David', 'Anderson', 'david.anderson@example.com', '890-123-4567', 'Sales Manager', 'Sales', 82000.00, '2021-06-25', NULL),
('Olivia', 'Thomas', 'olivia.thomas@example.com', '901-234-5678', 'UX Designer', 'Design', 74000.00, '2022-09-30', NULL),
('Daniel', 'White', 'daniel.white@example.com', '012-345-6789', 'Cybersecurity Analyst', 'IT', 87000.00, '2022-07-18', 1),
('Emma', 'Harris', 'emma.harris@example.com', '123-567-8901', 'Recruiter', 'Human Resources', 19000.00, '2021-08-11', 3),
('Matthew', 'Clark', 'matthew.clark@example.com', '234-678-9012', 'SEO Specialist', 'Marketing', 22000.00, '2023-01-05', 5),
('Ava', 'Lewis', 'ava.lewis@example.com', '345-789-0123', 'Customer Support Lead', 'Support', 36000.00, '2020-10-20', NULL),
('James', 'Walker', 'james.walker@example.com', '456-890-1234', 'Network Engineer', 'IT', 48000.00, '2022-04-22', 1),
('Isabella', 'Hall', 'isabella.hall@example.com', '567-901-2345', 'Operations Manager', 'Operations', 50000.00, '2019-05-15', NULL);

SELECT * FROM ASSESSMENTS.PUBLIC.EMPLOYEE;

SELECT * FROM ASSESSMENTS.PUBLIC.EMPLOYEE
WHERE SALARY > 50000
ORDER BY SALARY DESC
LIMIT 5;

