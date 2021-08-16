WITH good_cheap_wands AS (
    SELECT
    id
    , age
    , coins_needed
    , MIN(coins_needed) OVER(PARTITION BY power, age) AS min_coins
    , power
    FROM wands
    LEFT JOIN wands_property ON  wands.code = wands_property.code
    WHERE wands_property.is_evil=0
    ORDER BY power DESC, age DESC, coins_needed ASC
)
SELECT
id
, age
, coins_needed
, power
FROM good_cheap_wands
WHERE min_coins - coins_needed=0
;