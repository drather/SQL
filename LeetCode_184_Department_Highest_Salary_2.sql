

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
