
SELECT Department.name AS Department, Employee.name AS Employee, Employee.salary AS Salary
FROM Employee INNER JOIN (
    SELECT departmentId, MAX(salary) as max_salary
    FROM Employee
    GROUP BY departmentId
) as dept_max_salary ON Employee.departmentId = dept_max_salary.departmentId
    INNER JOIN Department ON Employee.departmentId = Department.id

WHERE Employee.salary = dept_max_salary.max_salary
