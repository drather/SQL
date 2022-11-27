/* Write your T-SQL query statement below */
-- DENSE_RANK 를 이용한 문제 풀이.
-- DENSE_RANK 는 PARTITION BY 를 이용한 집계 와, ORDER BY 를 이용한 순위 매기기를 사옹한다는 것을 기억할 것.
-- DENSE_RANK 절에서 부서 id 로 집계하고(group by 와 유사), salary 컬럼의 값으로 순위를 매김 (각각 PARTITION BY, ORDER BY 와 매칭)


SELECT sub.dept_name AS Department, sub.emp_name AS Employee, sub.emp_salary AS salary

FROM (
    SELECT E.id AS emp_id,
        E.name AS emp_name,
        E.salary AS emp_salary,
        E.departmentId AS emp_deptid,
        D.id AS dept_id,
        D.name AS dept_name,
        DENSE_RANK() OVER (PARTITION BY D.id ORDER BY E.salary DESC) AS dense_rank
    FROM EMPLOYEE AS E
        INNER JOIN DEPARTMENT AS D
        ON E.departmentId = D.id
) sub

WHERE sub.dense_rank <= 3