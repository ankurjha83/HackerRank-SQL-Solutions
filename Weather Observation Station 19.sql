-- a is MIN(lat_n)
-- b is MAX(lat_n)
-- c is MIN(long_w)
-- d is MAX(long_w)

SELECT
ROUND(
        SQRT(
                (MAX(lat_n)-MIN(lat_n))*(MAX(lat_n)-MIN(lat_n))
                +
                (MAX(long_w)-MIN(long_w))*(MAX(long_w)-MIN(long_w))
            )
     ,4)
FROM
station
;