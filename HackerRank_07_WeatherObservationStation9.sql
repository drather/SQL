-- 정규표현식 풀이 문제
-- 이전 2가지 조건을 combination 하는 문제이다.
-- ^[aeiou] : 모음으로 시작한다.
-- .*: 아무것이나 와도 상관이 없다.
-- [aeiou]$: 모음으로 끝난다.

-- 정규표현식 튜토리얼 사이트:
-- https://regexone.com/lesson/introduction_abcs
-- https://regexr.com/

SELECT DISTINCT city
FROM STATION
WHERE city not REGEXP '^[aeiou].*'
