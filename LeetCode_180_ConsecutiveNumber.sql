SELECT DISTINCT l.num as ConsecutiveNums
FROM logs as l
    INNER JOIN logs as l_next ON l.id + 1 = l_next.id
    INNER JOIN logs as l_next2 ON l.id + 2 = l_next2.id
WHERE l.num = l_next.num AND l.num = l_next2.num