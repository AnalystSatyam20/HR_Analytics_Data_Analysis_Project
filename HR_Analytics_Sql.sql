-- CREATE TABLE EMPLOYEE
CREATE TABLE employee_master (
    Employee_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Role VARCHAR(50),
    Date_of_Joining DATE,
    Salary NUMERIC(12,2),
    Gender VARCHAR(10),
    Age INT,
    Education_Level VARCHAR(50)
);

-- CREATE TABLE ATTRITION
CREATE TABLE attrition (
    Employee_ID INT PRIMARY KEY,
    Last_Working_Date DATE,
    Reason_For_Leaving VARCHAR(100),
    CONSTRAINT fk_attrition_emp FOREIGN KEY (Employee_ID)
        REFERENCES employee_master(Employee_ID)
);

-- CREATE TABLE PERFORMANCE
CREATE TABLE performance (
    Employee_ID INT,
    Review_Quarter VARCHAR(10),
    Performance_Score INT,
    Manager_Feedback VARCHAR(50),
    CONSTRAINT fk_performance_emp FOREIGN KEY (Employee_ID)
        REFERENCES employee_master(Employee_ID)
);


-- CREATE TABLE RECRUITMENT
CREATE TABLE recruitment (
    Candidate_ID INT PRIMARY KEY,
    Job_Role VARCHAR(50),
    Source VARCHAR(50),
    Application_Date DATE,
    Hiring_Status VARCHAR(50),
    Joining_Date VARCHAR(50)
);

-- QUERIES

-- Q1. List all employees with their latest performance score.
SELECT DISTINCT ON (e.Employee_ID)
       e.Employee_ID,
       e.Name,
       e.Department,
       e.Role,
       p.Review_Quarter,
       p.Performance_Score
FROM employee_master e
LEFT JOIN performance p
    ON e.Employee_ID = p.Employee_ID
ORDER BY e.Employee_ID, p.Review_Quarter DESC;

-- Q2. Employees who have left the company.
SELECT e.Employee_ID, e.Name, e.Department, e.Role, a.Last_Working_Date, a.Reason_For_Leaving
FROM employee_master e
JOIN attrition a
    ON e.Employee_ID = a.Employee_ID
ORDER BY a.Last_Working_Date DESC;

-- Q3. Average salary by department.
SELECT Department,
       ROUND(AVG(Salary),2) AS Avg_Salary,
       COUNT(Employee_ID) AS Total_Employees
FROM employee_master
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- Q4. Recruitment summary (Hired vs Pending).
SELECT Job_Role, Source,
       COUNT(*) AS Total_Applications,
       COUNT(*) FILTER (WHERE Hiring_Status = 'Hired') AS Hired,
       COUNT(*) FILTER (WHERE Hiring_Status != 'Hired') AS Pending
FROM recruitment
GROUP BY Job_Role, Source
ORDER BY Total_Applications DESC;

-- Q5. High performers by department.
SELECT Department, Employee_ID, Name, Performance_Score
FROM (
    SELECT e.Department, e.Employee_ID, e.Name, p.Performance_Score,
           ROW_NUMBER() OVER (PARTITION BY e.Department ORDER BY p.Performance_Score DESC) AS rn
    FROM employee_master e
    JOIN performance p
        ON e.Employee_ID = p.Employee_ID
) sub
WHERE rn <= 10
ORDER BY Department, Performance_Score DESC;
