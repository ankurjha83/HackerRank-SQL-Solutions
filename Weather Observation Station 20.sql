WITH ordered_list AS (
    SELECT 
    lat_n 
    FROM 
    station
    ORDER BY 1
    LIMIT 250
    )
    
SELECT ROUND(lat_n,4) FROM ordered_list
ORDER BY lat_n DESC
LIMIT 1
    ;