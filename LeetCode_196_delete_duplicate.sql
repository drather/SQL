--https://leetcode.com/problems/delete-duplicate-emails/
--같은 값의 email 인 id 중, 큰 ID 값을 지워라.
--쿼리가 총 3개로, DELETE 문 하나, WHERE 절에 서브쿼리가 하나, FROM 절에 서브쿼리가 하나씩 있다.
--
--FROM 절 서브쿼리부터 보면, email 로 group by 한 뒤, email 과 id 의 최소값을 리턴한다.
--이는 삭제하지 말아야 할 id 를 나타낸다.
--
--WHERE 절 서브쿼리를 보면, FROM 절 서브쿼리에서 리턴한 테이블을 id 와 비교하는 내용이 담겨있다.
--
--DELETE 절의 WHERE 절을 보면 id 가 삭제하지 말아야 할 테이블의 id 에 속해있지 않다면 삭제한다는 뜻이다.

DELETE
FROM Person
WHERE id not in (
    SELECT should_not_be_deleted.min_id
    FROM (
        SELECT email, min(id) as min_id
        FROM Person
        GROUP BY email
    ) should_not_be_deleted
)

