-- Get the students incorporated in a determined year
	-- Using EXTRACT
	SELECT *
	FROM platzi.alumnos
	WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018;

	-- Using DATE_PART
	SELECT *
	FROM platzi.alumnos
	WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

	-- Using a subquery
	SELECT *
	FROM (
		SELECT *,
			DATE_PART('YEAR', fecha_incorporacion) AS year_incorporacion
		FROM platzi.alumnos
	) AS students_with_year
	WHERE year_incorporacion = 2020;
	
-- Task: Extract students incorporated in a certain month and year
SELECT *
FROM platzi.alumnos
WHERE 
	(EXTRACT(MONTH FROM fecha_incorporacion)) = '5'
	AND (EXTRACT(YEAR FROM fecha_incorporacion)) = '2020';