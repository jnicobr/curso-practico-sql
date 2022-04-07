-- Get only the year from a timestamp column
SELECT EXTRACT (
	YEAR FROM fecha_incorporacion
) AS year_incorporacion
FROM platzi.alumnos;

-- Get only the year from a timestamp using the Postgres DATE_PART function
SELECT DATE_PART('YEAR', fecha_incorporacion) AS year_incorporacion
FROM platzi.alumnos;

--Task: Get the hours from the timestamp
	-- Using EXTRACT
	SELECT
		EXTRACT(HOUR FROM fecha_incorporacion) AS hour_incorporacion,
		EXTRACT(MINUTE FROM fecha_incorporacion) AS minute_incorporacion,
		EXTRACT(SECOND FROM fecha_incorporacion) AS second_incorporacion
	FROM platzi.alumnos;

	-- Using DATE_PART from PostgreSQL
	SELECT
		DATE_PART('HOUR', fecha_incorporacion) AS hour_incorporacion,
		DATE_PART('MINUTE', fecha_incorporacion) AS minute_incorporacion,
		DATE_PART('SECOND', fecha_incorporacion) AS second_incorporacion
	FROM platzi.alumnos;