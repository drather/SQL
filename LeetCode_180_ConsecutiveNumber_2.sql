
SELECT num AS ConsecutiveNums
FROM (
    SELECT num
        ,LEAD(num, 1) OVER (ORDER BY Id) AS next
        ,LEAD(num, 2) OVER (ORDER BY Id) AS afternext
    FROM logs
) l

WHERE l.num = l.next and l.next = l.afternext