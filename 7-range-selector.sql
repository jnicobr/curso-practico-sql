SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (1,2,3,4);

SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

-- int4range creates a set of small integers between the two given numbers
-- @> in postgres mean Contains
-- "A range of ints between 10 and 20 contains 3?"
SELECT int4range(10, 20) @> 3;

-- numrange creates a set of numbers between the two given numbers
-- Using the && in this query checks if there are values in common between the ranges
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0); -- Prints: true

-- UPPER gets the greatest value in a range
SELECT UPPER(int8range(15, 25));

-- LOWER gets the lowest value in a range
SELECT LOWER(int8range(15, 25));

-- Returns the intersection between the two ranges
SELECT int4range(10, 20) * int4range(15, 25); -- Prints: [15, 20)

SELECT ISEMPTY(numrange(1, 5)); -- Prints: false

-- Select everything from platzi.alumnos
    -- Where tutor_id is contained in the range of smallints between 10 and 20
-- Get everything where the tutor_id is between 10 and 20
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;

-- TASK: Common ids between tutor_id and carrera_id
SELECT tutor_id
FROM platzi.alumnos
WHERE tutor_id IN (
	SELECT carrera_id
	FROM platzi.alumnos
)
GROUP BY tutor_id
ORDER BY tutor_id;