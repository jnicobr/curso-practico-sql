-- Select the row_ids of specific students
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() as row_id
	FROM platzi.alumnos
) AS alumnos_with_row_number
WHERE row_id IN (1, 5, 10, 12, 15, 20); -- Array of specific row_ids

-- Get a subset from undetermined ids, related to a specific tutor_id and carrera_id
SELECT *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
		AND carrera_id = 31
);

-- Task: Get the values NOT included in the determined set
	SELECT *
	FROM (
		SELECT ROW_NUMBER() OVER() as row_id
		FROM platzi.alumnos
	) AS alumnos_with_row_number
	WHERE row_id NOT IN (1, 5, 10, 12, 15, 20);

	SELECT *
	FROM platzi.alumnos
	WHERE id NOT IN ( -- Adding NOT to get those not included in the subquery
		SELECT id
		FROM platzi.alumnos
		WHERE tutor_id = 30
			AND carrera_id = 31
	);