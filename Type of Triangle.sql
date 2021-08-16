SELECT
CASE WHEN (a+b)>c
    THEN CASE WHEN a=b
        THEN CASE WHEN b=c
            THEN 'Equilateral'
            ELSE 'Isosceles'
            END
        ELSE CASE WHEN a=c
             THEN 'Isosceles'
             ELSE 'Scalene'
             END
        END
    ELSE 'Not A Triangle'
    END AS triangle
FROM
triangles
;