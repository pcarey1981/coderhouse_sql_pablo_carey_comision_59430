
--Calcular Stock Total de un Cómic
--Devuelve el stock actual de un cómic considerando los movimientos en el inventario.
DELIMITER $$
CREATE FUNCTION CalcularStockTotal(comic INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_stock INT;
    SELECT COALESCE(SUM(cantidad), 0)
    INTO total_stock
    FROM Inventario
    WHERE comic_id = comic;
    RETURN total_stock;
END$$
DELIMITER ;

-- Supongamos que quieres calcular el stock de un cómic con ID 1
SELECT CalcularStockTotal(1) AS stock_total;


--Calcular Total de un Pedido
--Calcula el total de un pedido basado en los detalles de los cómics comprados, aplicando descuentos si existen.
DELIMITER $$
CREATE FUNCTION CalcularTotalPedido(pedido INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM((precio_unitario - (precio_unitario * (descuento / 100))) * cantidad)
    INTO total
    FROM DetallePedido
    WHERE pedido_id = pedido;
    RETURN total;
END$$
DELIMITER ;

-- Supongamos que quieres calcular el total del pedido con ID 1
SELECT CalcularTotalPedido(1) AS total_pedido;


--Obtener Calificación Promedio de un Cómic
--Devuelve la calificación promedio de un cómic basándose en las reseñas.
DELIMITER $$
CREATE FUNCTION CalificacionPromedio(comic INT)
RETURNS DECIMAL(3, 2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(3, 2);
    SELECT AVG(calificacion)
    INTO promedio
    FROM Resena
    WHERE comic_id = comic;
    RETURN COALESCE(promedio, 0); -- Devuelve 0 si no hay reseñas.
END$$
DELIMITER ;

-- Supongamos que quieres saber la calificación promedio del cómic con ID 2
SELECT CalificacionPromedio(2) AS calificacion_promedio;


--Determinar si un Cómic Está en Oferta
--Verifica si un cómic tiene una oferta activa y devuelve el porcentaje de descuento.
DELIMITER $$
CREATE FUNCTION ObtenerDescuento(comic INT, fecha DATE)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
    DECLARE descuento DECIMAL(5, 2);
    SELECT descuento
    INTO descuento
    FROM Ofertas
    WHERE comic_id = comic
      AND fecha BETWEEN fecha_inicio AND fecha_fin
    LIMIT 1;
    RETURN COALESCE(descuento, 0); -- Devuelve 0 si no hay oferta activa.
END$$
DELIMITER ;

-- Supongamos que quieres saber el descuento del cómic con ID 3 para la fecha '2024-11-23'
SELECT ObtenerDescuento(3, '2024-11-23') AS descuento_activo;


--Calcular el Costo de Envío
--Devuelve el costo de envío según la zona y el método de envío.
DELIMITER $$
CREATE FUNCTION CalcularCostoEnvio(zona VARCHAR(100), metodo VARCHAR(100))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE costo DECIMAL(10, 2);
    SELECT costo
    INTO costo
    FROM TarifaEnvio
    WHERE zona = zona AND metodo_envio = metodo
    LIMIT 1;
    RETURN COALESCE(costo, 0); -- Devuelve 0 si no se encuentra tarifa.
END$$
DELIMITER ;

-- Supongamos que quieres saber el costo de envío para la zona 'Capital Federal' con el método 'Estandar'
SELECT CalcularCostoEnvio('Capital Federal', 'Estandar') AS costo_envio;


--Verificar Disponibilidad de Stock para un Pedido
--Comprueba si existe suficiente stock para todos los cómics en un pedido antes de procesarlo.
DELIMITER $$
CREATE FUNCTION VerificarStock(pedido INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE stock_suficiente BOOLEAN;
    SET stock_suficiente = TRUE;

    IF EXISTS (
        SELECT 1
        FROM DetallePedido dp
        JOIN Comic c ON dp.comic_id = c.comic_id
        WHERE dp.pedido_id = pedido
          AND dp.cantidad > CalcularStockTotal(dp.comic_id)
    ) THEN
        SET stock_suficiente = FALSE;
    END IF;

    RETURN stock_suficiente;
END$$
DELIMITER ;

-- Supongamos que quieres verificar el stock para el pedido con ID 1
SELECT VerificarStock(1) AS stock_suficiente; -- Devuelve 1 (TRUE) o 0 (FALSE)


--Generar Número de Seguimiento para Envío
--Crea un número de seguimiento único para un pedido.
DELIMITER $$
CREATE FUNCTION GenerarNumeroSeguimiento(pedido INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT('ENV-', pedido, '-', UNIX_TIMESTAMP());
END$$
DELIMITER ;

-- Supongamos que quieres generar el número de seguimiento para el pedido con ID 1
SELECT GenerarNumeroSeguimiento(1) AS numero_seguimiento;

