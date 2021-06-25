SELECT
DISTINCT city
FROM
station
WHERE
SUBSTR(city,-1,1) in ('a','e','i','o','u')
;