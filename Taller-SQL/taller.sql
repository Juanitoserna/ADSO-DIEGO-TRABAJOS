--                          Ejercicios	SLQ	BD	Tienda	On	Line.

--                                  SECTION T03
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
SELECT tv.cod , articulo.nombre ,tv.resolucion , tv.pantalla
FROM tv 
JOIN articulo ON (tv.cod = articulo.cod)
WHERE tv.pantalla NOT BETWEEN 22 AND 42;

-- 8- Código	y	nombre	de	los	televisores	cuyo	panel	sea	tipo	LED	y	su	precio	no	supere	los	1000	euros.
SELECT tv.cod, articulo.nombre , tv.panel ,articulo.pvp
FROM tv 
JOIN articulo ON (tv.cod = articulo.cod)
WHERE tv.panel LIKE '%LED%' AND articulo.pvp <= 1000;

-- 9- Email	de	los	usuarios	cuyo	código	postal	no	sea	02012,	02018	o	02032.
SELECT usuario.email , usuario.codpos 
FROM usuario
WHERE usuario.codpos NOT IN (02012,	02018,02032);

-- 10- Código	y	nombre	de	los	packs	de	los	que	se	conoce	qué	artículos los	componen.
SELECT articulo.cod , articulo.nombre FROM articulo 
JOIN pack ON (articulo.cod = pack.cod);

-- 11- ¿Hay	algún	artículo	en	cesta	que	esté	descatalogado?
SELECT articulo.nombre , stock.entrega 
FROM cesta
JOIN articulo ON cesta.articulo = articulo.cod
JOIN stock ON articulo.cod  = stock.articulo 
WHERE stock.entrega = 'Descatalogado';

-- 12- Código,	nombre	y	pvp	de	las	cámaras	de	tipo	compacta
SELECT camara.cod, articulo.nombre, articulo.pvp, camara.tipo
FROM articulo
JOIN camara ON (articulo.cod = camara.cod)
WHERE camara.tipo LIKE 'compacta%';

-- 13- Código,	nombre	y	diferencia	entre	pvp	y	precio	de	los	artículos que	hayan	sido	
-- solicitados	en algún	pedido	a	un	precio	distinto	de	su	precio	de	venta
SELECT articulo.cod, articulo.nombre, articulo.pvp, linped.precio
FROM articulo
JOIN linped ON (articulo.cod = linped.articulo)
WHERE articulo.pvp != linped.precio;

-- 14- Número	de	pedido, fecha	y	nombre	y	apellidos	del	usuario	que	solicita	el	pedido,	
-- para	aquellos pedidos	solicitados	por	algún	usuario	de	apellido	MARTINEZ.
SELECT pedido.numPedido, pedido.fecha , usuario.nombre, usuario.apellidos 
FROM pedido
JOIN usuario ON (pedido.usuario = usuario.email)
WHERE usuario.apellidos like '%MARTINEZ%';

-- 15- Código,	nombre	y	marca	del	artículo	más	caro
SELECT articulo.cod, articulo.nombre, articulo.marca, articulo.pvp 
FROM articulo 
WHERE pvp=(SELECT MAX(pvp) FROM articulo);

-- 16- Nombre,	marca	y	resolución de	las	cámaras	que	nunca	se	han	solicitado
SELECT articulo.nombre, articulo.marca, camara.resolucion
FROM camara
JOIN articulo ON camara.cod = articulo.cod
WHERE articulo.cod ; 

-- 22- Tipo	y	focal	de	los	objetivos	que	se	monten	en	una	cámara	Canon	sea	cual	sea	el	
-- modelo.
SELECT objetivo.tipo, objetivo.focal
FROM objetivo
WHERE objetivo.montura LIKE 'Canon%';

--                                SECTION T04

-- 19- Código,	nombre,	panel	y	pantalla	de	los	televisores	que	no	se	hayan	solicitado	ni	
-- en	lo	que	va	de	año,	ni	en	los	últimos	seis	meses	del	año	pasado.
SELECT tv.cod, articulo.nombre, tv.panel, tv.pantalla, pedido.fecha
FROM tv
JOIN articulo ON tv.cod = articulo.cod
JOIN linped ON articulo.cod = linped.articulo
JOIN pedido ON linped.numPedido = pedido.numPedido
WHERE pedido.fecha not BETWEEN DATE('2010-07-01') AND DATE('2011-10-13');0 

-- 15- Nombre,	apellidos	y	edad	(aproximada)	de	los	usuarios	del	dominio	"dlsi.ua.es",	
-- ordenado	descendentemente	por	edad.
SELECT usuario.nombre, usuario.apellidos,
TIMESTAMPDIFF(YEAR, usuario.nacido,'2011-10-13' ) AS edadAproximada
FROM usuarios
WHERE usuario.email LIKE '%dlsi.ua.es%' ORDER BY edadAproximada DESC;
