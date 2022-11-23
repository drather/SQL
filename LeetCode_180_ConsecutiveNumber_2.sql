-- FROM 절에서,WINDOWS 함수를 사용한 서브쿼리를 사용한다.
-- LEAD 함수는 다음 row 에 있는 data 를 당겨온다. 첫번째 인자로 컬럼 이름을, 두번째 인자로 몇번째 데이터를 지를 받는다.
-- 즉, FROM 절 서브쿼리가 리턴하는 데이터는 현재 idx 의 num, 그다음 idx 의 num, 그다음 idx 의 num 이다.
-- 각 값들을 num, next, afternext 라는 컬럼으로 갖는 데이터를 리턴한다.

-- 이후 WHERE 절에서 세 값이 모두 같은 row 의 num 을 출력한다.

SELECT num AS ConsecutiveNums
FROM (
    SELECT num
        ,LEAD(num, 1) OVER (ORDER BY Id) AS next
        ,LEAD(num, 2) OVER (ORDER BY Id) AS afternext
    FROM logs
) l

WHERE l.num = l.next and l.next = l.afternext