/*
	Get the second highest value without repeating it
*/

-- Using Window Function - 260ms
SELECT DISTINCT colegiatura -- Only different values
FROM platzi.alumnos AS a1
-- Gets the value having two values grater to or iqual to it
WHERE 2 = ( 
	-- Get the amount of values greater or equal for each value of distinct colegiaturas
	SELECT COUNT(DISTINCT colegiatura)
	FROM platzi.alumnos AS a2
	WHERE a1.colegiatura <= a2.colegiatura
);

-- Using Limit - Offset - 75ms
SELECT DISTINCT colegiatura, tutor_id -- Only different values
FROM platzi.alumnos
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;
/*
	Rows matching third greatest value
*/

-- Using Inner Join - 80ms
SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	-- Gets the third greatest value 
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 2
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;

-- Using Window Function - 75ms
SELECT * 
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	-- Gets the third greatest value 
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 2
);

-- Task: Query the second half of the table alumnos
	-- Using between-and with two window functions
	SELECT * FROM platzi.alumnos
	WHERE id BETWEEN (
		SELECT MAX(id)
		FROM platzi.alumnos
	)/2 + 1 AND (
		SELECT MAX(id)
		FROM platzi.alumnos
	);
	
	-- Using Offset with row_number()
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
	OFFSET (
		SELECT COUNT(*)/2
		FROM platzi.alumnos
	);