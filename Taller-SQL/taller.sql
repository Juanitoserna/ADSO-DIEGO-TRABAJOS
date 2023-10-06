--                          Ejercicios	SLQ	BD	Tienda	On	Line.
-- 1- Código	y	nombre	de	los	artículos con	un	precio	entre	400	y	500	euros
SELECT cod codigo, nombre, pvp precio 
FROM articulo 
WHERE  pvp BETWEEN 400 and 500;

-- 2- Código	y nombre	de	los	artículos con	precio	415,	129,	1259	o	3995.
SELECT cod codigo, nombre, pvp precio 
FROM articulo 
WHERE  pvp IN (415,129,1259,3995);

-- 3- Código	y	nombre	de	las	provincias	que	no	son	Huelva,	Sevilla,	Asturias	ni	Barcelona
SELECT codp codigo , nombre 
FROM provincia 
WHERE nombre NOT IN ('Huelva','Sevilla','Asturias','Barcelona');

-- 4- Código	de	la	provincia	Alicante.
SELECT codp,nombre 
FROM provincia 
WHERE nombre IN ('Alicante/Alacant');

-- 5- Obtener	el	código,	nombre	y	pvp	de	los	artículos cuya	marca	comience	por	S.
SELECT cod , nombre , pvp , marca 
FROM articulo 
WHERE marca LIKE 'S%';

-- 6- Información	sobre	los	usuarios	cuyo	email	es	de	la	eps.
SELECT * FROM usuario 
WHERE email LIKE '%eps%';

-- 7- Código,	nombre	y	resolución	de	los	televisores	cuya	pantalla	no	esté	entre	22	y 42
SELECT cod , resolucion , pantalla 
FROM tv 
WHERE pantalla NOT BETWEEN 22 AND 42;

-- 8- Código	y	nombre	de	los	televisores	cuyo	panel	sea	tipo	LED	y	su	precio	no	supere	los	1000	euros.
SELECT cod, nombre FROM articulo JOIN panel ON (articulo.cod = tv.cod);