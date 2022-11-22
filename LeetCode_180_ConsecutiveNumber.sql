SELECT DISTINCT l.num as ConsecutiveNums
FROM logs as l
    INNER JOIN logs as l_next ON l.id + 1 = l_next.id
    INNER JOIN logs as l_next2 ON l.id + 2 = l_next2.id
WHERE l.num = l_next.num AND l.num = l_next2.num

-- logs 와 logs 를 id, id+1 로 조인했을 때 생성되는 테이블
--| id | num | id | num |
--| -- | --- | -- | --- |
--| 1  | 1   | 2  | 1   |
--| 2  | 1   | 3  | 1   |
--| 3  | 1   | 4  | 2   |
--| 4  | 2   | 5  | 1   |
--| 5  | 1   | 6  | 2   |
--| 6  | 2   | 7  | 2   |


-- logs 를 한번 도 join 했을 때 생성되는 테이블
--| id | num | id | num | id | num |
--| -- | --- | -- | --- | -- | --- |
--| 1  | 1   | 2  | 1   | 3  | 1   |
--| 2  | 1   | 3  | 1   | 4  | 2   |
--| 3  | 1   | 4  | 2   | 5  | 1   |
--| 4  | 2   | 5  | 1   | 6  | 2   |
--| 5  | 1   | 6  | 2   | 7  | 2   |

-- 여기서 각 id 는 큰 의미는 없고, 몇번째 테이블의 idx 인지를 나타낸다.
-- 따라서, where 절을 통해 3번 연속 같은 수가 나온 것이 어떤 것인지를 판별한다.