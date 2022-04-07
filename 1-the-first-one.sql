/*
	Get the first register of the table
*/
SELECT *
FROM platzi.alumnos
--- FETCH usado en estandar ANSI de SQL
-- FETCH FIRST 1 ROWS ONLY;
-- Get the first register from the table, having the ID 1 with the default descendent order
LIMIT 1;

/*
	Window functions:
		Is the relation between the row to be measured and the total rows in a group. If not specified is the whole table. 
*/
-- Selec everything from the subselection with the number of rows from the whole table calling the 
SELECT *
FROM	(
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_nums
WHERE row_id = 1;

-- Task: Using FETCH, LIMIT and WINDOW FUNCTION to querie the first five methods
	-- Using FETCH - Took 1s437ms
	SELECT *
	FROM platzi.alumnos
	FETCH FIRST 5 ROWS ONLY;
	
	-- Using LIMIT - Took 1s112ms
	SELECT *
	FROM platzi.alumnos
	LIMIT 5;
	
	-- Using Window Function with less than or equal to
	-- Took: 1s110ms
	SELECT *
	FROM (
		SELECT ROW_NUMBER() OVER() AS row_id, *
		FROM platzi.alumnos
	) AS alumnos_with_row_num
	WHERE row_id <= 5;
	
	-- Using WIndow FUnction with BETWEEN, & AND.
	-- Took 1s329ms
	SELECT *
	FROM (
		SELECT ROW_NUMBER() OVER() AS row_id, *
		FROM platzi.alumnos
	) AS alumnos_with_row_id
	WHERE row_id 
	BETWEEN 1 AND 5;