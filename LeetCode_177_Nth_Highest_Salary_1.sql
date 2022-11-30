CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN
  RETURN (
    SELECT CASE WHEN COUNT(sub.salary) < N THEN NULL
                ELSE MIN(sub.salary)
            END
    FROM (
        SELECT DISTINCT salary
        FROM EMPLOYEE
        ORDER BY salary DESC
        LIMIT N
        ) sub
  );
END;