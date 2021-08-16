SELECT
CEIL(AVG(salary)-AVG(REPLACE(Salary,'0','')))
FROM
employees
;