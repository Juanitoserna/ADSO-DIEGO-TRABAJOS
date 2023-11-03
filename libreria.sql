-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2023 a las 00:39:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id_autor` char(6) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `nacionalidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id_autor`, `nombre`, `apellidos`, `nacionalidad`) VALUES
('AUT001', 'F. Scott', 'Fitzgerald', 'Estadounidense'),
('AUT002', 'Gabriel', 'Garc?a M?rquez', 'Colombiano'),
('AUT003', 'Harper', 'Lee', 'Estadounidense'),
('AUT004', 'George', 'Orwell', 'Brit?nico'),
('AUT005', 'Miguel de', 'Cervantes', 'Espa?ol'),
('AUT006', 'Suzanne', 'Collins', 'Estadounidense'),
('AUT007', 'J.K.', 'Rowling', 'Brit?nica'),
('AUT008', 'Jane', 'Austen', 'Brit?nica'),
('AUT009', 'Cormac', 'McCarthy', 'Estadounidense'),
('AUT010', 'Dan', 'Brown', 'Estadounidense');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` char(6) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
('CAT001', 'Ficci?n', 'Libros de ficci?n y novelas'),
('CAT002', 'Cl?sicos', 'Obras cl?sicas de la literatura'),
('CAT003', 'Ciencia Ficci?n', 'Libros de ciencia ficci?n'),
('CAT004', 'Misterio', 'Novelas de misterio y suspense'),
('CAT005', 'Fantas?a', 'Libros de fantas?a y magia'),
('CAT006', 'No Ficci?n', 'Libros de no ficci?n y ensayos'),
('CAT007', 'Historia', 'Libros de historia y biograf?as'),
('CAT008', 'Romance', 'Novelas rom?nticas'),
('CAT009', 'Aventura', 'Libros de aventuras y exploraci?n'),
('CAT010', 'Drama', 'Obras de teatro y drama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id_ciudad` char(6) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id_ciudad`, `nombre`) VALUES
('CIU001', 'Nueva York'),
('CIU002', 'Los ?ngeles'),
('CIU003', 'Chicago'),
('CIU004', 'Miami'),
('CIU005', 'San Francisco'),
('CIU006', 'Dallas'),
('CIU007', 'Houston'),
('CIU008', 'Las Vegas'),
('CIU009', 'Washington D.C.'),
('CIU010', 'Boston');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `num_factura` char(6) NOT NULL,
  `codigo` char(6) NOT NULL,
  `cantidad` int(10) DEFAULT NULL,
  `precio_venta` float(5,2) DEFAULT NULL,
  `total` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`num_factura`, `codigo`, `cantidad`, `precio_venta`, `total`) VALUES
('FAC001', 'LIB001', 3, 25.99, 77.97),
('FAC002', 'LIB002', 2, 19.99, 39.98),
('FAC003', 'LIB003', 5, 22.50, 112.50),
('FAC004', 'LIB004', 1, 18.75, 18.75),
('FAC005', 'LIB005', 4, 15.99, 63.96),
('FAC006', 'LIB006', 2, 23.45, 46.90),
('FAC007', 'LIB007', 3, 27.75, 83.25),
('FAC008', 'LIB008', 2, 16.80, 33.60),
('FAC009', 'LIB009', 1, 20.25, 20.25),
('FAC010', 'LIB010', 3, 21.60, 64.80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` char(6) NOT NULL,
  `id_factura` char(6) DEFAULT NULL,
  `empresa` varchar(30) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` enum('enviado','recibido') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `envios`
--

INSERT INTO `envios` (`id_envio`, `id_factura`, `empresa`, `fecha`, `estado`) VALUES
('ENV001', 'FAC001', 'Empresa A', '2023-10-15', 'enviado'),
('ENV002', 'FAC002', 'Empresa B', '2023-10-16', 'enviado'),
('ENV003', 'FAC003', 'Empresa C', '2023-10-17', 'enviado'),
('ENV004', 'FAC004', 'Empresa A', '2023-10-18', 'enviado'),
('ENV005', 'FAC005', 'Empresa D', '2023-10-19', 'enviado'),
('ENV006', 'FAC006', 'Empresa B', '2023-10-20', 'enviado'),
('ENV007', 'FAC007', 'Empresa C', '2023-10-21', 'enviado'),
('ENV008', 'FAC008', 'Empresa A', '2023-10-22', 'enviado'),
('ENV009', 'FAC009', 'Empresa D', '2023-10-23', 'enviado'),
('ENV010', 'FAC010', 'Empresa B', '2023-10-24', 'enviado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `num_factura` char(6) NOT NULL,
  `id_usuario` char(6) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`num_factura`, `id_usuario`, `fecha`) VALUES
('FAC001', 'USR001', '2023-10-01'),
('FAC002', 'USR002', '2023-10-02'),
('FAC003', 'USR003', '2023-10-03'),
('FAC004', 'USR004', '2023-10-04'),
('FAC005', 'USR005', '2023-10-05'),
('FAC006', 'USR006', '2023-10-06'),
('FAC007', 'USR007', '2023-10-07'),
('FAC008', 'USR008', '2023-10-08'),
('FAC009', 'USR009', '2023-10-09'),
('FAC010', 'USR010', '2023-10-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `codigo` char(6) NOT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `anio_publicacion` date DEFAULT NULL,
  `stock` int(10) DEFAULT NULL,
  `precio_compra` float(5,2) DEFAULT NULL,
  `editorial` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`codigo`, `titulo`, `anio_publicacion`, `stock`, `precio_compra`, `editorial`) VALUES
('LIB001', 'El Gran Gatsby', '2020-01-15', 100, 25.99, 'Editorial A'),
('LIB002', 'Cien a?os de soledad', '2019-06-30', 75, 19.99, 'Editorial B'),
('LIB003', 'Matar un ruise?or', '2021-03-10', 120, 22.50, 'Editorial A'),
('LIB004', '1984', '2022-09-05', 90, 18.75, 'Editorial C'),
('LIB005', 'Don Quijote de la Mancha', '2018-12-20', 60, 15.99, 'Editorial B'),
('LIB006', 'Los juegos del hambre', '2020-11-17', 110, 23.45, 'Editorial D'),
('LIB007', 'Harry Potter y la piedra filos', '2022-05-28', 130, 27.75, 'Editorial A'),
('LIB008', 'Orgullo y prejuicio', '2019-08-14', 70, 16.80, 'Editorial C'),
('LIB009', 'La carretera', '2021-02-09', 85, 20.25, 'Editorial B'),
('LIB010', 'El c?digo Da Vinci', '2018-07-22', 95, 21.60, 'Editorial D'),
('LIB011', 'Los hombres me explican cosas', '2019-04-03', 45, 12.75, 'Editorial A'),
('LIB012', 'Los pilares de la Tierra', '2022-10-19', 105, 24.50, 'Editorial C'),
('LIB013', 'La Sombra del Viento', '2020-06-12', 80, 17.99, 'Editorial B'),
('LIB014', 'Los tres mosqueteros', '2019-01-25', 65, 14.25, 'Editorial A'),
('LIB015', 'El nombre del viento', '2021-08-08', 70, 18.50, 'Editorial D'),
('LIB016', 'El Se?or de los Anillos', '2018-03-07', 120, 28.99, 'Editorial C'),
('LIB017', 'Crimen y castigo', '2022-07-14', 50, 12.99, 'Editorial B'),
('LIB018', 'La Odisea', '2020-04-02', 95, 21.25, 'Editorial A'),
('LIB019', 'Las Aventuras de Sherlock Holm', '2019-11-29', 75, 16.75, 'Editorial D'),
('LIB020', 'Moby Dick', '2021-01-08', 55, 13.99, 'Editorial C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_autores`
--

CREATE TABLE `libros_autores` (
  `id_autor` char(6) NOT NULL,
  `codigo` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_autores`
--

INSERT INTO `libros_autores` (`id_autor`, `codigo`) VALUES
('AUT001', 'LIB001'),
('AUT002', 'LIB002'),
('AUT003', 'LIB003'),
('AUT004', 'LIB004'),
('AUT005', 'LIB005'),
('AUT006', 'LIB006'),
('AUT007', 'LIB007'),
('AUT008', 'LIB008'),
('AUT009', 'LIB009'),
('AUT010', 'LIB010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_categoria`
--

CREATE TABLE `libro_categoria` (
  `id_categoria` char(6) NOT NULL,
  `codigo` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro_categoria`
--

INSERT INTO `libro_categoria` (`id_categoria`, `codigo`) VALUES
('CAT001', 'LIB001'),
('CAT001', 'LIB002'),
('CAT001', 'LIB003'),
('CAT002', 'LIB004'),
('CAT002', 'LIB005'),
('CAT003', 'LIB006'),
('CAT003', 'LIB007'),
('CAT004', 'LIB008'),
('CAT004', 'LIB009'),
('CAT005', 'LIB010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` char(6) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `ciudad` char(6) DEFAULT NULL,
  `rol` enum('admin','editor','lector') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombres`, `apellidos`, `correo`, `pass`, `direccion`, `ciudad`, `rol`) VALUES
('USR001', 'Juan', 'P?rez', 'juanperez@example.com', 'contrase?a123', '123 Calle Principal', 'CIU001', 'admin'),
('USR002', 'Maria', 'Gonz?lez', 'mariagonzalez@example.com', 'password456', '456 Avenida Central', 'CIU002', 'lector'),
('USR003', 'Carlos', 'Rodr?guez', 'carlosrodriguez@example.com', 'clave789', '789 Calle Secundaria', 'CIU003', 'editor'),
('USR004', 'Ana', 'L?pez', 'analopez@example.com', 'secreta123', '246 Calle Norte', 'CIU001', 'lector'),
('USR005', 'Pedro', 'Mart?nez', 'pedromartinez@example.com', 'acceso567', '567 Avenida Sur', 'CIU004', 'lector'),
('USR006', 'Sof?a', 'Hern?ndez', 'sofiahernandez@example.com', 'segura789', '321 Calle Este', 'CIU002', 'editor'),
('USR007', 'Luis', 'D?az', 'luisdiaz@example.com', 'privada123', '432 Calle Oeste', 'CIU003', 'lector'),
('USR008', 'Laura', 'Ram?rez', 'lauraramirez@example.com', 'secreto456', '765 Avenida Oeste', 'CIU004', 'lector'),
('USR009', 'Javier', 'Fern?ndez', 'javierfernandez@example.com', 'password789', '987 Calle Principal', 'CIU001', 'editor'),
('USR010', 'Carolina', 'S?nchez', 'carolinasanchez@example.com', 'contrase?a567', '654 Avenida Norte', 'CIU002', 'lector');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`num_factura`,`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`num_factura`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `libros_autores`
--
ALTER TABLE `libros_autores`
  ADD PRIMARY KEY (`id_autor`,`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- Indices de la tabla `libro_categoria`
--
ALTER TABLE `libro_categoria`
  ADD PRIMARY KEY (`id_categoria`,`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `ciudad` (`ciudad`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`num_factura`) REFERENCES `facturas` (`num_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `libros` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`num_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libros_autores`
--
ALTER TABLE `libros_autores`
  ADD CONSTRAINT `libros_autores_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libros_autores_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `libros` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libro_categoria`
--
ALTER TABLE `libro_categoria`
  ADD CONSTRAINT `libro_categoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `libro_categoria_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `libros` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`id_ciudad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- nombre de los autores y titulos del libro o libros que han escrito 
SELECT autores.nombre , libros.titulo FROM autores
JOIN libro_autores ON autores.id_autor = libro_autores.id_autor;

--Todos los libros categorizados y su categoria
SELECT libros.titulo, categorias.nombre, FROM libros 
JOIN libro_categoria ON libros.codigo = libro_categoria.codigo
JOIN categorias ON libro_categoria.id_categoria = categorias.id_categoria;

--Todos lo libros y su categoria
SELECT libros.titulo, categorias.nombre, FROM libros
LEFT JOIN libro_categoria ON libros.codigo = libro_categoria.codigo
LEFT JOIN categorias ON libro_categoria.id_categoria = categorias.id_categoria;

--libros que no estan ategorizados 
SELECT libros.titulo, categorias.nombre, FROM libros 
LEFT JOIN libro_categoria ON libros.codigo = libro_categoria.codigo
LEFT JOIN categorias ON libro_categoria.id_categoria = categorias.id_categoria
WHERE libro_categoria.id_categoria IS NULL ;

--titulo, autores y categoria de los libros que tienen autor
SELECT libros.titulo, autores.nombre, autores.apellidos, categorias.nombre FROM libros 
JOIN libro_autores ON libros.codigo = libro_autores.codigo
JOIN autores ON libro_autores.id_autor = autores.id_autor
JOIN libro_categoria ON libro.codigo = libro_categoria.codigo
JOIN categorias ON libro_categoria.id_categoria = categorias.id_categoria;

-- facturas del dia de hoy y la suma del total vendido en el dia
SELECT facturas.fecha, SUM(detalle_factura.total) FROM facturas 
JOIN detalle_factura ON facturas.num_factura = detalle_factura.num_factura
GROUP BY fecha;
