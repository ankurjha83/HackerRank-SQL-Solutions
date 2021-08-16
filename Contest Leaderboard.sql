-- find total score
    -- find maximum score for each challenge
-- print id, name, total score
-- order by total score, then by hacker_id
-- remove all hackers with 0

WITH max_scores AS (
    SELECT
    hacker_id
    , challenge_id -- delete later
    , MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
)
, total_scores AS (
    SELECT
    hacker_id
    , SUM(max_score) as ttl_scrs
    FROM max_scores
    GROUP BY hacker_id
)
SELECT
total_scores.hacker_id
, hackers.name
, ttl_scrs
FROM total_scores
LEFT JOIN hackers ON total_scores.hacker_id=hackers.hacker_id
WHERE ttl_scrs <> 0
ORDER BY ttl_scrs DESC, 1 ASC
;