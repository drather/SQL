-- 정규표현식 풀이 문제
-- [...]$: [] 안에 들어가 있는 문자 중 하나로 끝나는 문자열을 찾겠다.
-- .*: 이 뒤에는 아무것이나 와도 상관없다.

-- 정규표현식 튜토리얼 사이트:
-- https://regexone.com/lesson/introduction_abcs
-- https://regexr.com/

SELECT DISTINCT city
FROM STATION
WHERE city REGEXP '.*[aeiou]$'