WITH occupations_adju AS (
    SELECT
    name
    , CONCAT(name,"(",LEFT(occupation,1),")") AS concatenated_name
    FROM occupations
    )
SELECT
concatenated_name
FROM occupations_adju
ORDER BY concatenated_name ASC;
WITH count_occupations AS (
    SELECT
    CONCAT("There are a total of ", COUNT(*)," ", LOWER(occupation), "s.")
    FROM occupations
    GROUP BY occupation
    ORDER BY COUNT(*)
    )
SELECT
*
FROM count_occupations;
