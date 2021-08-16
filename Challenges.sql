-- Print hacker_id
-- Print name
-- Print total challenges by each student
-- Order by total challenges in desc
-- order by hacker_id
-- find if any student has created same number of challenges
-- what is the max number of challenges created
WITH challenges_created AS (
    SELECT
    DISTINCT hackers.hacker_id
    , hackers.name
    , COUNT (challenge_id) OVER (PARTITION BY hackers.hacker_id) AS chlngs_crtd
    FROM hackers
    LEFT JOIN challenges ON hackers.hacker_id=challenges.hacker_id 
)
, max_challenges AS (
    SELECT
    MAX(chlngs_crtd) AS max_chlngs
    FROM challenges_created    
)
, challenges_count AS (
    SELECT
    chlngs_crtd
    , COUNT(*) AS cnt_chlngs
    FROM challenges_created
    GROUP BY chlngs_crtd)
, unique_challenges AS (
    SELECT
    chlngs_crtd
    FROM challenges_count
    WHERE cnt_chlngs = 1)
SELECT
hacker_id
, name
, chlngs_crtd
FROM challenges_created, max_challenges
WHERE chlngs_crtd = max_chlngs
OR chlngs_crtd IN (SELECT * FROM unique_challenges)
ORDER BY chlngs_crtd DESC, hacker_id;