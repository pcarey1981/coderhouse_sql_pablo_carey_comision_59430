![Captura](https://github.com/user-attachments/assets/08d7453c-4bb8-4014-997c-f05ed6dd9ed5)

# Proyecto: Tierra Uno Comics

**Alumno:** Pablo José Carey  
**Curso:** SQL  
**Comisión:** 59430  
**Docente:** Anderson Michel Torres  
**Tutor:** Hugo González  

---

## Introducción

En un mundo lleno de historias increíbles, **Tierra Uno Comics** es un lugar donde los fanáticos encuentran mucho más que cómics: encuentran momentos, personajes y mundos que alimentan su imaginación. Para seguir ofreciendo esta experiencia única, la propuesta de base de datos busca ser el motor detrás de cada venta, pedido y oferta que la tienda ofrece.

Este sistema estará diseñado para que "Tierra Uno Comics" pueda organizar y gestionar cada aspecto clave del negocio: desde el seguimiento de ventas y pedidos hasta la administración de pagos y envíos, con un registro claro de referencias de productos y promociones. Al integrar toda esta información en una base de datos unificada, la tienda podrá enfocarse en lo que mejor sabe hacer: conectar a las personas con las historias que aman, mientras optimiza y simplifica su funcionamiento.

---

## Situación Problema

Actualmente, **Tierra Uno Comics** enfrenta varios desafíos en la gestión de sus ventas y pedidos. Con el aumento de la demanda, se ha vuelto difícil hacer un seguimiento preciso de cada venta, verificar el estado de cada pedido y coordinar los envíos a tiempo. Además, la falta de una estructura unificada para almacenar información sobre productos, precios, referencias y promociones genera inconsistencias en la atención al cliente, afectando la experiencia de los compradores y complicando el proceso de ofrecer descuentos especiales o promociones.

En este contexto, los empleados de "Tierra Uno Comics" pierden tiempo valioso buscando datos dispersos en registros independientes y en sistemas de control no centralizados, lo que incrementa la probabilidad de errores en pedidos y pagos, y dificulta una rápida resolución de problemas.

---

## Solución Propuesta

La implementación de una base de datos optimizada y unificada permitirá a **Tierra Uno Comics** tener un control detallado de cada venta y pedido desde un solo sistema. Con esta estructura, el equipo podrá:

- Realizar un seguimiento en tiempo real de todos los pedidos y su estado (pagado, enviado, pendiente), permitiendo una atención más rápida y precisa.
- Acceder fácilmente a la información del cliente, lo cual mejora la personalización en las ofertas y descuentos, fidelizando a los compradores y fomentando la repetición de compras.
- Administrar inventarios y referencias de productos de manera organizada, reduciendo errores en el control de stock y evitando inconsistencias de precios o productos agotados que puedan frustrar a los clientes.
- Ofrecer promociones y descuentos de manera ágil y sin errores, logrando que el sistema refleje de inmediato las ofertas disponibles, mejorando la experiencia de compra y atrayendo a nuevos clientes.

---

## Diagrama Entidad Relación

**DER - Notación de CHEN**
![DER_tierra_uno_comic_CHEN](https://github.com/user-attachments/assets/271680ab-780a-409c-9c4c-27d92d0ac3f5)

---

**DER - MySQL Workbench**
![DER-Tierra_uno_comic_MySQL_Workbench](https://github.com/user-attachments/assets/4b27796a-ea01-470e-809b-41aec42576d8)

---

## Tablas y Descripción de los Campos - *`Ver estructura_proyecto.sql`*

Tabla *`Autor`*

    autor_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del autor.
    nombre (VARCHAR(100), NOT NULL): Nombre del autor.
    apellido (VARCHAR(100), NOT NULL): Apellido del autor.
    nacionalidad (VARCHAR(100)): Nacionalidad del autor.

Tabla *`Editorial`*

    editorial_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la editorial.
    nombre (VARCHAR(100), NOT NULL): Nombre de la editorial.
    pais (VARCHAR(100)): País de la editorial.
    telefono (VARCHAR(15)): Teléfono de contacto de la editorial.

Tabla *`Género`*

    genero_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del género.
    nombre (VARCHAR(100), NOT NULL): Nombre del género.

Tabla *`Cliente`*


    cliente_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del cliente.
    nombre (VARCHAR(100), NOT NULL): Nombre del cliente.
    apellido (VARCHAR(100), NOT NULL): Apellido del cliente.
    email (VARCHAR(100), NOT NULL, UNIQUE): Correo electrónico del cliente.
    direccion (VARCHAR(255), NOT NULL): Dirección del cliente.
    telefono (VARCHAR(15)): Teléfono de contacto del cliente.

Tabla *`Cómic`*

    comic_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del cómic.
    titulo (VARCHAR(255), NOT NULL): Título del cómic.
    autor_id (INT, NOT NULL, FOREIGN KEY): Relación con el autor del cómic.
    editorial_id (INT, NOT NULL, FOREIGN KEY): Relación con la editorial del cómic.
    genero_id (INT, NOT NULL, FOREIGN KEY): Relación con el género del cómic.
    precio (DECIMAL(10, 2), NOT NULL): Precio de venta del cómic.
    fecha_publicacion (DATE, NOT NULL): Fecha de publicación del cómic.
    descripcion (TEXT): Descripción del cómic.
    stock (INT, NOT NULL, CHECK(stock >= 0)): Cantidad disponible en inventario.

Tabla *`Pedido`*

    pedido_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del pedido.
    cliente_id (INT, NOT NULL, FOREIGN KEY): Relación con el cliente que realizó el pedido.
    fecha_pedido (DATE, NOT NULL): Fecha en que se realizó el pedido.
    estado (VARCHAR(50), NOT NULL): Estado actual del pedido.
    total (DECIMAL(10, 2), NOT NULL): Total de la compra (incluirá el costo de envío)
    tarifa_envio DECIMAL(10, 2) NOT NULL, Especifica el costo de envío

Tabla *`Pago`*

    pago_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del pago.
    pedido_id (INT, NOT NULL, FOREIGN KEY): Relación con el pedido asociado.
    fecha_pago (DATE, NOT NULL): Fecha del pago.
    monto (DECIMAL(10, 2), NOT NULL): Monto del pago (incluirá el costo de envío).
    metodo_pago (VARCHAR(50), NOT NULL): Método de pago utilizado.

Tabla *`Detalle Pedido`*

    detalle_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del detalle de pedido.
    pedido_id (INT, NOT NULL, FOREIGN KEY): Relación con el pedido correspondiente.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
    cantidad (INT, NOT NULL, CHECK(cantidad > 0)): Cantidad de cómics en el pedido.
    precio_unitario (DECIMAL(10, 2), NOT NULL): Precio unitario en el momento del pedido.
    descuento DECIMAL(5, 2) DEFAULT 0, campo para descuento aplicado

Tabla *`Proveedor`*

    proveedor_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del proveedor.
    nombre (VARCHAR(100), NOT NULL): Nombre del proveedor.
    telefono (VARCHAR(15)): Teléfono de contacto del proveedor.
    direccion (VARCHAR(255)): Dirección del proveedor.

Tabla *`Inventario`*

    inventario_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del registro de inventario.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
    proveedor_id (INT, NOT NULL, FOREIGN KEY): Relación con el proveedor.
    fecha_movimiento (DATE, NOT NULL): Fecha en la que se realizó el moviento en el inventario. (Ya sea una recepción o una venta)
    cantidad (INT, NOT NULL, CHECK(cantidad > 0)): Cantidad de cómics en el movimiento. Positiva para recepciones, negativas para ventas.
    tipo_movimiento (ENUM('recepcion', 'venta'), NOT NULL): Indica el tipo de movimiento de inventario. Puede ser "recepcion" (ingreso de stock) o "venta" (egreso de stock).

Tabla *`Reseña`*

    resena_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la reseña.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
    cliente_id (INT, NOT NULL, FOREIGN KEY): Relación con el cliente que realizó la reseña.
    fecha_resena (DATE, NOT NULL): Fecha de la reseña.
    calificacion (INT, CHECK(calificacion BETWEEN 1 AND 5)): Calificación dada al cómic.
    comentario (TEXT): Comentario del cliente sobre el cómic.

Tabla *`Ofertas`*

    oferta_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la oferta.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic en oferta.
    descuento (DECIMAL(5, 2), CHECK(descuento BETWEEN 0 AND 100)): Porcentaje de descuento.
    fecha_inicio (DATE, NOT NULL): Fecha de inicio de la oferta.
    fecha_fin (DATE, NOT NULL): Fecha de fin de la oferta.

Tabla *`Tarifa Envío`*

    tarifa_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la tarifa de envío.
    zona (VARCHAR(100), NOT NULL): Zona geográfica de envío.
    costo (DECIMAL(10, 2), NOT NULL): Costo del envío.
    metodo_envio (VARCHAR(100), NOT NULL): Método de envío.

Tabla *`Envío`* 

    envio_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del envío.
    pedido_id (INT, NOT NULL, FOREIGN KEY): Relación con el pedido asociado.
    tarifa_id (INT, NOT NULL, FOREIGN KEY): Relación con la tarifa de envío.
    fecha_envio (DATE, NOT NULL): Fecha del envío.
    estado_envio (VARCHAR(50), NOT NULL): Estado actual del envío.
    numero_seguimiento (VARCHAR(100)): Número de seguimiento del envío.

## Relaciones y Problemáticas Resueltas

Relación *Cliente-Pedido-Pago* : Un cliente puede realizar múltiples pedidos, y cada pedido puede tener un pago asociado. Esta estructura permite rastrear la actividad de cada cliente y sus pagos.
Relación *Cómic-Inventario-Detalle Pedido* : Permite el control del stock de cómics en la tienda, facilitando la reposición y el control de ventas.
Relación *Cómic-Reseña-Cliente* : Permite que los clientes dejen reseñas y calificaciones de los cómics, mejorando la interacción y aportando valor informativo a futuros compradores.
Relación *Cómic-Ofertas* : Facilita el establecimiento de descuentos y promociones, proporcionando flexibilidad en la estrategia de ventas.
Relación *Pedido-Envío-Tarifa Envío* : Gestiona el envío de los pedidos, incluyendo costos y zonas geográficas, lo que permite una logística de envíos más organizada y detallada.

---


# Inserción de Datos en la Base de Datos `tierra_uno_comics`

Para garantizar una gestión eficiente de la información en la base de datos `tierra_uno_comics`, se llevó a cabo un proceso de inserción de datos mediante consultas SQL `INSERT INTO` utilizando MySQL Workbench. Este enfoque sistemático permitió cargar información en las tablas relacionadas, asegurando la consistencia y disponibilidad de los datos para la administración de ventas, inventarios, pedidos, y más.

## Proceso de Inserción

### 1. Preparación de Datos
Se recopilaron y organizaron datos relevantes, abarcando autores, editoriales, géneros, clientes, cómics, pedidos, pagos, inventarios, reseñas, ofertas, tarifas de envío y envíos. Esta información se estructuró para facilitar su incorporación en la base de datos.

### 2. Estructuración en Consultas SQL
Los datos fueron representados en consultas SQL estándar con el siguiente formato:

```sql
INSERT INTO <nombre_tabla> (<columnas>) VALUES (<valores>);
```
Estas consultas aseguran que los registros se inserten con precisión y rapidez en sus tablas correspondientes.
Ejemplo de Consulta Utilizada

Un ejemplo representativo de las consultas realizadas es el siguiente, correspondiente a la tabla Autor:
```sql
INSERT INTO Autor (nombre, apellido, nacionalidad) VALUES
('Alan', 'Moore', 'Británica'),
('Frank', 'Miller', 'Estadounidense'),
('Neil', 'Gaiman', 'Británica'),
('Grant', 'Morrison', 'Escocesa'),
('Brian', 'K. Vaughan', 'Estadounidense');
```
Este enfoque permitió la inserción eficiente de múltiples registros en un solo paso, optimizando tiempos y reduciendo la posibilidad de errores.

---

# Objetos en la Base de datos
---

# Vistas 

Las vistas en bases de datos son consultas predefinidas que simplifican el acceso a información compleja. Funcionan como tablas virtuales, permitiendo a los usuarios obtener datos combinados de varias tablas sin necesidad de escribir múltiples consultas. Son útiles para organizar, proteger y optimizar las consultas, haciendo el trabajo más eficiente y fácil de gestionar.

## Vistas Aplicadas

- Listado de cómics con sus autores, editoriales y género *Vista: `Vista_Comic_Detalles`*
- Historial de pedidos, con detalles de los cómics comprados, su cantidad, precio y el estado del pedido: *Vista: `Vista_Historial_Pedidos`*
- Pagos realizados por cada pedido, con su método de pago: *Vista: `Vista_Pagos_Pedidos`*
- Inventario actual, con detalles de las recepciones y ventas de cómics: *Vista: `Vista_Inventario_Actual`*
- Reseñas de cómics por cliente, con las calificaciones y comentarios: *Vista: `Vista_Resenas`*
- Ofertas activas de cómics con su descuento y fechas de vigencia: *Vista: `Vista_Ofertas_Activas`*
- Información de los envíos, incluyendo el estado y el número de seguimiento: *Vista: `Vista_Envios`*
- Listado de pedidos pendientes de envío: *Vista: `PedidosPendientesDeEnvio`*
- Cómics más vendidos: *Vista: `ComicsMasVendidos`*

---

## Descripción de las Vistas

## 1. Vista_Comic_Detalles

**Propósito**: Facilita la consulta de los detalles de los cómics sin necesidad de realizar múltiples uniones entre tablas.

**Objetivo**: Permitir a los usuarios obtener rápidamente una lista completa de los cómics junto con información clave sobre los autores, las editoriales y los géneros.

**Tablas que componen la Vista**:
- *`Comic`*: Información básica de los cómics (ID, título, precio, fecha de publicación).
- *`Autor`*: Nombre y apellido del autor.
- *`Editorial`*: Nombre de la editorial.
- *`Género`*: Género del cómic (acción, ciencia ficción, etc.).

**Ejemplo de consulta**:
```sql
SELECT * FROM Vista_Comic_Detalles;
```
---
## 2. Vista_Historial_Pedidos

**Propósito**: 
Facilitar la consulta de los detalles completos de cada pedido sin necesidad de realizar uniones complejas entre varias tablas.

**Objetivo**: 
Ofrecer una visión clara del historial de pedidos, incluyendo detalles de los cómics adquiridos, su cantidad, precio y el estado del pedido.

**Tablas que componen la Vista**:

    Pedido: Información del pedido (ID, fecha, estado, total).
    DetallePedido: Detalles de los ítems en el pedido (ID del cómic, cantidad, precio unitario, descuento).
    Comic: Información sobre los cómics (ID y título).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Historial_Pedidos;
```
---
## 3. Vista_Pagos_Pedidos

Propósito:
Facilitar la consulta de los pagos asociados a cada pedido sin necesidad de realizar uniones complejas entre tablas.

Objetivo:
Mostrar los pagos realizados para cada pedido, incluyendo el método de pago y monto.

Tablas que componen la Vista:

    Pago: Información sobre los pagos (ID, fecha, monto, método de pago).
    Pedido: Información del pedido (ID y total del pedido).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Pagos_Pedidos;
```
---
## 4. Vista_Inventario_Actual

Propósito:
Facilitar la gestión y el seguimiento del inventario.

Objetivo:
Proveer una visión clara del estado del inventario, mostrando la cantidad recibida, vendida y disponible de cada cómic.

Tablas que componen la Vista:

    Inventario: Registros de transacciones de inventario (recepciones y ventas).
    Comic: Información básica sobre los cómics.

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Inventario_Actual;
```
---
## 5. Vista_Resenas

Propósito:
Facilitar el acceso a las reseñas de cómics.

Objetivo:
Mostrar las reseñas de cómics por cliente, incluyendo calificación y comentarios.

Tablas que componen la Vista:

    Resena: Registros de reseñas (ID, cliente_id, comic_id, calificación, comentario).
    Cliente: Información del cliente (ID, nombre, apellido, email).
    Comic: Información sobre los cómics (ID y título).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Resenas;
```
---
## 6. Vista_Ofertas_Activas

Propósito:
Facilitar la consulta de ofertas vigentes de cómics.

Objetivo:
Mostrar las ofertas activas, con detalles del descuento y periodo de vigencia.

Tablas que componen la Vista:

    Ofertas: Información sobre las ofertas (ID, comic_id, descuento, fechas de inicio y fin).
    Comic: Información sobre los cómics (ID y título).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Ofertas_Activas;
```
---
## 7. Vista_Envios

Propósito:
Facilitar la consulta de los envíos sin uniones complejas.

Objetivo:
Proveer información sobre los envíos, incluyendo el estado y número de seguimiento.

Tablas que componen la Vista:

    Envio: Información de los envíos (ID, fecha, estado, número de seguimiento).
    TarifaEnvio: Detalles sobre las tarifas de envío (zona, método de envío).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Envios;
```
---
## 8. PedidosPendientesDeEnvio

Propósito:
Gestionar los pedidos pendientes de envío.

Objetivo:
Mostrar los pedidos que aún no han sido enviados.

Tablas que componen la Vista:

    Pedido: Información sobre los pedidos (ID, fecha, estado).
    Cliente: Información del cliente (ID, nombre, apellido).
    Envio: Información sobre los envíos (ID y estado).

Ejemplo de consulta:
```sql
SELECT * FROM PedidosPendientesDeEnvio;
```
---
## 9. ComicsMasVendidos

Propósito:
Facilitar el análisis de los cómics más vendidos.

Objetivo:
Mostrar los cómics con mayor volumen de ventas.

Tablas que componen la Vista:

    DetallePedido: Detalles de cada transacción (comic_id, cantidad vendida).
    Comic: Información sobre los cómics (ID, título).

Ejemplo de consulta:
```sql
SELECT * FROM ComicsMasVendidos;
```

---

# Triggers

Un **trigger** (disparador) es un objeto de base de datos que se ejecuta automáticamente en respuesta a eventos específicos, como inserciones, actualizaciones o eliminaciones en una tabla. Los triggers permiten automatizar procesos, garantizar la integridad de los datos y realizar tareas adicionales sin intervención manual, como auditorías, cálculos o notificaciones.

Son útiles para mantener consistencia en los datos y aplicar reglas de negocio directamente en la base de datos, asegurando que ciertas acciones ocurran siempre que se cumplan determinadas condiciones.

## Triggers Aplicados

- **Actualizar Stock en la Tabla Comic al Registrar un Movimiento en el Inventario**: Ajusta automáticamente el stock del cómic al insertar un registro en la tabla Inventario. *(Trigger: `actualizar_stock_comic`)*
- **Validar Stock Disponible Antes de Registrar una Venta**: Evita que se registre un movimiento de venta si no hay suficiente stock disponible. *(Trigger: `validar_stock_comic`)*
- **Calcular Total del Pedido en la Tabla Pedido**: Calcula automáticamente el total del pedido al insertar un registro en la tabla DetallePedido. *(Trigger: `calcular_total_pedido`)*
- **Aplicar Descuento de Ofertas Automáticamente en DetallePedido**: Ajusta automáticamente el descuento al agregar un cómic en un pedido si hay una oferta vigente. *(Trigger: `aplicar_descuento_oferta`)*
- **Actualizar Estado de Pedido al Confirmar Pago**: Actualiza el estado de un pedido a "Pagado" después de registrar un pago. *(Trigger: `actualizar_estado_pedido`)*

---

## 1. actualizar_stock_comic

### Propósito:
Asegurar que los datos del inventario estén siempre consistentes con las operaciones realizadas.

### Objetivo:
Automatizar la actualización del campo `stock` en la tabla `Comic` según el tipo de movimiento registrado en `Inventario`. Si el movimiento es una recepción, el stock aumenta; si es una venta, el stock disminuye.

### Tablas que Interactúan:
- **Inventario**: Almacena los movimientos relacionados con los cómics, como recepciones y ventas.
- **Comic**: Contiene el campo `stock`, que se actualiza según el movimiento registrado.

### Ejemplos:

#### Ej.1 - Registrar una Recepción para un Cómic Existente

```sql
-- Registrar una recepción de 20 unidades para "Watchmen"
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (1, 1, CURDATE(), 20, 'recepcion');

-- Verificar el stock actualizado del cómic
SELECT * FROM Comic WHERE comic_id = 1;
```
Resultado esperado: El stock del cómic "Watchmen" aumenta de 50 a 70.
--
Ej.2 - Registrar una Venta de un Cómic Existente
```sql
-- Registrar una venta de 10 unidades de "The Dark Knight Returns"
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (2, NULL, CURDATE(), -10, 'venta');

-- Verificar el stock actualizado del cómic
SELECT * FROM Comic WHERE comic_id = 2;
```
Resultado esperado: El stock del cómic "The Dark Knight Returns" disminuye de 30 a 20.
--

Ej.3 - Intentar Registrar una Venta Mayor al Stock Disponible
```sql
-- Intentar registrar una venta de 50 unidades para "Sandman"
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (3, NULL, CURDATE(), -50, 'venta');
```
Resultado esperado: La operación falla debido a que el trigger no permitirá que el stock del cómic sea negativo.


2. validar_stock_comic

Propósito:

-Garantizar la integridad de los datos al evitar movimientos de ventas que excedan el stock disponible.
Objetivo:

-Validar que el stock de un cómic sea suficiente antes de registrar una venta en la tabla Inventario. Detener cualquier inserción que resulte en stock negativo.

Tablas que Interactúan:

    Inventario: Registra los movimientos de inventario, ya sea una recepción o una venta.
    Comic: Almacena los datos del cómic, incluido el stock actual.

Ejemplos:

Ej.1 - Venta con Stock Suficiente
```sql
-- Intentar registrar una venta válida
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (1, NULL, CURDATE(), -10, 'venta');

-- Verificar que el movimiento se registre y que el stock se actualice correctamente
SELECT comic_id, stock FROM Comic WHERE comic_id = 1;
```
Resultado esperado: El stock del cómic "Watchmen" disminuye de 50 a 40.


Ej.2 - Venta con Stock Insuficiente
```sql
-- Intentar registrar una venta inválida
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (2, NULL, CURDATE(), -60, 'venta');

Resultado esperado: El trigger evita el registro del movimiento y genera el error: Stock insuficiente para realizar la venta.
Ej.3 - Venta para un Cómic que No Existe

-- Intentar registrar una venta para un cómic inexistente
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (999, NULL, CURDATE(), -10, 'venta');

Resultado esperado: La operación falla con un error de clave foránea, ya que el comic_id = 999 no existe en la tabla Comic.
3. calcular_total_pedido
Propósito:

Automatizar el cálculo del total del pedido al agregar productos a su detalle.
Objetivo:

Mantener la consistencia y precisión en los registros de la tabla Pedido.
Tablas que Interactúan:

    DetallePedido: Almacena los detalles de los productos (cómics) incluidos en un pedido.
    Pedido: Registra la información general del pedido, incluyendo el total calculado por este trigger.

Ejemplos:
Ej.1 - Insertar un Nuevo Detalle de Pedido sin Descuento

-- Insertar un nuevo detalle en el pedido con ID 1
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) 
VALUES (1, 1, 1, 1500.00, 0);

Resultado esperado: El total del pedido se recalcula a 1650.00, incluyendo la tarifa de envío.
Ej.2 - Insertar un Nuevo Detalle de Pedido con Descuento

-- Insertar un nuevo detalle en el pedido con ID 3
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) 
VALUES (3, 5, 1, 1000.00, 50);

Resultado esperado: El total del pedido se recalcula a 750.00, aplicando el descuento.
Ej.3 - Insertar Detalles para un Nuevo Pedido

-- Insertar un detalle en un nuevo pedido con ID 5
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) 
VALUES (5, 4, 1, 1200.00, 0);

Resultado esperado: El total del pedido se recalcula a 1300.00.
4. aplicar_descuento_oferta
Propósito:

Automatizar la aplicación de descuentos cuando un cómic tiene una oferta vigente.
Objetivo:

Aplicar descuentos de manera eficiente cuando un cómic con una oferta activa es agregado a un pedido.
Tablas que Interactúan:

    DetallePedido: Almacena los detalles de los productos dentro de cada pedido.
    Ofertas: Contiene información sobre las ofertas vigentes.

Ejemplos:
Ej.1 - Agregar un Cómic con Oferta Vigente

-- Agregar un cómic con oferta vigente (10% de descuento)
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento)
VALUES (6, 1, 1, 1500.00, 0);

Resultado esperado: El descuento del 10% se aplica automáticamente.
Ej.2 - Agregar un Cómic con Oferta Vigente (15% de descuento)

-- Agregar un cómic con oferta vigente (15% de descuento)
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento)
VALUES (7, 2, 2, 1800.00, 0);

Resultado esperado: El descuento del 15% se aplica automáticamente.
Ej.3 - Agregar un Cómic con Oferta No Activa

-- Agregar un cómic con oferta no activa
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento)
VALUES (8, 3, 1, 2000.00, 0);

Resultado esperado: El descuento permanece en 0.00, ya que la oferta no está activa.







































# ¡Muchas gracias por haber llegado hasta acá! 



![1f44b-1f3fb](https://github.com/user-attachments/assets/fd0981ee-c142-41dd-a632-096c378880a9)


