SET @i=21;
SELECT
REPEAT('* ', @i := @i-1)
FROM information_schema.tables;