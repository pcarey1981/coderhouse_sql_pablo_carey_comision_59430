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

- *`Relación Cliente-Pedido-Pago`*: Un cliente puede realizar múltiples pedidos, y cada pedido puede tener un pago asociado. Esta estructura permite rastrear la actividad de cada cliente y sus pagos.
- *`Relación Cómic-Inventario-Detalle_Pedido`*: Permite el control del stock de cómics en la tienda, facilitando la reposición y el control de ventas.
- *`Relación Cómic-Reseña-Cliente`*: Permite que los clientes dejen reseñas y calificaciones de los cómics, mejorando la interacción y aportando valor informativo a futuros compradores.
- *`Relación Cómic-Ofertas`*: Facilita el establecimiento de descuentos y promociones, proporcionando flexibilidad en la estrategia de ventas.
- *`Relación Pedido-Envío-Tarifa Envío`*: Gestiona el envío de los pedidos, incluyendo costos y zonas geográficas, lo que permite una logística de envíos más organizada y detallada.
    
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

Un ejemplo representativo de las consultas realizadas es el siguiente, correspondiente a la tabla `Autor`:
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

- *`Vista_Comic_Detalles`*: Listado de cómics con sus autores, editoriales y género.
- *`Vista_Historial_Pedidos`*: Historial de pedidos, con detalles de los cómics comprados, su cantidad, precio y el estado del pedido. 
- *`Vista_Pagos_Pedidos`*: Pagos realizados por cada pedido, con su método de pago.
- *`Vista_Inventario_Actual`*: Inventario actual, con detalles de las recepciones y ventas de cómics.
- *`Vista_Resenas`*: Reseñas de cómics por cliente, con las calificaciones y comentarios. 
- *`Vista_Ofertas_Activas`*: Ofertas activas de cómics con su descuento y fechas de vigencia.
- *`Vista_Envios`*: Información de los envíos, incluyendo el estado y el número de seguimiento. 
- *`PedidosPendientesDeEnvio`*: Listado de pedidos pendientes de envío. 
- *`ComicsMasVendidos`*: Cómics más vendidos. 

---

## Descripción de las Vistas

## 1. Vista_Comic_Detalles

*`Propósito`*: Facilita la consulta de los detalles de los cómics sin necesidad de realizar múltiples uniones entre tablas.

*`Objetivo`*: Permitir a los usuarios obtener rápidamente una lista completa de los cómics junto con información clave sobre los autores, las editoriales y los géneros.

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

*`Propósito`*: Facilitar la consulta de los detalles completos de cada pedido sin necesidad de realizar uniones complejas entre varias tablas.

*`Objetivo`*: Ofrecer una visión clara del historial de pedidos, incluyendo detalles de los cómics adquiridos, su cantidad, precio y el estado del pedido.

**Tablas que componen la Vista**:

- *`Pedido`*: Información del pedido (ID, fecha, estado, total).
- *`DetallePedido`*: Detalles de los ítems en el pedido (ID del cómic, cantidad, precio unitario, descuento).
- *`Comic`*: Información sobre los cómics (ID y título).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Historial_Pedidos;
```
---
## 3. Vista_Pagos_Pedidos

*`Propósito`*: Facilitar la consulta de los pagos asociados a cada pedido sin necesidad de realizar uniones complejas entre tablas.

*`Objetivo`*: Mostrar los pagos realizados para cada pedido, incluyendo el método de pago y monto.

**Tablas que componen la Vista**:

- *`Pago`*: Información sobre los pagos (ID, fecha, monto, método de pago).
- *`Pedido`*: Información del pedido (ID y total del pedido).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Pagos_Pedidos;
```
---
## 4. Vista_Inventario_Actual

*`Propósito`*: Facilitar la gestión y el seguimiento del inventario.

*`Objetivo`*: Proveer una visión clara del estado del inventario, mostrando la cantidad recibida, vendida y disponible de cada cómic.

**Tablas que componen la Vista**:

- *`Inventario`*: Registros de transacciones de inventario (recepciones y ventas).
- *`Comic`*: Información básica sobre los cómics.

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Inventario_Actual;
```
---
## 5. Vista_Resenas

*`Propósito`*: Facilitar el acceso a las reseñas de cómics.

*`Objetivo`*: Mostrar las reseñas de cómics por cliente, incluyendo calificación y comentarios.

**Tablas que componen la Vista**:

- *`Resena`*: Registros de reseñas (ID, cliente_id, comic_id, calificación, comentario).
- *`Cliente`*: Información del cliente (ID, nombre, apellido, email).
- *`Comic`*: Información sobre los cómics (ID y título).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Resenas;
```
---
## 6. Vista_Ofertas_Activas

*`Propósito`*: Facilitar la consulta de ofertas vigentes de cómics.

*`Objetivo`*: Mostrar las ofertas activas, con detalles del descuento y periodo de vigencia.

**Tablas que componen la Vista**:

- *`Ofertas`*: Información sobre las ofertas (ID, comic_id, descuento, fechas de inicio y fin).
- *`Comic`*: Información sobre los cómics (ID y título).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Ofertas_Activas;
```
---
## 7. Vista_Envios

*`Propósito`*: Facilitar la consulta de los envíos sin uniones complejas.

*`Objetivo`*: Proveer información sobre los envíos, incluyendo el estado y número de seguimiento.

**Tablas que componen la Vista**:

- *`Envio`*: Información de los envíos (ID, fecha, estado, número de seguimiento).
- *`TarifaEnvio`*: Detalles sobre las tarifas de envío (zona, método de envío).

Ejemplo de consulta:
```sql
SELECT * FROM Vista_Envios;
```
---
## 8. PedidosPendientesDeEnvio

*`Propósito`*: Gestionar los pedidos pendientes de envío.

*`Objetivo`*: Mostrar los pedidos que aún no han sido enviados.

**Tablas que componen la Vista**:

- *`Pedido`*: Información sobre los pedidos (ID, fecha, estado).
- *`Cliente`*: Información del cliente (ID, nombre, apellido).
    Envio: Información sobre los envíos (ID y estado).

Ejemplo de consulta:
```sql
SELECT * FROM PedidosPendientesDeEnvio;
```
---
## 9. ComicsMasVendidos

*`Propósito`*: Facilitar el análisis de los cómics más vendidos.

*`Objetivo`*: Mostrar los cómics con mayor volumen de ventas.

**Tablas que componen la Vista**:

- *`DetallePedido`*: Detalles de cada transacción (comic_id, cantidad vendida).
- *`Comic`*: Información sobre los cómics (ID, título).

Ejemplo de consulta:
```sql
SELECT * FROM ComicsMasVendidos;
```

---

# Triggers

Un **trigger** (disparador) es un objeto de base de datos que se ejecuta automáticamente en respuesta a eventos específicos, como inserciones, actualizaciones o eliminaciones en una tabla. Los triggers permiten automatizar procesos, garantizar la integridad de los datos y realizar tareas adicionales sin intervención manual, como auditorías, cálculos o notificaciones.

Son útiles para mantener consistencia en los datos y aplicar reglas de negocio directamente en la base de datos, asegurando que ciertas acciones ocurran siempre que se cumplan determinadas condiciones.

## Triggers Aplicados

- *`actualizar_stock_comic`*: Ajusta automáticamente el stock del cómic al insertar un registro en la tabla Inventario. 
- *`validar_stock_comic`*: Evita que se registre un movimiento de venta si no hay suficiente stock disponible. 
- *`calcular_total_pedido`*: Calcula automáticamente el total del pedido al insertar un registro en la tabla DetallePedido.
- *`aplicar_descuento_oferta`*: Ajusta automáticamente el descuento al agregar un cómic en un pedido si hay una oferta vigente. 
- *`actualizar_estado_pedido`*: Actualiza el estado de un pedido a "Pagado" después de registrar un pago. 

---

## 1. actualizar_stock_comic

*`Propósito`*: Asegurar que los datos del inventario estén siempre consistentes con las operaciones realizadas.

*`Objetivo`*: Automatizar la actualización del campo stock en la tabla Comic según el tipo de movimiento registrado en Inventario. Si el movimiento es una recepción, el stock aumenta; si es una venta, el stock disminuye. Esto elimina la necesidad de realizar actualizaciones manuales, minimizando errores y ahorrando tiempo en la gestión del inventario.

**Tablas que interactuan con el trigger**:

- *`Inventario`*: Esta tabla almacena los movimientos relacionados con los cómics, como recepciones y ventas. Al insertar un nuevo registro en esta tabla, el trigger se activa.
- *`Comic`*: Contiene el campo stock que representa la cantidad disponible de cada cómic. El trigger actualiza este campo según el movimiento registrado.

### Ejemplos:

#### Ej.1 - Registrar una Recepción para un Cómic Existente
Añadimos más unidades al stock del cómic "Watchmen" (comic_id = 1).
```sql
-- Registrar una recepción de 20 unidades para "Watchmen"
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (1, 1, CURDATE(), 20, 'recepcion');

-- Verificar el stock actualizado del cómic
SELECT * FROM Comic WHERE comic_id = 1;
```
#### Resultado esperado: El stock del cómic "Watchmen" aumenta de 50 a 70.
---
#### Ej.2 - Registrar una Venta de un Cómic Existente
Restamos unidades al stock del cómic "The Dark Knight Returns" (comic_id = 2) por una venta.
```sql
-- Registrar una venta de 10 unidades de "The Dark Knight Returns"
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (2, NULL, CURDATE(), -10, 'venta');

-- Verificar el stock actualizado del cómic
SELECT * FROM Comic WHERE comic_id = 2;
```
#### Resultado esperado: El stock del cómic "The Dark Knight Returns" disminuye de 30 a 20.
---
#### Ej.3 - Intentar Registrar una Venta Mayor al Stock Disponible
Probamos un caso en el que intentamos vender más unidades de las disponibles para "Sandman" (comic_id = 3).
```sql
-- Intentar registrar una venta de 50 unidades para "Sandman"
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (3, NULL, CURDATE(), -50, 'venta');
```
Resultado esperado: La operación falla debido a que el trigger no permitirá que el stock del cómic sea negativo.

---

## 2 - validar_stock_comic

*`Propósito`*: Prevenir errores operativos o pérdidas de información al intentar registrar ventas imposibles de cumplir.

*`Objetivo`*: Validar que el stock de un cómic sea suficiente antes de registrar una venta en la tabla Inventario.

**Tablas que interactuan con el trigger**:

- *`Inventario`*: Registra los movimientos de inventario, ya sea una recepción o una venta. Contiene la cantidad y tipo de movimiento (recepcion o venta).
- *`Comic`*: Almacena los datos básicos del cómic, incluido el stock actual, que se consulta para verificar si la venta es posible.

### Ejemplos:

#### Ej.1 - Venta con Stock Suficiente
Registrar una venta de 10 unidades para "Watchmen" (comic_id = 1), que tiene un stock actual de 50.
```sql
-- Intentar registrar una venta válida
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (1, NULL, CURDATE(), -10, 'venta');

-- Verificar que el movimiento se registre y que el stock se actualice correctamente
SELECT comic_id, stock FROM Comic WHERE comic_id = 1;
```
#### Resultado esperado: El movimiento se registra, y el stock del cómic "Watchmen" disminuye de 50 a 40.
---
#### Ej.2 - Venta con Stock Insuficiente
Intentar registrar una venta de 60 unidades para "The Dark Knight Returns" (comic_id = 2), que tiene un stock actual de 30.
```sql
-- Intentar registrar una venta inválida
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (2, NULL, CURDATE(), -60, 'venta');
```
#### Resultado esperado: El trigger evita el registro del movimiento y genera el siguiente error: Stock insuficiente para realizar la venta.
---
#### Ej.3 - Venta para un Cómic que No Existe
Intentar registrar una venta para un comic_id inexistente, como 999.
```sql
-- Intentar registrar una venta para un cómic inexistente
INSERT INTO Inventario (comic_id, proveedor_id, fecha_movimiento, cantidad, tipo_movimiento)
VALUES (999, NULL, CURDATE(), -10, 'venta');
```
#### Resultado esperado: La operación falla con un error de clave foránea, ya que el comic_id = 999 no existe en la tabla Comic.

---

## 3. calcular_total_pedido

*`Propósito`*: Automatizar el cálculo del total del pedido al agregar productos a su detalle. Garantizar que la tabla Pedido refleje siempre el valor actualizado del pedido, incluyendo el impacto de los descuentos y la tarifa de envío.

*`Objetivo`*: Simplificar la gestión de los totales de los pedidos evitando cálculos manuales. Mantener la consistencia y precisión en los registros de la tabla Pedido.

**Tablas que interactuan con el trigger**:

- *`DetallePedido`*: Almacena los detalles de los productos (cómics) incluidos en un pedido, con sus precios, cantidades y posibles descuentos.
- *`Pedido`*: Registra la información general del pedido, incluyendo el total calculado en tiempo real por este trigger.

### Ejemplos:

#### Ej.1 - Insertar un nuevo detalle de pedido sin descuento
•	Acción: Insertar un nuevo detalle en el pedido con ID 1, para el cómic con ID 1, con una cantidad de 1, precio unitario de 1500.00 y sin descuento (0%).
•	Esperado: El total del pedido debe ser recalculado y reflejar la suma de los productos más la tarifa de envío.
```sql
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) 
VALUES (1, 1, 1, 1500.00, 0);
```
#### Cálculo del total:
#### •	Total del pedido = (1500 * 1) - (1500 * 1 * 0%) + Tarifa de Envío
#### •	Total del pedido = 1500 + 150 = 1650.00 (Este valor ya está insertado en la tabla Pedido).
---
#### Ej.2 - Insertar un nuevo detalle de pedido con descuento
•	Acción: Insertar un nuevo detalle en el pedido con ID 3, para el cómic con ID 5, con una cantidad de 1, precio unitario de 1000.00 y un descuento del 50%.
•	Esperado: El total del pedido debe recalcularse correctamente, aplicando el descuento.
```sql
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) 
VALUES (3, 5, 1, 1000.00, 50);
```
#### Cálculo del total:
#### •	Total del pedido = (1000 * 1) - (1000 * 1 * 50%) = 1000 - 500 = 500
#### •	Total del pedido con tarifa de envío = 500 + 250 (Tarifa de Envío) = 750.00 (Este valor se debe actualizar en la tabla Pedido).
---
#### Ej.3 - Insertar detalles para un nuevo pedido
•	Acción: Insertar un detalle en un nuevo pedido con ID 5, para el cómic con ID 4, con una cantidad de 1, precio unitario de 1200.00 y sin descuento (0%).
•	Esperado: El total del pedido debe recalcularse correctamente.
```sql
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento) 
VALUES (5, 4, 1, 1200.00, 0);
```
#### Cálculo del total: 
#### Total del pedido = (1200 * 1) - (1200 * 1 * 0%) + Tarifa de Envío = 1200 + 100 = 1300.00 (El total debe ser actualizado en la tabla Pedido para el pedido con ID 5).

---

## 4. aplicar_descuento_oferta

*`Propósito`*: Automatizar la aplicación de descuentos cuando un cómic tiene una oferta vigente. Esto evita que el descuento se aplique manualmente y garantiza que el pedido refleje siempre los descuentos actuales.

*`Objetivo`*: Asegurarse de que los descuentos sean aplicados de manera precisa y eficiente cuando un cómic con una oferta activa es agregado a un pedido. Si no hay oferta activa para el cómic, el descuento será 0, es decir, no se aplicará ningún descuento.

**Tablas que interactuan con el trigger**:

- *`DetallePedido`*: Almacena los detalles de los productos dentro de cada pedido, incluyendo la cantidad, precio unitario y el descuento aplicado.
- *`Ofertas`*: Contiene información sobre las ofertas vigentes, específicamente el descuento y las fechas de inicio y fin de la oferta para cada cómic.

### Ejemplos:

#### Ej.1 - Agregar un cómic con oferta vigente
Acción: Insertar un cómic que tiene una oferta activa en el momento de la inserción.
•	Cómic: Watchmen (comic_id 1)
•	Oferta vigente: 10% de descuento, válida entre '2024-11-01' y '2024-11-10'.
```sql
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento)
VALUES (6, 1, 1, 1500.00, 0);  -- El descuento se aplicará automáticamente debido a la oferta activa
```
#### Resultado esperado: El descuento del 10% se aplicará automáticamente, actualizando el campo descuento a 10.00.
---
#### Ej.2 - Agregar un cómic con oferta vigente
Acción: Insertar un cómic con una oferta activa que da un 15% de descuento.
•	Cómic: The Dark Knight Returns (comic_id 2)
•	Oferta vigente: 15% de descuento, válida entre '2024-11-05' y '2024-11-15'.
```sql
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento)
VALUES (7, 2, 2, 1800.00, 0);  -- El descuento del 15% se aplicará automáticamente
```
#### Resultado esperado: El descuento del 15% se aplicará, actualizando el campo descuento a 15.00.
---
#### Ej.3 - Agregar un cómic con una oferta que no está activa
Acción: Insertar un cómic con una oferta que no está vigente aún.
•	Cómic: Sandman (comic_id 3)
•	Oferta vigente: 20% de descuento, válida entre '2024-11-10' y '2024-11-20'.
•	Fecha de inserción: '2024-11-09' (antes de la fecha de inicio de la oferta).
```sql
INSERT INTO DetallePedido (pedido_id, comic_id, cantidad, precio_unitario, descuento)
VALUES (8, 3, 1, 2000.00, 0);  -- No se aplicará descuento ya que la oferta no está activa
```
#### Resultado esperado: El campo descuento permanecerá en 0.00, ya que la oferta no está activa en la fecha de la inserción.

---

## 5 - actualizar_estado_pedido

*`Propósito`*: Actualizar automáticamente el estado del pedido a "Pagado" cuando se registra un pago en la base de datos. Esto asegura que, después de recibir un pago, el sistema mantenga la consistencia del estado del pedido sin necesidad de intervención manual, garantizando que los pedidos con pago confirmado se identifiquen rápidamente como "Pagados".

*`Objetivo`*: Automatizar el cambio de estado de los pedidos una vez que se haya registrado un pago. Esto ayuda a:
#### • Mantener la integridad de los datos: El estado del pedido se actualiza automáticamente para reflejar su situación actual después del pago.
#### • Mejorar la eficiencia operativa: Se evita la necesidad de actualizar manualmente el estado de cada pedido.
#### • Facilitar la gestión de pedidos: Permite a los usuarios ver rápidamente qué pedidos han sido pagados, sin la necesidad de realizar consultas adicionales.

**Tablas que interactuan con el trigger**:

- *`Pago`*: Esta tabla almacena los registros de pagos realizados para los pedidos. El trigger se activa cuando se inserta un nuevo pago en esta tabla.
- *`Pedido`*: El trigger actualizará el estado del pedido a "Pagado" en esta tabla cuando se registre un pago en la tabla Pago.

### Ejemplo:

#### Insertar un pago y verificar la actualización del estado del pedido

####  P.1 - Estado inicial de la tabla Pedido
Antes de insertar un pago, los pedidos tienen diferentes estados, como "Completado", "Pendiente", "Enviado", etc. Verificamos el estado actual de la tabla Pedido.
```sql
-- Verificando los registros actuales en la tabla Pedido
SELECT * FROM Pedido;
```
#### Resultado:

![imagen](https://github.com/user-attachments/assets/245f34bb-42fb-4ca1-9115-17fa4d8d0ed9)

#### P.2 - Insertar un pago para un pedido y activar el trigger
Ahora insertamos un pago para el pedido_id 2. Según el trigger, esto debe actualizar el estado de este pedido a "Pagado".
```sql
-- Insertar un pago para el pedido con id 2
INSERT INTO Pago (pedido_id, fecha_pago, monto, metodo_pago) 
VALUES (2, '2024-11-02', 1850.00, 'Transferencia Bancaria');
```

#### P.3 - Verificar la tabla Pedido después de insertar el pago
Verificamos si el estado del pedido 2 ha sido actualizado a "Pagado".
```sql
-- Verificando el estado de la tabla Pedido después del pago
SELECT * FROM Pedido;
```
#### Resultado:

![imagen](https://github.com/user-attachments/assets/f3376710-7b05-4667-804b-d438a1caa8f3)

---

# Funciones

Las funciones definidas por el usuario se utilizan para realizar operaciones específicas dentro de una base de datos. Estas funciones permiten encapsular lógica compleja en un solo bloque, lo que facilita la reutilización del código y la simplificación de consultas.

## Funciones aplicadas

- *`CalcularStockTotal`*: Función para Calcular Stock Total de un Cómic
- *`CalcularTotalPedido`*: Función para Calcular Total de un Pedido
- *`CalificacionPromedio`*: Función para Obtener Calificación Promedio de un Cómic
- *`ObtenerDescuento`*: Función para Determinar si un Cómic Está en Oferta
- *`CalcularCostoEnvio`*: Función para Calcular el Costo de Envío
- *`VerificarStock`*: Función para Verificar Disponibilidad de Stock para un Pedido

---

## 1. CalcularStockTotal

*`Propósito`*: Calcula el stock total disponible de un cómic, considerando tanto las recepciones como las ventas registradas en la tabla Inventario.

*`Objetivo`*: Devolver el total de stock disponible de un cómic en función de los movimientos de inventario (ya sea recepción o venta) registrados en la tabla Inventario.

**Tablas Involucradas**:

- *`Inventario`*: La tabla que almacena los movimientos de inventario, con las cantidades recibidas o vendidas de un cómic.

### Descripción de la Función:
La función CalcularStockTotal toma como parámetro el comic_id (identificador del cómic) y realiza lo siguiente:

#### 1.	Declara una variable total_stock de tipo INT para almacenar el resultado de la suma de los movimientos de inventario.
--
#### 2.	Realiza una consulta SELECT que:
#### - Suma la cantidad de cómics en la tabla Inventario para el cómic correspondiente al comic_id dado.
#### - Utiliza la función COALESCE para garantizar que, si no existen registros para ese cómic, se devuelva 0 en lugar de NULL.
--
#### 3.	La función devuelve el valor de total_stock, que es el stock total disponible del cómic.
```sql
DELIMITER $$

CREATE FUNCTION CalcularStockTotal(comic INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_stock INT;
    
    -- Sumar las cantidades de los movimientos de inventario para ese cómic
    SELECT COALESCE(SUM(cantidad), 0)
    INTO total_stock
    FROM Inventario
    WHERE comic_id = comic;
    
    -- Retornar el total de stock calculado
    RETURN total_stock;
END$$

DELIMITER ;
```
### Explicación de la Función:

- *`COALESCE(SUM(cantidad), 0)`*: La función SUM suma la cantidad de cómics en los movimientos de inventario, y COALESCE asegura que, si no hay movimientos para ese cómic, se devuelva 0.
- *`RETURNS INT`*: La función devuelve un valor de tipo INT, que representa el total de unidades disponibles para el cómic.












# ¡Muchas gracias por haber llegado hasta acá! 



![1f44b-1f3fb](https://github.com/user-attachments/assets/fd0981ee-c142-41dd-a632-096c378880a9)


