
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=internal-search

-- WHERE 절 서브쿼리
SELECT months * salary as earnings, COUNT(*)
FROM employee
WHERE months * salary = (SELECT MAX(salary*months) FROM employee )
GROUP BY earnings


-- HAVING 절 서브쿼리
SELECT months * salary as earnings, COUNT(*)
FROM employee
GROUP BY earnings
HAVING earnings = (SELECT MAX(months * salary) FROM employee)