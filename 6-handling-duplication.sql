-- Find the repeated registers using GROUP BY
SELECT 
	(platzi.alumnos.nombre, 
	 platzi.alumnos.apellido, 
	 platzi.alumnos.email
	)::text, -- Cast result into text
	COUNT(*)
FROM platzi.alumnos
GROUP BY 
	platzi.alumnos.nombre, 
	platzi.alumnos.apellido, 
	platzi.alumnos.email
HAVING COUNT(*) > 1;

-- Find the repeated registers using subquery
SELECT *
FROM (
	-- Count the rows with the same "nombre", "apellido" & "email"
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY
			nombre, apellido, email
		ORDER BY id ASC
	) AS row, *
	FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1; -- Get the rows with more than one repetition counter

-- Task: Use a subquery to delete the duplicated values
DELETE
FROM platzi.alumnos
WHERE (
	-- Get the id of duplicated rows
	SELECT duplicados.duplicated_row_id
	FROM (
		SELECT id AS duplicated_row_id,
		ROW_NUMBER() OVER(
			PARTITION BY
				nombre, apellido, email
			ORDER BY id ASC
		) AS row, *
		FROM platzi.alumnos
	) AS duplicados
	WHERE duplicados.row > 1
) = id;