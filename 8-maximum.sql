SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

-- If doing a Group By for a field, having multiple queried
    -- the others can be maximized

-- Each carreer has the date of most recent enrollment to the carreer
SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

-- TASK: Mimimum name alphabetically from in the table
    -- General table minimum
    SELECT nombre
    FROM platzi.alumnos
    ORDER BY nombre ASC
    LIMIT 1;

    -- Minimum by tutor ID
    SELECT MIN(nombre), tutor_id
    FROM platzi.alumnos
    GROUP BY tutor_id
	ORDER BY tutor_id;