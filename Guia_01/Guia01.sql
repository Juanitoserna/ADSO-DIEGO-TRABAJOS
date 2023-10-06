CREATE DATABASE matricula;


--  DATOS DE LA TABLA PROFESORES ---------------------------------------------------
CREATE TABLE profesores ( 
dni CHAR(10) PRIMARY KEY, 
nombre VARCHAR(40), 
categoria CHAR(4),
ingreso DATE
) ENGINE=InnoDB;
------------------------------------------------------------------------------------

INSERT INTO profesores (dni, nombre, categoria, ingreso)
VALUES (21111222, 'EVA GOMEZ', 'TEU','1993-10-01');

UPDATE profesores SET nombre = 'EVA PEREZ' WHERE dni = '21111222';

DELETE FROM profesores WHERE dni = '21111222';


INSERT INTO profesores (dni, nombre, categoria, ingreso)
VALUES (21111222 ,'EVA GOMEZ ','TEU' ,'1993-10-01'),
VALUES (21222333 ,'MANUEL PALOMAR ','TEU' ,'1989-06-16'),
VALUES (21333444 ,'RAFAEL ROMERO ','ASO6' ,'1992-06-16');


--                                DISTINCT
SELECT DISTINCT categoria FROM profesores;

--                                WHERE
SELECT nombre FROM profesores WHERE categoria = 'TEU';
SELECT nombre FROM profesores WHERE categoria = 'TEU' OR categoria = 'ASO6';

--                                ORDER BY
SELECT creditos, descripcion FROM asignaturas ORDER BY creditos;
SELECT creditos, descripcion FROM asignaturas WHERE creditos > 4.5 ORDER BY creditos DESC;
SELECT creditos, descripcion FROM asignaturas ORDER BY creditos, descripcion;

--                                 NULL (NULOS)
SELECT * FROM asignaturas WHERE creditosp IS NULL;

--                                 CONSTANTES
SELECT 'La asignatura ', descripcion, ' tiene ', creditos, ' créditos' FROM asignaturas ORDER BY creditos;

--                                 SELECCION DE MAS DE UNA TABLA
SELECT * FROM asignaturas, profesores, imparte;
SELECT * FROM asignaturas, profesores, imparte WHERE profesores.dni = imparte.dni AND asignatura = codigo;
SELECT nombre, descripcion FROM asignaturas, profesores, imparte WHERE profesores.dni=imparte.dni AND asignatura=codigo;

--                                  EXPRESION DE SELECCCION DE FILAS
SELECT creditos, descripción FROM asignaturas WHERE creditos BETWEEN 5 AND 8;
SELECT descripcion FROM asignaturas WHERE codigo in ('FBD', 'DGBD');
SELECT nombre FROM profesores p, imparte i WHERE p.dni = i.dni AND asignatura NOT IN ('HI', 'FBD', 'DGBD');

--                                  SUBCADENAS DE CARACTERES
SELECT * FROM profesores WHERE nombre LIKE 'RAFA%';
SELECT codigo FROM asignaturas WHERE descripcion LIKE '%BASES DE DATOS%';
SELECT codigo FROM asignaturas WHERE codigo LIKE ' ';
SELECT descripcion FROM asignaturas WHERE descripcion LIKE '%INFORMATIC_';

--                                  CONSULTAS ANIDADAS
SELECT descripcion, creditos FROM asignaturas WHERE creditos = (SELECT MIN(creditos) FROM asignaturas);
SELECT descripcion, creditos FROM asignaturas WHERE creditos = (SELECT MIN(creditos) FROM asignaturas);
SELECT * FROM asignaturas WHERE creditos >(SELECT creditos FROM asignaturas WHERE codigo = 'HI');
SELECT descripcion FROM asignaturas WHERE creditos >= ALL (SELECT creditos FROM asignaturas);
SELECT descripcion FROM asignaturas WHERE creditos = (SELECT MAX(creditos) FROM asignaturas);
SELECT descripcion FROM asignaturas WHERE creditos > ANY (SELECT creditos FROM asignaturas);
SELECT descripcion FROM asignaturas WHERE creditos != (SELECT MIN(creditos) FROM asignaturas);
SELECT descripcion FROM asignaturas WHERE creditos != (SELECT MIN(creditos) FROM asignaturas);
SELECT descripcion FROM asignaturas WHERE creditos != (SELECT MIN(creditos) FROM asignaturas);
SELECT p.* FROM profesores p, imparte i WHERE p.dni = i.dni;




--  DATOS DE LA TABLA ASIGNATURAS --------------------------------------------------
CREATE TABLE asignaturas ( 
codigo char(5) PRIMARY KEY, 
descripcion varchar(35), 
creditos float(3,1),
creditosp float(3,1),
) ENGINE=InnoDB;
------------------------------------------------------------------------------------

INSERT INTO asignaturas (codigo, descripcion, creditos, creditosp)
VALUES ('DGBD', 'DISEÑO Y GESTIÓN DE BASES DE DATOS', 6.0, 3.0);

INSERT INTO asignaturas (codigo, descripcion, creditos, creditosp)
VALUES ('DGBD' ,'DISEÑO Y GESTION DE BASES DE DATOS' 6.0 ,3.0),
VALUES ('FBD', 'FUNDAMENTOS DE LAS BASES DE DATOS' ,6.0 ,1.5),
VALUES ('FP', 'FUNDAMENTOS DE LA PROGRAMACION', 9.0 ,4.5),
VALUES ('HI', 'HISTORIA DE LA INFORMATICA' ,4.5 , null),
VALUES ('PC' ,'PROGRAMACION CONCURRENTE' ,6.0 ,1.5);


UPDATE asignaturas SET codigo = 'AAA' WHERE codigo = 'DGBD';

DELETE FROM asignaturas WHERE codigo = 'AAA';
DELETE FROM asignaturas WHERE codigo = 'DGBD'; 


--  DATOS DE LA TABLA IMPARTE ------------------------------------------------------
CREATE TABLE imparte ( 
dni CHAR(10), 
asignatura CHAR(5),
PRIMARY KEY (dni, asignatura),
FOREIGN KEY (dni) REFERENCES profesores (dni)ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (asignatura) REFERENCES asignaturas (codigo)ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
------------------------------------------------------------------------------------ 

INSERT INTO imparte (dni, asignatura) 
VALUES (21111222, 'DGBD');

INSERT INTO imparte (dni, asignatura) 
VALUES (21111222 ,'DGBD'),
VALUES (21111222 ,'FBD'),
VALUES (21333444 ,'PC');



