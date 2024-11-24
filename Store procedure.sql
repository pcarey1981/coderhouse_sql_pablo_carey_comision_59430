
--Registrar un nuevo cliente
DELIMITER //
CREATE PROCEDURE RegistrarCliente (
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(15)
)
BEGIN
    INSERT INTO Cliente (nombre, apellido, email, direccion, telefono)
    VALUES (p_nombre, p_apellido, p_email, p_direccion, p_telefono);
END //
DELIMITER ;


--Registrar un nuevo pedido
DELIMITER //
CREATE PROCEDURE RegistrarPedido (
    IN p_cliente_id INT,
    IN p_estado VARCHAR(50),
    IN p_total DECIMAL(10, 2),
    IN p_tarifa_envio DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Pedido (cliente_id, fecha_pedido, estado, total, tarifa_envio)
    VALUES (p_cliente_id, CURDATE(), p_estado, p_total, p_tarifa_envio);
END //
DELIMITER ;


--Registrar un pago para un pedido
DELIMITER //
CREATE PROCEDURE RegistrarPago (
    IN p_pedido_id INT,
    IN p_monto DECIMAL(10, 2),
    IN p_metodo_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Pago (pedido_id, fecha_pago, monto, metodo_pago)
    VALUES (p_pedido_id, CURDATE(), p_monto, p_metodo_pago);
END //
DELIMITER ;


--Registrar una recepción de cómics (movimiento de inventario)
DELIMITER //
CREATE PROCEDURE RegistrarRecepcion (
    IN p_comic_id INT,
    IN p_proveedor_id INT,
    IN p_cantidad INT
)
BEGIN
    -- Aumentar el stock de cómics
    INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
    VALUES (p_comic_id, p_proveedor_id, CURDATE(), p_cantidad, 'recepcion');
    
    -- Actualizar el stock en la tabla Comic
    UPDATE Comic
    SET stock = stock + p_cantidad
    WHERE comic_id = p_comic_id;
END //
DELIMITER ;


--Registrar una venta de cómics (movimiento de inventario) Lo elimine
DELIMITER //
CREATE PROCEDURE RegistrarVenta (
    IN p_comic_id INT,
    IN p_cantidad INT,
    IN p_pedido_id INT
)
BEGIN
    -- Disminuir el stock de cómics
    INSERT INTO Inventario (comic_id, pedido_id, fecha_movimiento, cantidad, tipo_movimiento)
    VALUES (p_comic_id, p_pedido_id, CURDATE(), -p_cantidad, 'venta');
    
    -- Actualizar el stock en la tabla Comic
    UPDATE Comic
    SET stock = stock - p_cantidad
    WHERE comic_id = p_comic_id;
END //
DELIMITER ;


--Aplicar un descuento a un cómic en una oferta
DELIMITER //
CREATE PROCEDURE AplicarOferta (
    IN p_comic_id INT,
    IN p_descuento DECIMAL(5, 2),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    INSERT INTO Ofertas (comic_id, descuento, fecha_inicio, fecha_fin)
    VALUES (p_comic_id, p_descuento, p_fecha_inicio, p_fecha_fin);
END //
DELIMITER ;


--Actualizar estado de envío
DELIMITER //
CREATE PROCEDURE ActualizarEstadoEnvio (
    IN p_envio_id INT,
    IN p_estado_envio VARCHAR(50),
    IN p_numero_seguimiento VARCHAR(100)
)
BEGIN
    UPDATE Envio
    SET estado_envio = p_estado_envio, numero_seguimiento = p_numero_seguimiento
    WHERE envio_id = p_envio_id;
END //
DELIMITER ;


--Obtener detalles del pedido con los cómics asociados
DELIMITER //
CREATE PROCEDURE ObtenerDetallePedido (
    IN p_pedido_id INT
)
BEGIN
    SELECT 
        dp.detalle_id,
        c.titulo,
        dp.cantidad,
        dp.precio_unitario,
        dp.descuento,
        (dp.cantidad * dp.precio_unitario - dp.descuento) AS total_por_comic
    FROM DetallePedido dp
    JOIN Comic c ON dp.comic_id = c.comic_id
    WHERE dp.pedido_id = p_pedido_id;
END //
DELIMITER ;


--Procedimiento para Actualizar el Stock al Registrar una Venta
DELIMITER //
CREATE PROCEDURE ActualizarStock(pedido INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE comic_id INT;
    DECLARE cantidad INT;
    DECLARE cur CURSOR FOR 
        SELECT comic_id, cantidad 
        FROM DetallePedido 
        WHERE pedido_id = pedido;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO comic_id, cantidad;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Registrar el movimiento de stock como venta
        INSERT INTO Inventario (comic_id, cantidad, tipo_movimiento, fecha_movimiento)
        VALUES (comic_id, -cantidad, 'venta', CURDATE());
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;


