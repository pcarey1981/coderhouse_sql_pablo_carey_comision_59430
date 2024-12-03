
--Actualizar Stock en la Tabla Comic al Registrar un Movimiento en el Inventario
--Este trigger ajusta automáticamente el stock del cómic al insertar un registro en la tabla Inventario.
DELIMITER $$

CREATE TRIGGER actualizar_stock_comic
AFTER INSERT ON Inventario
FOR EACH ROW
BEGIN
    IF NEW.tipo_movimiento = 'recepcion' THEN
        UPDATE Comic
        SET stock = stock + NEW.cantidad
        WHERE comic_id = NEW.comic_id;
    ELSEIF NEW.tipo_movimiento = 'venta' THEN
        -- Asegurarse de restar la cantidad, incluso si es negativa
        UPDATE Comic
        SET stock = stock - ABS(NEW.cantidad)
        WHERE comic_id = NEW.comic_id;
    END IF;
END$$

DELIMITER ;


--Validar Stock Disponible Antes de Registrar una Venta
--Evita que se registre un movimiento de venta si no hay suficiente stock disponible.
DELIMITER $$

CREATE TRIGGER validar_stock_comic 
BEFORE INSERT ON Inventario
FOR EACH ROW
BEGIN
    IF NEW.tipo_movimiento = 'venta' THEN
        -- Verifica si el stock es suficiente
        IF (SELECT stock FROM Comic WHERE comic_id = NEW.comic_id) < NEW.cantidad THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta.';
        END IF;
    END IF;
END$$

DELIMITER ;


--Calcular Total del Pedido en la Tabla Pedido
--Este trigger calcula automáticamente el total del pedido al insertar un registro en la tabla DetallePedido.
DELIMITER $$

CREATE TRIGGER calcular_total_pedido
AFTER INSERT ON DetallePedido
FOR EACH ROW
BEGIN
    DECLARE total_actual DECIMAL(10, 2);
    SELECT SUM((precio_unitario * cantidad) - (precio_unitario * cantidad * (descuento / 100)))
    INTO total_actual
    FROM DetallePedido
    WHERE pedido_id = NEW.pedido_id;

    UPDATE Pedido
    SET total = total_actual + tarifa_envio
    WHERE pedido_id = NEW.pedido_id;
END$$

DELIMITER ;	


--Aplicar Descuento de Ofertas Automáticamente en DetallePedido
--Este trigger ajusta automáticamente el descuento al agregar un cómic en un pedido si hay una oferta vigente.
DELIMITER $$

CREATE TRIGGER aplicar_descuento_oferta
BEFORE INSERT ON DetallePedido
FOR EACH ROW
BEGIN
    DECLARE descuento_actual DECIMAL(5, 2) DEFAULT 0;
    
    SELECT descuento
    INTO descuento_actual
    FROM Ofertas
    WHERE comic_id = NEW.comic_id
      AND CURDATE() BETWEEN fecha_inicio AND fecha_fin
    LIMIT 1;

    SET NEW.descuento = IFNULL(descuento_actual, 0);
END$$

DELIMITER ;


--Actualizar Estado de Pedido al Confirmar Pago
--Este trigger actualiza el estado de un pedido a "Pagado" después de registrar un pago.
DELIMITER $$

CREATE TRIGGER actualizar_estado_pedido
AFTER INSERT ON Pago
FOR EACH ROW
BEGIN
    UPDATE Pedido
    SET estado = 'Pagado'
    WHERE pedido_id = NEW.pedido_id;
END$$

DELIMITER ;

