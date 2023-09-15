--                CADENAS DE CARACTERES, NUMEROS, FECHAS Y TIEMPOS 
SELECT * FROM profesores WHERE ingreso < '1990-01-01';

--                AHORA NOW ()
SELECT NOW(), CURDATE(), CURTIME(); -- DEVUELVE now(2010-12-03 19:40:17) , curdate(2010-12-03) , curtime(19:40:17)

--                FORMATO
SELECT dni,nombre, DATE_FORMAT(ingreso, '%d/%m/%Y') ingreso  FROM profesores;

-- Profesores que han ingresado antes de 1/1/1990.
SELECT * FROM profesores WHERE ingreso < STR_TO_DATE('1/1/90','%d/%m/%y');.

--                EXTRACCION
SELECT DAY(ingreso) día, MONTH(ingreso) mes, YEAR(ingreso) año FROM profesores WHERE nombre='EVA GOMEZ';
--|    DEVUELVE     |
--| día | mes | año |
--|  1  | 10  | 1993|

SELECT DAY(ingreso) día, MONTH(ingreso) mes, YEAR(ingreso) año FROM profesores WHERE nombre='EVA GOMEZ';
--|       DEVUELVE         |
--| dia     | mes | año    |
--| Friday  | 6   | October|

SELECT DATE_FORMAT(NOW(),'%Y%m%d -- %H:%i:%s') ahora;
--|        hora          |
--| 20101203 -- 20:12:49 |

--                      ARITMETICA DE COLUMNA
--Suponiendo que el curso se divide en 2 semestres y que 3 créditos se
--corresponden con 1 hora de clase semanal, nombre de las asignaturas
--y número de horas de clase semanales de cada una en un único
--semestre.
SELECT descripcion,(creditos/3)*2 horas FROM asignaturas;

--Descripción de las asignaturas y número de horas semanales de las
--asignaturas con menos de 4 horas semanales de clase
SELECT descripcion, creditos FROM asignaturas
WHERE (creditos/3)*2 < 4

--          Funciones
--Redondea 15.1297 a dos decimales
SELECT ROUND(15.1297,2) redondeo FROM dual;

--¿Cuántos profesores hay en nuestra base de datos?
SELECT COUNT(*) profes FROM profesores;

--¿Cuántas asignaturas de más de 4 créditos tenemos?
SELECT COUNT(*) FROM asignaturas WHERE creditos > 4;

--¿Cuantos valores de créditos distintos hay?
SELECT COUNT(DISTINCT creditos) numcreditos FROM asignaturas;

--                      SOBRE EL MODIFICADOR DISTICNT 
SELECT COUNT(*) filas, COUNT(creditosp) valores, COUNT(DISTINCT creditosp) distintos FROM asignaturas;

SELECT AVG(creditosp) sinDis, AVG(DISTINCT creditosp) conDis FROM asignaturas;


