-- Get the name of alumn and tutor when other alumns are the tutors
SELECT a.nombre,
    a.apellido,
    t.nombre,
    t.apellido
FROM platzi.alumnos AS a
INNER JOIN platzi.alumnos AS t 
    ON a.tutor_id = t.id; -- When alumn id is equal to a tutor_id, menaning an alumn is a tutor

-- Get the ten tutors with most students
SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
    COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
INNER JOIN platzi.alumnos AS t
ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10;

-- TASK: Get the average number of alumns by tutor
SELECT AVG(abt.alumnos_por_tutor) AS promedio_alumnos_por_tutor
FROM (
    SELECT CONCAT(t.nombre, ' ', t.apellido) AS tutor,
        COUNT(*) AS alumnos_por_tutor
    FROM platzi.alumnos AS a
    INNER JOIN platzi.alumnos AS t
    ON a.tutor_id = t.id
    GROUP BY tutor
) AS abt;