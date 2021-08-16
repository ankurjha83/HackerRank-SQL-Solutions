WITH employee_earnings AS(
    SELECT
    months*salary AS total_earnings
    FROM
    employee
    )
, max_earnings AS(
    SELECT
    MAX(total_earnings) AS value
    FROM
    employee_earnings
    )
, count_earnings AS(
    SELECT
    COUNT(*) AS count
    FROM employee_earnings, max_earnings
    WHERE total_earnings = max_earnings.value
    )
SELECT
max_earnings.value
, count_earnings.count
FROM max_earnings, count_earnings
;