WITH self_salary AS (
    SELECT
    students.id
    , students.name
    , packages.salary
    , friends.friend_id
    FROM students
    LEFT JOIN friends ON students.id = friends.id
    LEFT JOIN packages ON students.id = packages.id
    )
SELECT
self_salary.name
/*
, self_salary.id
, self_salary.salary
, self_salary.friend_id
, packages.id
, packages.salary
*/
FROM
self_salary
LEFT JOIN packages ON self_salary.friend_id = packages.id
WHERE packages.salary > self_salary.salary
ORDER BY packages.salary ASC
;