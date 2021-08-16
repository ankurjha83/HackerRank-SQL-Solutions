-- aggregate view stats by challenge
WITH view_stats_agg AS (
    SELECT challenge_id
    , SUM(total_views) AS total_views
    , SUM(total_unique_views) AS total_unique_views
    FROM view_stats 
    GROUP BY challenge_id
    )
--aggregate submission stats by challenge
, submission_stats_agg AS (
    SELECT
    challenge_id
    , SUM(total_submissions) AS total_submissions
    , SUM(total_accepted_submissions) AS total_accepted_submissions 
    FROM submission_stats 
    GROUP BY challenge_id
    )
SELECT
contests.contest_id
, contests.hacker_id
, contests.name
-- sum of all views for challenges aggregated to contests
, SUM(total_submissions)
, SUM(total_accepted_submissions)
, SUM(total_views)
, SUM(total_unique_views)
FROM contests
LEFT JOIN colleges ON  contests.contest_id = colleges.contest_id 
LEFT JOIN challenges ON colleges.college_id = challenges.college_id 
LEFT JOIN view_stats_agg ON challenges.challenge_id = view_stats_agg.challenge_id
LEFT JOIN submission_stats_agg ON challenges.challenge_id = submission_stats_agg.challenge_id
WHERE total_submissions <> 0 OR total_accepted_submissions <> 0 OR total_views <> 0 OR total_unique_views <> 0
GROUP BY contests.contest_id, contests.hacker_id, contests.name
ORDER BY contest_id
;