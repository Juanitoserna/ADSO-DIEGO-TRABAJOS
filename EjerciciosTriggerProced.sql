CREATE DATABASE cambioPrudcto;
USE cambioPrudcto;

CREATE TABLE Productos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Precio DECIMAL(10, 2)
);

INSERT INTO Productos (Nombre, Precio) VALUES
    ('Producto A', 10.99),
    ('Producto B', 20.49),
    ('Producto C', 15.75);

CREATE TABLE HistoricoCambios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ProductoID INT,
    PrecioAnterior DECIMAL(10, 2),
    PrecioNuevo DECIMAL(10, 2),
    Fecha TIMESTAMP,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ID)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha_venta DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(ID)
);

INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (1, 5, '2024-02-21');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (2, 3, '2024-02-22');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (1, 2, '2024-02-22');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (3, 7, '2024-02-23');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (1, 4, '2024-02-24');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (2, 6, '2024-02-25');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (3, 8, '2024-02-26');
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES (1, 3, '2024-02-27');



-- Crear un trigger: Si actualiza el precio de un producto se debe registrar el cambio en la tabla HistoricoCambios.
UPDATE Productos SET Precio = 20.99 WHERE ID = 1;
DROP TRIGGER actualizar_precio;
DELIMITER //
CREATE TRIGGER actualizar_precio AFTER UPDATE ON Productos
FOR EACH ROW 
BEGIN
    IF NEW.Precio != OLD.Precio THEN 
        INSERT INTO HistoricoCambios (ProductoID, PrecioAnterior, PrecioNuevo) VALUES (OLD.ID, OLD.Precio, NEW.Precio);   
    END IF;
END;
// 
DELIMITER;


-- Crear un procedimiento almacenado para calcular el total de ventas de un producto en un rango de fechas.
DROP PROCEDURE totalVentas;
CREATE PROCEDURE totalVentas(IN producto INT, IN date DATE, OUT date_end DATE)
BEGIN
    SELECT (SUM(cantidad)*precio)FROM ventas INNER JOIN Productos ON(ventas.id_producto = Productos.ID) WHERE fecha_venta
    BETWEEN date AND date_end AND productos.id = producto;
END
//


-- Crear un procedimiento almacenado para obtener el producto más vendido en un año determinado.
DROP PROCEDURE producto_mas_vendido;
DELIMITER//
CREATE PROCEDURE producto_mas_vendido(fecha_resivida char(4))
BEGIN 
    SELECT Productos.nombre, SUM(ventas.cantidad) AS total FROM Productos
    INNER JOIN ventas ON Productos.ID = ventas.id_producto
    WHERE YEAR(fecha_venta) = 'fecha_resivida'
    GROUP BY id_producto 
    ORDER BY total DESC 
    LIMIT 1;
END;
//
DELIMITER ;
-- Crear un procedimiento almacenado para obtener el total de ventas por mes.

-- Crear un procedimiento almacenado para obtener el total de ventas por  un mes determinado.

-- Crear un procedimiento almacenado para calcular el promedio de ventas mensual.

-- Crear un procedimiento almacenado para calcular el promedio de ventas mensual de un mes determinado.

-- Crear un procedimiento almacenado para obtener los productos con ventas superiores a un valor dado.


PRODUCTOS
+----+------------+--------+
| ID | Nombre     | Precio |
+----+------------+--------+
|  1 | Producto A |  10.99 |
|  2 | Producto B |  20.49 |
|  3 | Producto C |  15.75 |
+----+------------+--------+

VENTAS
+----------+-------------+----------+-------------+
| id_venta | id_producto | cantidad | fecha_venta |
+----------+-------------+----------+-------------+
|        1 |           1 |        5 | 2024-02-21  |
|        2 |           2 |        3 | 2024-02-22  |
|        3 |           1 |        2 | 2024-02-22  |
|        4 |           3 |        7 | 2024-02-23  |
|        5 |           1 |        4 | 2024-02-24  |
|        6 |           2 |        6 | 2024-02-25  |
|        7 |           3 |        8 | 2024-02-26  |
|        8 |           1 |        3 | 2024-02-27  |
+----------+-------------+----------+-------------+


UPDATE nombre-de-la-tabla
SET nombre-de-la-columna = valor[, nombre-de-la-columna=valor]
[WHERE condición]