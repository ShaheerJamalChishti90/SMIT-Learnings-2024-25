-- Step 1: Create a new schema (optional but recommended for organization)
CREATE SCHEMA company;
GO

-- Step 2: Create an Employee table in the 'company' schema
CREATE TABLE company.Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerID INT
);
GO

-- Step 3: Insert sample data into the Employee table
INSERT INTO company.Employee (EmpID, EmpName, ManagerID)
VALUES 
    (1, 'Alice', NULL),       -- CEO (no manager)
    (2, 'Bob', 1),            -- Bob reports to Alice
    (3, 'Charlie', 1),        -- Charlie reports to Alice
    (4, 'David', 2),          -- David reports to Bob
    (5, 'Eva', 2),            -- Eva reports to Bob
    (6, 'Frank', 3);          -- Frank reports to Charlie
GO


SELECT * FROM company.Employee;


select e.EmpID as Emp_ID, e.EmpName as Emp_Name, e.ManagerID as Mngr_ID
from company.Employee e
left join 
    company.Employee ce
    on e.ManagerID = ce.EmpID;
