

/* Write your T-SQL query statement below */
SELECT res.DEPARTMENT as Department,
    res.Employee as Employee,
    res.max_salary as Salary

FROM (
    SELECT DEPARTMENT.name AS Department,
            EMPLOYEE.salary AS salary,
            EMPLOYEE.name AS Employee,
            MAX(EMPLOYEE.salary) OVER (PARTITION BY DEPARTMENT.id) AS max_salary
    FROM EMPLOYEE INNER JOIN DEPARTMENT
    ON EMPLOYEE.departmentId = DEPARTMENT.id
) res
WHERE res.salary = res.max_salary


-- answer query
-- it's the same with above SQL

--SELECT MAXIMUM_SALARY.Department,
--        MAXIMUM_SALARY.name AS Employee,
--        MAXIMUM_SALARY.salary
--FROM (
--    SELECT EMPLOYEE.name,
--            EMPLOYEE.salary,
--            DEPARTMENT.name AS Department,
--            MAX(salary) OVER (PARTITION BY departmentId) AS max_salary
--    FROM Employee
--        INNER JOIN DEPARTMENT
--        ON EMPLOYEE.departmentId = DEPARTMENT.id
--) MAXIMUM_SALARY
--
--WHERE MAXIMUM_SALARY.salary = MAXIMUM_SALARY.max_salary