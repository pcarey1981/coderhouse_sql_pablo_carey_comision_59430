
-- Vista para obtener el listado de cómics con sus autores, editoriales y género:
CREATE VIEW Vista_Comic_Detalles AS
SELECT
    c.comic_id,
    c.titulo,
    c.precio,
    c.fecha_publicacion,
    a.nombre AS autor_nombre,
    a.apellido AS autor_apellido,
    e.nombre AS editorial_nombre,
    g.nombre AS genero_nombre
FROM
    Comic c
JOIN Autor a ON c.autor_id = a.autor_id
JOIN Editorial e ON c.editorial_id = e.editorial_id
JOIN Genero g ON c.genero_id = g.genero_id;

-- Consultar los detalles de los cómics con sus autores, editoriales y género:
SELECT * FROM Vista_Comic_Detalles;


-- Vista para obtener el historial de pedidos, con detalles de los cómics comprados, su cantidad, precio y el estado del pedido:
CREATE VIEW Vista_Historial_Pedidos AS
SELECT
    p.pedido_id,
    p.fecha_pedido,
    p.estado AS estado_pedido,
    p.total,
    dp.comic_id,
    c.titulo AS comic_titulo,
    dp.cantidad,
    dp.precio_unitario,
    dp.descuento,
    (dp.cantidad * dp.precio_unitario - dp.descuento) AS total_comic
FROM
    Pedido p
JOIN DetallePedido dp ON p.pedido_id = dp.pedido_id
JOIN Comic c ON dp.comic_id = c.comic_id;

--Consultar el historial de pedidos, con detalles de los cómics comprados, su cantidad, precio y el estado del pedido:
SELECT * FROM Vista_Historial_Pedidos;


--Vista para obtener los pagos realizados por cada pedido, con su método de pago:
CREATE VIEW Vista_Pagos_Pedidos AS
SELECT
    pa.pago_id,
    pa.fecha_pago,
    pa.monto,
    pa.metodo_pago,
    p.pedido_id,
    p.total AS total_pedido
FROM
    Pago pa
JOIN Pedido p ON pa.pedido_id = p.pedido_id;

--Consultar los pagos realizados por cada pedido, con su método de pago:
SELECT * FROM Vista_Pagos_Pedidos;


--Vista para ver el inventario actual, con detalles de las recepciones y ventas de cómics:
CREATE VIEW Vista_Inventario_Actual AS
SELECT
    i.comic_id,
    c.titulo,
    SUM(CASE WHEN i.tipo_movimiento = 'recepcion' THEN i.cantidad ELSE 0 END) AS cantidad_recepcion,
    SUM(CASE WHEN i.tipo_movimiento = 'venta' THEN i.cantidad ELSE 0 END) AS cantidad_venta,
    (SUM(CASE WHEN i.tipo_movimiento = 'recepcion' THEN i.cantidad ELSE 0 END) - 
     SUM(CASE WHEN i.tipo_movimiento = 'venta' THEN i.cantidad ELSE 0 END)) AS cantidad_disponible
FROM
    Inventario i
JOIN Comic c ON i.comic_id = c.comic_id
GROUP BY
    i.comic_id, c.titulo;

--Consultar el inventario actual, con detalles de las recepciones y ventas de cómics:
SELECT * FROM Vista_Inventario_Actual;


--Vista para obtener las reseñas de cómics por cliente, con las calificaciones y comentarios:
CREATE VIEW Vista_Resenas AS
SELECT
    r.resena_id,
    c.nombre AS cliente_nombre,
    c.apellido AS cliente_apellido,
    c.email AS cliente_email,
    r.calificacion,
    r.comentario,
    co.titulo AS comic_titulo
FROM
    Resena r
JOIN Cliente c ON r.cliente_id = c.cliente_id
JOIN Comic co ON r.comic_id = co.comic_id;

--Consultar las reseñas de cómics por cliente, con las calificaciones y comentarios:
SELECT * FROM Vista_Resenas;


--Vista para obtener las ofertas activas de cómics con su descuento y fechas de vigencia:
CREATE VIEW Vista_Ofertas_Activas AS
SELECT
    o.oferta_id,
    c.titulo AS comic_titulo,
    o.descuento,
    o.fecha_inicio,
    o.fecha_fin
FROM
    Ofertas o
JOIN Comic c ON o.comic_id = c.comic_id
WHERE
    CURDATE() BETWEEN o.fecha_inicio AND o.fecha_fin;

--Consultar las ofertas activas de cómics con su descuento y fechas de vigencia:
SELECT * FROM Vista_Ofertas_Activas;


--Vista para obtener la información de los envíos, incluyendo el estado y el número de seguimiento:
CREATE VIEW Vista_Envios AS
SELECT
    e.envio_id,
    e.fecha_envio,
    e.estado_envio,
    e.numero_seguimiento,
    t.zona AS zona_envio,
    t.metodo_envio
FROM
    Envio e
JOIN TarifaEnvio t ON e.tarifa_id = t.tarifa_id;

--Consultar la información de los envíos, incluyendo el estado y el número de seguimiento:
SELECT * FROM Vista_Envios;


--Vista para Listar Pedidos Pendientes de Envío
Filtra los pedidos que aún no tienen un registro en la tabla Envio.

CREATE VIEW PedidosPendientesDeEnvio AS
SELECT 
    p.pedido_id,
    p.fecha_pedido,
    p.estado,
    c.nombre AS cliente_nombre,
    c.apellido AS cliente_apellido
FROM Pedido p
JOIN Cliente c ON p.cliente_id = c.cliente_id
LEFT JOIN Envio e ON p.pedido_id = e.pedido_id
WHERE e.pedido_id IS NULL
ORDER BY p.fecha_pedido;

--Para ver los resultados de la vista PedidosPendientesDeEnvio:
SELECT * FROM PedidosPendientesDeEnvio;


--Vista para Consultar los Cómics Más Vendidos
CREATE VIEW ComicsMasVendidos AS
SELECT 
    c.comic_id,
    c.titulo,
    SUM(dp.cantidad) AS total_vendido
FROM DetallePedido dp
JOIN Comic c ON dp.comic_id = c.comic_id
GROUP BY c.comic_id, c.titulo
ORDER BY total_vendido DESC;

--Para ver los resultados de la vista ComicsMasVendidos:
SELECT * FROM ComicsMasVendidos;


