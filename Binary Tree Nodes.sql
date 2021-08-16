SELECT
CASE WHEN P IS NULL
    THEN CONCAT (N, " Root")
        WHEN N IN (SELECT DISTINCT P FROM bst) 
        THEN CONCAT (N, " Inner")
        ELSE CONCAT(N, " Leaf")
        END
    END
FROM bst
ORDER BY N ASC
;