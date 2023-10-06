--                    Reunión (join)
--                    Tipos de reunión
--      Equijoin
SELECT * FROM asignaturas, profesores, imparte
WHERE profesores.dni = imparte.dni AND asignatura = código;

--      Self join
SELECT i1.dni, ' imparte la misma asignatura que ', i2.dni
FROM imparte i1, imparte i2
WHERE i1.asignatura= i2.asignatura;

--            Producto cartesiano (consume muchos recursos)
SELECT dni, codigo
FROM profesores, asignaturas;

--                 Inner join, simple join
SELECT nombre, descripcion FROM asignaturas
JOIN imparte ON (codigo=asignatura)
JOIN profesores ON (imparte.dni=profesores.dni);

SELECT nombre, descripcion
FROM asignaturas JOIN imparte ON (codigo=asignatura)
JOIN profesores ON (imparte.dni=profesores.dni)
WHERE descripcion NOT LIKE 'PROGRAMACION%';
--      Outer join
SELECT p.*, i.asignatura FROM profesores p
LEFT JOIN imparte i ON (p.dni=i.dni);

--      Antijoin
SELECT * from profesores
WHERE dni NOT IN (SELECT dni FROM imparte);

--      Semijoin
SELECT * FROM profesores p
WHERE EXISTS (SELECT * FROM imparte i WHERE i.dni = p.dni);

--        NUEVA TABLA PARA LA BASE DE DATOS MATRICULA
CREATE TABLE coordinadores (
 dni VARCHAR(10) PRIMARY KEY,
 nombre VARCHAR(40),
 dpto CHAR(4),
 asig CHAR(5),
FOREIGN KEY (asignatura) REFERENCES asignaturas (codigo)
);

--       CREAMOS NYUEVOS DATOS PARA LA TABLA COORDINADORES
INSERT INTO coordinadores (dni, nombre, dpto, asig)
VALUES ('55777666' ,'AGAPITO CIFUENTES', 'DLSI' ,'FP'),
VALUES ('66555444', 'ROMUALDO GOMEZ' ,'DLSI' ,'HI'),
VALUES ('99222111', 'CATURLO PEREZ', 'DLSI' ,null);

--  Muestra todos los coordinadores y, si lo hacen, las asignaturas que coordinan.
SELECT * FROM coordinadores
LEFT JOIN asignaturas ON (codigo=asig);

--  Muestra los coordinadores que tienen asignatura y todas las asignaturas.
SELECT * FROM coordinadores RIGHT
JOIN asignaturas ON (codigo=asig);

--  Muestra todos los coordinadores y todas las asignaturas y si hay relación entre ellos.
SELECT * FROM coordinadores FULL
JOIN asignaturas ON (codigo=asig);


   
   
  
