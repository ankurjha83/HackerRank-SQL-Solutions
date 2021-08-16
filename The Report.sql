/*
--Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
SELECT
students.name
, grades.grade
, students.marks
FROM students
LEFT JOIN grades ON students.marks BETWEEN grades.min_mark AND grades.max_mark

-- Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
WITH students_grades AS (
    SELECT
    students.name
    , grades.grade
    , students.marks
    FROM students
    LEFT JOIN grades ON students.marks BETWEEN grades.min_mark AND grades.max_mark
)
SELECT
    CASE WHEN grade<=8
        THEN NULL
        ELSE students_grades.name
        END AS students_name_adj
, grade
, marks
FROM students_grades

-- The report must be in descending order by grade -- i.e. higher grades are entered first. 
WITH students_grades AS (
    SELECT
    students.name
    , grades.grade
    , students.marks
    FROM students
    LEFT JOIN grades ON students.marks BETWEEN grades.min_mark AND grades.max_mark
)
SELECT
    CASE WHEN grade<=8
        THEN NULL
        ELSE students_grades.name
        END AS students_name_adj
, grade
, marks
FROM students_grades
ORDER BY grade DESC

-- If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. 
WITH students_grades AS (
    SELECT
    students.name
    , grades.grade
    , students.marks
    FROM students
    LEFT JOIN grades ON students.marks BETWEEN grades.min_mark AND grades.max_mark
)
SELECT
    CASE WHEN grade<=8
        THEN NULL
        ELSE students_grades.name
        END AS students_name_adj
, grade
, marks
FROM students_grades

-- Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
-- If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.
*/

WITH students_grades AS (
    SELECT
    students.name
    , grades.grade
    , students.marks
    FROM students
    LEFT JOIN grades ON students.marks BETWEEN grades.min_mark AND grades.max_mark
)

SELECT
    CASE WHEN grade<8
        THEN NULL
        ELSE students_grades.name
        END AS students_name_adj 
, grade
, marks
FROM students_grades
ORDER BY grade DESC, students_name_adj ASC, marks ASC
;