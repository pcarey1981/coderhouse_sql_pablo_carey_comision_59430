![DER_tierra_uno_comic](https://github.com/user-attachments/assets/f3df4661-9c2c-4509-bf4e-77c9b303c4b1)
![DER-Tierra_uno_comic](https://github.com/user-attachments/assets/093f18c2-61e7-4af3-860c-8a601e5b8ff5)

# Proyecto "Tierra-uno-comics"

El siguiente esquema de base de datos está diseñado para gestionar toda la información de una tienda de cómics.
Permite organizar los cómics, clientes, pedidos, pagos, proveedores, inventario, reseñas y envíos, cubriendo desde la compra
hasta el seguimiento de cada pedido. Además, ayuda a mantener el stock en orden y facilita el manejo de cada aspecto del negocio.

## Tablas y Descripción de Campos

### Tabla Autor
- **autor_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del autor.
- **nombre** (VARCHAR(100), NOT NULL): Nombre del autor.
- **apellido** (VARCHAR(100), NOT NULL): Apellido del autor.
- **nacionalidad** (VARCHAR(100)): Nacionalidad del autor.

### Tabla Editorial
- **editorial_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la editorial.
- **nombre** (VARCHAR(100), NOT NULL): Nombre de la editorial.
- **pais** (VARCHAR(100)): País de la editorial.
- **telefono** (VARCHAR(15)): Teléfono de contacto de la editorial.

### Tabla Género
- **genero_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del género.
- **nombre** (VARCHAR(100), NOT NULL): Nombre del género.

### Tabla Cliente
- **cliente_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del cliente.
- **nombre** (VARCHAR(100), NOT NULL): Nombre del cliente.
- **apellido** (VARCHAR(100), NOT NULL): Apellido del cliente.
- **email** (VARCHAR(100), NOT NULL, UNIQUE): Correo electrónico del cliente.
- **direccion** (VARCHAR(255), NOT NULL): Dirección del cliente.
- **telefono** (VARCHAR(15)): Teléfono de contacto del cliente.

### Tabla Cómic
- **comic_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del cómic.
- **titulo** (VARCHAR(255), NOT NULL): Título del cómic.
- **autor_id** (INT, NOT NULL, FOREIGN KEY): Relación con el autor del cómic.
- **editorial_id** (INT, NOT NULL, FOREIGN KEY): Relación con la editorial del cómic.
- **genero_id** (INT, NOT NULL, FOREIGN KEY): Relación con el género del cómic.
- **precio** (DECIMAL(10, 2), NOT NULL): Precio de venta del cómic.
- **fecha_publicacion** (DATE, NOT NULL): Fecha de publicación del cómic.
- **descripcion** (TEXT): Descripción del cómic.
- **stock** (INT, NOT NULL, CHECK(stock >= 0)): Cantidad disponible en inventario.

### Tabla Pedido
- **pedido_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del pedido.
- **cliente_id** (INT, NOT NULL, FOREIGN KEY): Relación con el cliente que realizó el pedido.
- **fecha_pedido** (DATE, NOT NULL): Fecha en que se realizó el pedido.
- **estado** (VARCHAR(50), NOT NULL): Estado actual del pedido.
- **total** (DECIMAL(10, 2), NOT NULL): Total de la compra.

### Tabla Pago
- **pago_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del pago.
- **pedido_id** (INT, NOT NULL, FOREIGN KEY): Relación con el pedido asociado.
- **fecha_pago** (DATE, NOT NULL): Fecha del pago.
- **monto** (DECIMAL(10, 2), NOT NULL): Monto del pago.
- **metodo_pago** (VARCHAR(50), NOT NULL): Método de pago utilizado.

### Tabla Detalle Pedido
- **detalle_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del detalle de pedido.
- **pedido_id** (INT, NOT NULL, FOREIGN KEY): Relación con el pedido correspondiente.
- **comic_id** (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
- **cantidad** (INT, NOT NULL, CHECK(cantidad > 0)): Cantidad de cómics en el pedido.
- **precio_unitario** (DECIMAL(10, 2), NOT NULL): Precio unitario en el momento del pedido.

### Tabla Proveedor
- **proveedor_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del proveedor.
- **nombre** (VARCHAR(100), NOT NULL): Nombre del proveedor.
- **telefono** (VARCHAR(15)): Teléfono de contacto del proveedor.
- **direccion** (VARCHAR(255)): Dirección del proveedor.

### Tabla Inventario
- **inventario_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del registro de inventario.
- **comic_id** (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
- **proveedor_id** (INT, NOT NULL, FOREIGN KEY): Relación con el proveedor.
- **fecha_recepcion** (DATE, NOT NULL): Fecha de recepción del cómic en inventario.
- **cantidad** (INT, NOT NULL, CHECK(cantidad > 0)): Cantidad de cómics recibidos.

### Tabla Reseña
- **resena_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la reseña.
- **comic_id** (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
- **cliente_id** (INT, NOT NULL, FOREIGN KEY): Relación con el cliente que realizó la reseña.
- **fecha_resena** (DATE, NOT NULL): Fecha de la reseña.
- **calificacion** (INT, CHECK(calificacion BETWEEN 1 AND 5)): Calificación dada al cómic.
- **comentario** (TEXT): Comentario del cliente sobre el cómic.

### Tabla Ofertas
- **oferta_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la oferta.
- **comic_id** (INT, NOT NULL, FOREIGN KEY): Relación con el cómic en oferta.
- **descuento** (DECIMAL(5, 2), CHECK(descuento BETWEEN 0 AND 100)): Porcentaje de descuento.
- **fecha_inicio** (DATE, NOT NULL): Fecha de inicio de la oferta.
- **fecha_fin** (DATE, NOT NULL): Fecha de fin de la oferta.

### Tabla Tarifa Envío
- **tarifa_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la tarifa de envío.
- **zona** (VARCHAR(100), NOT NULL): Zona geográfica de envío.
- **costo** (DECIMAL(10, 2), NOT NULL): Costo del envío.
- **metodo_envio** (VARCHAR(100), NOT NULL): Método de envío.

### Tabla Envío
- **envio_id** (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del envío.
- **pedido_id** (INT, NOT NULL, FOREIGN KEY): Relación con el pedido asociado.
- **tarifa_id** (INT, NOT NULL, FOREIGN KEY): Relación con la tarifa de envío.
- **fecha_envio** (DATE, NOT NULL): Fecha del envío.
- **estado_envio** (VARCHAR(50), NOT NULL): Estado actual del envío.
- **numero_seguimiento** (VARCHAR(100)): Número de seguimiento del envío.

## Relaciones y Problemáticas Resueltas

1. **Relación Cliente-Pedido-Pago**: Un cliente puede realizar múltiples pedidos, y cada pedido puede tener un pago asociado. Esta estructura permite rastrear la actividad de cada cliente y sus pagos.
2. **Relación Cómic-Inventario-Detalle Pedido**: Permite el control del stock de cómics en la tienda, facilitando la reposición y el control de ventas.
3. **Relación Cómic-Reseña-Cliente**: Permite que los clientes dejen reseñas y calificaciones de los cómics, mejorando la interacción y aportando valor informativo a futuros compradores.
4. **Relación Cómic-Ofertas**: Facilita el establecimiento de descuentos y promociones temporales, proporcionando flexibilidad en la estrategia de ventas.
5. **Relación Pedido-Envío-Tarifa Envío**: Gestiona el envío de los pedidos, incluyendo costos y zonas geográficas, lo que permite una logística de envíos más organizada y detallada.

Este modelo permite administrar de manera completa una tienda de cómics. Facilita el seguimiento de los productos, la gestión del inventario, y la interacción con los clientes, 
logrando que las ventas y los envíos se lleven a cabo de forma sencilla y organizada.

Muchas gracias.
