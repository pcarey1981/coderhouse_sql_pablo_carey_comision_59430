USE tierra_uno_comic

--- Registros para la tabla Autor
INSERT INTO Autor (nombre, apellido, nacionalidad) VALUES
('Alan', 'Moore', 'Británica'),
('Frank', 'Miller', 'Estadounidense'),
('Neil', 'Gaiman', 'Británica'),
('Grant', 'Morrison', 'Escocesa'),
('Brian', 'K. Vaughan', 'Estadounidense');

-- Registros para la tabla Editorial
INSERT INTO Editorial (nombre, pais, telefono) VALUES
('DC Comics', 'Estados Unidos', '1234567890'),
('Marvel Comics', 'Estados Unidos', '0987654321'),
('Image Comics', 'Estados Unidos', '4567891230'),
('Dark Horse Comics', 'Estados Unidos', '7891234560'),
('IDW Publishing', 'Estados Unidos', '3216549870');

-- Registros para la tabla Genero
INSERT INTO Genero (nombre) VALUES
('Superhéroes'),
('Ciencia Ficción'),
('Fantasía'),
('Terror'),
('Drama');

-- Registros para la tabla Cliente
INSERT INTO Cliente (nombre, apellido, email, direccion, telefono) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', 'Calle Falsa 123, Buenos Aires', '1112345678'),
('María', 'Gómez', 'maria.gomez@example.com', 'Av. Siempre Viva 742, Córdoba', '2212345678'),
('Carlos', 'López', 'carlos.lopez@example.com', 'Calle Principal 456, Rosario', '3312345678'),
('Ana', 'Martínez', 'ana.martinez@example.com', 'Boulevard Central 789, Mendoza', '4412345678'),
('Lucía', 'Fernández', 'lucia.fernandez@example.com', 'Ruta Nacional 1, Salta', '5512345678');

-- Registros para la tabla Comic
INSERT INTO Comic (titulo, autor_id, editorial_id, genero_id, precio, fecha_publicacion, descripcion, stock) VALUES
('Watchmen', 1, 1, 1, 1500.00, '1986-09-01', 'Una historia revolucionaria de superhéroes', 50),
('The Dark Knight Returns', 2, 1, 1, 1800.00, '1986-02-01', 'Batman vuelve para enfrentar un mundo oscuro', 30),
('Sandman', 3, 1, 3, 2000.00, '1989-01-01', 'Una saga fantástica sobre los sueños', 40),
('Saga', 5, 3, 2, 1200.00, '2012-03-14', 'Una historia épica de ciencia ficción', 25),
('Hellboy', 4, 4, 4, 1000.00, '1994-03-01', 'El detective paranormal del infierno', 20);

-- Registros para la tabla Pedido
INSERT INTO Pedido (cliente_id, fecha_pedido, estado, total, tarifa_envio) VALUES
(1, '2024-11-01', 'Completado', 1650.00, 150.00),
(2, '2024-11-02', 'Pendiente', 1850.00, 200.00),
(3, '2024-11-03', 'Enviado', 2200.00, 250.00),
(4, '2024-11-04', 'Cancelado', 0.00, 0.00),
(5, '2024-11-05', 'Completado', 1200.00, 100.00);

-- Registros para la tabla Pago
INSERT INTO Pago (pedido_id, fecha_pago, monto, metodo_pago) VALUES
(1, '2024-11-02', 1650.00, 'Tarjeta de Crédito'),
(2, '2024-11-02', 1850.00, 'Transferencia Bancaria'),
(3, '2024-11-03', 2200.00, 'Efectivo'),
(5, '2024-11-05', 1200.00, 'Tarjeta de Débito');

-- Registros para la tabla DetallePedido
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) VALUES
(1, 1, 1, 1500.00, 0),
(2, 2, 1, 1800.00, 0),
(3, 3, 1, 2000.00, 0),
(3, 5, 1, 1000.00, 50),
(5, 4, 1, 1200.00, 0);

-- Registros para la tabla Proveedor
INSERT INTO Proveedor (nombre, telefono, direccion) VALUES
('Distribuidora A', '1234567890', 'Calle Comercio 123, Buenos Aires'),
('Distribuidora B', '0987654321', 'Av. Central 456, Córdoba'),
('Distribuidora C', '1122334455', 'Calle Industrial 789, Rosario'),
('Distribuidora D', '2233445566', 'Boulevard Negocios 101, Mendoza'),
('Distribuidora E', '3344556677', 'Ruta Comercial 202, Salta');

-- Registros para la tabla Inventario
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento) VALUES
(1, 1, '2024-10-01', 50, 'recepcion'),
(2, 2, '2024-10-02', 30, 'recepcion'),
(3, 3, '2024-10-03', 40, 'recepcion'),
(4, 4, '2024-10-04', 25, 'recepcion'),
(5, 5, '2024-10-05', 20, 'recepcion');

-- Registros para la tabla Resena
INSERT INTO Resena (comic_id, cliente_id, fecha_resena, calificacion, comentario) VALUES
(1, 1, '2024-11-06', 5, 'Obra maestra, un clásico imperdible'),
(2, 2, '2024-11-07', 4, 'Intensa y emocionante, una gran lectura'),
(3, 3, '2024-11-08', 5, 'La narrativa es simplemente perfecta'),
(4, 4, '2024-11-09', 5, 'Increíble historia y arte'),
(5, 5, '2024-11-10', 4, 'Entretenido y único');

-- Registros para la tabla Ofertas
INSERT INTO Ofertas (comic_id, descuento, fecha_inicio, fecha_fin) VALUES
(1, 10.00, '2024-11-01', '2024-11-10'),
(2, 15.00, '2024-11-05', '2024-11-15'),
(3, 20.00, '2024-11-10', '2024-11-20'),
(4, 5.00, '2024-11-15', '2024-11-25'),
(5, 25.00, '2024-11-20', '2024-11-30');

-- Registros para la tabla TarifaEnvio
INSERT INTO TarifaEnvio (zona, costo, metodo_envio) VALUES
('Buenos Aires', 150.00, 'Correo Argentino'),
('Córdoba', 200.00, 'Andreani'),
('Rosario', 250.00, 'OCA'),
('Mendoza', 300.00, 'DHL'),
('Salta', 350.00, 'FedEx');

-- Registros para la tabla Envio
INSERT INTO Envio (pedido_id, tarifa_id, fecha_envio, estado_envio, numero_seguimiento) VALUES
(1, 1, '2024-11-02', 'Entregado', 'ABC123'),
(2, 2, '2024-11-03', 'En camino', 'DEF456'),
(3, 3, '2024-11-04', 'En tránsito', 'GHI789'),
(5, 4, '2024-11-05', 'Pendiente', 'JKL012');

