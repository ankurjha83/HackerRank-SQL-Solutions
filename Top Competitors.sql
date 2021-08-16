WITH leaderboard AS (
SELECT
submissions.hacker_id
,COUNT(*) AS number_submissions
FROM submissions
LEFT JOIN challenges ON submissions.challenge_id = challenges.challenge_id
LEFT JOIN difficulty ON challenges.difficulty_level = difficulty.difficulty_level  
LEFT JOIN hackers ON submissions.hacker_id = hackers.hacker_id
WHERE submissions.score = difficulty.score
GROUP BY submissions.hacker_id
)
SELECT 
hackers.hacker_id
, hackers.name
FROM leaderboard
LEFT JOIN hackers ON leaderboard.hacker_id=hackers.hacker_id
WHERE number_submissions > 1
ORDER BY number_submissions DESC, hacker_id ASC
;