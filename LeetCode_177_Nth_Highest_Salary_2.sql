CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  RETURN (
    SELECT IF(COUNT(sub.salary) < N, NULL, MIN(sub.salary))
    FROM (
        SELECT DISTINCT salary
        FROM EMPLOYEE
        ORDER BY salary DESC
        LIMIT N
        ) sub
  );
END