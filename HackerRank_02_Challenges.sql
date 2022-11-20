SELECT Hacker_challend_count.hacker_id,
HACKERS.name,
Hacker_challend_count.challenge_count

FROM (
    SELECT Challenges.hacker_id, COUNT(*) AS challenge_count
    FROM Challenges
    GROUP BY hacker_id
) AS Hacker_challend_count

INNER JOIN (
    SELECT challenge_count, COUNT(challenge_count) as count_created_count
    FROM (
        SELECT hacker_id, COUNT(*) AS challenge_count
        FROM Challenges
        GROUP BY hacker_id
    ) Hacker_challend_count
    GROUP BY Hacker_challend_count.challenge_count
) AS Count_created_count
ON Hacker_challend_count.challenge_count = Count_created_count.challenge_count

INNER JOIN Hackers
ON Hacker_challend_count.hacker_id = Hackers.hacker_id,
(
    SELECT max(Hacker_challenge_count.challenge_count) AS max_count
    FROM (
            SELECT hacker_id, COUNT(*) AS challenge_count
            FROM Challenges
            GROUP BY hacker_id
        ) Hacker_challenge_count
)   Max_count

WHERE Max_count.max_count = Hacker_challend_count.challenge_count  OR
   (Count_created_count.count_created_count < 2 and Hacker_challend_count.challenge_count != Max_count.max_count)

ORDER BY Hacker_challend_count.challenge_count DESC, Hacker_challend_count.hacker_id
