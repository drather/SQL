-- 정규표현식 풀이 문제
-- ^: 뒤에 나오는 문자로 문자열이 시작한다.
-- .*: 이 뒤에는 아무것이나 와도 상관없다.

-- 정규표현식 튜토리얼 사이트: https://regexone.com/lesson/introduction_abcs

SELECT DISTINCT STATION.city
FROM STATION
WHERE city REGEXP '^[aeiou].*'