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

---

### Descripción de la Función:
La función CalcularStockTotal toma como parámetro el comic_id (identificador del cómic) y realiza lo siguiente:

#### 1.	Declara una variable total_stock de tipo INT para almacenar el resultado de la suma de los movimientos de inventario.

#### 2.	Realiza una consulta SELECT que:
- Suma la cantidad de cómics en la tabla Inventario para el cómic correspondiente al comic_id dado.
- Utiliza la función COALESCE para garantizar que, si no existen registros para ese cómic, se devuelva 0 en lugar de NULL.

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
---

### Ejemplo de uso:

#### Consultar el stock total de un cómic específico
Supongamos que tenemos el comic_id = 1. Queremos saber el stock total de este cómic.
```sql
-- Consultar el stock total del cómic con id 1
SELECT CalcularStockTotal(1) AS stock_total;
```

---

## 2 - CalcularTotalPedido

*`Propósito`*: Calcula el total de un pedido, sumando el valor de cada detalle (cómic comprado), considerando el precio unitario, cantidad y aplicando el descuento si existe.

*`Objetivo`*: Calcular el total de un pedido a partir de los detalles registrados en la tabla DetallePedido, teniendo en cuenta los descuentos aplicados (si existen).

**Tablas Involucradas**:

- *`DetallePedido`*: Esta tabla almacena los detalles de los pedidos, incluyendo el precio unitario, cantidad y descuento aplicado a cada cómic.
  
---

### Descripción de la Función:
La función CalcularTotalPedido toma como parámetro el pedido_id (identificador del pedido) y realiza lo siguiente:

#### 1.	Declara una variable total de tipo DECIMAL(10, 2) para almacenar el total calculado.

#### 2.	Realiza una consulta SELECT que:
- Calcula el total de cada cómic en el detalle del pedido considerando el precio unitario, la cantidad y el descuento (si existe) con la fórmula:
(precio_unitario - (precio_unitario * (descuento / 100))) * cantidad
 - Suma los totales de cada detalle del pedido.

#### 3. La función devuelve el valor de total, que es el total calculado para el pedido.
```sql
DELIMITER $$

CREATE FUNCTION CalcularTotalPedido(pedido INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    -- Calcular el total del pedido considerando el precio, cantidad y descuento
    SELECT SUM((precio_unitario - (precio_unitario * (descuento / 100))) * cantidad)
    INTO total
    FROM DetallePedido
    WHERE pedido_id = pedido;
    
    -- Retornar el total calculado
    RETURN total;
END$$

DELIMITER ;
```
### Explicación de la Función:
- (precio_unitario - (precio_unitario * (descuento / 100))) * cantidad: Esta fórmula calcula el precio total de un detalle considerando el descuento aplicado sobre el precio unitario y multiplicando por la cantidad.
- SUM: Suma el total de los detalles del pedido.
- RETURNS DECIMAL(10, 2): La función devuelve un valor de tipo decimal, con dos decimales, que representa el total calculado del pedido.
---
### Ejemplo de uso:

#### Consultar el total de un pedido específico
Supongamos que tenemos un pedido con pedido_id = 1. Queremos saber el total de este pedido, considerando los descuentos.
```sql
-- Consultar el total del pedido con id 1
SELECT CalcularTotalPedido(1) AS total_pedido;
```

---

## 3 - CalificacionPromedio

*`Propósito`*: Calcula la calificación promedio de un cómic, considerando las reseñas asociadas a ese cómic.

*`Objetivo`*: Calcular el promedio de las calificaciones de un cómic, basándose en las calificaciones registradas en la tabla de reseñas Resena. Si no existen reseñas para ese cómic, la función debe devolver un valor de 0.

**Tablas Involucradas**:

- *`Resena`*: Esta tabla almacena las reseñas de los cómics, incluyendo la calificación de cada reseña.
  
---

### Descripción de la Función:
La función CalificacionPromedio recibe como parámetro el comic_id (identificador del cómic) y realiza lo siguiente:

#### 1.	Declara una variable promedio de tipo DECIMAL(3, 2) para almacenar el promedio calculado.

#### 2.	Realiza una consulta SELECT que:
- Calcula el promedio de las calificaciones para el cómic especificado usando la función AVG().
- Si no existen reseñas para ese cómic, AVG() devolverá NULL. La función COALESCE() se utiliza para devolver 0 en caso de que no haya reseñas.

#### 3.	La función devuelve el valor de promedio, que es la calificación promedio de ese cómic.
```sql
DELIMITER $$

CREATE FUNCTION CalificacionPromedio(comic INT)
RETURNS DECIMAL(3, 2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(3, 2);
    
    -- Calcular el promedio de las calificaciones para el cómic
    SELECT AVG(calificacion)
    INTO promedio
    FROM Resena
    WHERE comic_id = comic;
    
    -- Devuelve 0 si no hay reseñas (en caso de que el promedio sea NULL)
    RETURN COALESCE(promedio, 0);
END$$

DELIMITER ;
```
### Explicación de la Función:
- AVG(calificacion): Calcula el promedio de las calificaciones para el cómic con el comic_id proporcionado.
- COALESCE(promedio, 0): Si no hay reseñas (es decir, si el promedio es NULL), se devuelve 0, lo que indica que no hay calificaciones disponibles para ese cómic.
---
### Ejemplo de uso:

#### Consultar la calificación promedio de un cómic
Supongamos que tenemos un cómic con comic_id = 2. Queremos saber cuál es su calificación promedio basándonos en las reseñas.
```sql
-- Consultar la calificación promedio del cómic con id 2
SELECT CalificacionPromedio(2) AS calificacion_promedio;
```

---

## 4 - ObtenerDescuento

*`Propósito`*: Verificar si un cómic tiene una oferta activa en una fecha dada y, si es así, devolver el porcentaje de descuento aplicado. Si no hay una oferta activa en esa fecha, devuelve un valor de 0.

*`Objetivo`*: Permitir a los usuarios o al sistema verificar si un cómic específico tiene un descuento activo en una fecha concreta. Esto es útil para aplicar descuentos en el proceso de ventas o cuando se visualizan las ofertas disponibles.

**Tablas Involucradas**:

- *`Ofertas`*: Esta tabla almacena las ofertas activas para los cómics, incluyendo el descuento, las fechas de inicio y fin de la oferta, y el comic_id correspondiente.
  
---

### Descripción de la Función:
La función ObtenerDescuento recibe dos parámetros:
•	comic_id: El identificador del cómic.
•	fecha: La fecha en la que se quiere verificar si el cómic tiene una oferta activa.

### La función realiza los siguientes pasos:

#### 1. Declara una variable descuento de tipo DECIMAL(5, 2) para almacenar el descuento de la oferta.

#### 2.	Realiza una consulta SELECT que:
- Obtiene el descuento de la tabla Ofertas para el cómic específico comic_id y verifica si la fecha proporcionada está dentro del rango de la oferta (utilizando BETWEEN fecha_inicio AND fecha_fin).
- Si no se encuentra ninguna oferta activa, la consulta no devuelve ningún valor.

#### 3. La función devuelve el valor de descuento, que es el porcentaje de descuento de la oferta activa. Si no se encuentra una oferta, se devuelve 0.
```sql
DELIMITER $$

CREATE FUNCTION ObtenerDescuento(comic INT, fecha DATE)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
    DECLARE descuento DECIMAL(5, 2);
    
    -- Verificar si hay una oferta activa para el cómic en la fecha dada
    SELECT descuento
    INTO descuento
    FROM Ofertas
    WHERE comic_id = comic
      AND fecha BETWEEN fecha_inicio AND fecha_fin
    LIMIT 1;

    -- Si no hay oferta activa, se devuelve 0
    RETURN COALESCE(descuento, 0);
END$$

DELIMITER ;
```
### Explicación de la Función:
- BETWEEN fecha_inicio AND fecha_fin: Esto asegura que la fecha proporcionada esté dentro del rango de fechas en el que la oferta es válida.
- COALESCE(descuento, 0): Si no se encuentra una oferta activa para el cómic, COALESCE devuelve 0 en lugar de NULL, indicando que no hay descuento disponible.
---
### Ejemplo de uso:

#### Consultar si un cómic tiene una oferta activa en una fecha específica
Supongamos que tienes un cómic con comic_id = 3 y quieres verificar si tiene una oferta activa en la fecha '2024-11-23'.
```sql
-- Consultar el descuento activo para el cómic con id 3 en la fecha '2024-11-23'
SELECT ObtenerDescuento(3, '2024-11-23') AS descuento_activo;
```

---

## 5 - CalcularCostoEnvio

*`Propósito`*: Calcular el costo de envío en función de la zona de destino y el método de envío elegido. Esta función es útil para determinar el costo que se debe agregar al total de un pedido en función de los parámetros de envío.

*`Objetivo`*: Permitir al sistema o a los usuarios obtener el costo de envío específico basado en la zona de destino del pedido y el método de envío seleccionado.

**Tablas Involucradas**:

- *`TarifaEnvio`*: Esta tabla almacena las tarifas de envío, que dependen de la zona de destino (zona) y el método de envío (metodo_envio). La tabla también debe contener el campo costo para reflejar el precio de cada tarifa.
  
---

### Descripción de la Función:
La función CalcularCostoEnvio recibe dos parámetros:
- zona: La zona de destino del envío (por ejemplo, "Capital Federal").
- metodo: El método de envío elegido (por ejemplo, "Estandar").

### La función realiza los siguientes pasos:

#### 1. Declara una variable costo de tipo DECIMAL(10, 2) para almacenar el costo de envío.

#### 2.	Realiza una consulta SELECT que:
- Obtiene el costo de la tabla TarifaEnvio para la zona y el método de envío proporcionados.
  
#### 3. La función devuelve el valor de costo. Si no se encuentra una tarifa de envío correspondiente, se devuelve 0 usando la función COALESCE.
```sql
DELIMITER $$

CREATE FUNCTION CalcularCostoEnvio(zona VARCHAR(100), metodo VARCHAR(100))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE costo DECIMAL(10, 2);
    
    -- Obtener el costo de envío según la zona y el método de envío
    SELECT costo
    INTO costo
    FROM TarifaEnvio
    WHERE zona = zona
      AND metodo_envio = metodo
    LIMIT 1;

    -- Si no se encuentra la tarifa de envío, devuelve 0
    RETURN COALESCE(costo, 0);
END$$

DELIMITER ;
```
### Explicación de la Función:
- SELECT costo INTO costo: Realiza una consulta para obtener el costo de envío correspondiente a la zona y metodo_envio.
- COALESCE(costo, 0): Si no se encuentra una tarifa correspondiente, devuelve 0 en lugar de NULL.

---
### Ejemplo de uso:

#### Consultar el costo de envío para una zona y método específicos
Supongamos que quieres saber el costo de envío para la zona 'Capital Federal' y el método de envío 'Estandar'.
```sql
-- Consultar el costo de envío para la zona 'Capital Federal' con el método 'Estandar'
SELECT CalcularCostoEnvio('Capital Federal', 'Estandar') AS costo_envio;
```

---

## 6 - VerificarStock

*`Propósito`*: Verifica si existe suficiente stock en el inventario para cubrir las cantidades solicitadas de cómics en un pedido.

*`Objetivo`*: Permitir al sistema validar los pedidos antes de procesarlos, asegurándose de que todos los cómics en el pedido tengan suficiente stock disponible.

**Tablas Involucradas**:

- *`DetallePedido`*: Contiene las cantidades de cómics solicitados en cada pedido.
- *`Comic`*: Relaciona los cómics con sus detalles principales (aunque no directamente con el stock).
- *`Inventario`*: Proporciona el stock total de cada cómic utilizando la función CalcularStockTotal previamente creada.
  
---

### Descripción de la Función:
La función VerificarStock recibe un parámetro:
- pedido: El ID del pedido que se desea verificar.

### La lógica de la función es:

#### 1. Inicializa la variable stock_suficiente en TRUE.

#### 2. Realiza una consulta para verificar si existe al menos un cómic en el pedido cuya cantidad requerida sea mayor al stock disponible (calculado con CalcularStockTotal).
  
#### 3. Si la consulta encuentra cómics con stock insuficiente, actualiza stock_suficiente a FALSE.

#### 4.	Devuelve el valor de stock_suficiente:
- TRUE (1): Hay suficiente stock para todos los cómics del pedido.
- FALSE (0): Hay al menos un cómic sin stock suficiente.
```sql
DELIMITER $$

CREATE FUNCTION VerificarStock(pedido INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE stock_suficiente BOOLEAN;
    SET stock_suficiente = TRUE;

    -- Verificar si hay algún cómic en el pedido con stock insuficiente
    IF EXISTS (
        SELECT 1
        FROM DetallePedido dp
        JOIN Comic c ON dp.comic_id = c.comic_id
        WHERE dp.pedido_id = pedido
          AND dp.cantidad > CalcularStockTotal(dp.comic_id)
    ) THEN
        SET stock_suficiente = FALSE;
    END IF;

    -- Retornar el resultado de la verificación
    RETURN stock_suficiente;
END$$

DELIMITER ;
```
### Explicación de la Función:
- SELECT 1 FROM DetallePedido ... WHERE dp.cantidad > CalcularStockTotal(dp.comic_id): Encuentra si hay algún cómic en el pedido con cantidad requerida mayor al stock disponible.

- EXISTS: Comprueba si la consulta devuelve al menos un resultado.

- SET stock_suficiente = FALSE: Actualiza la variable si se detecta stock insuficiente.

- RETURN stock_suficiente: Devuelve el resultado de la verificación.

---
### Ejemplo de uso:

#### Verificar stock para un pedido con stock suficiente
Supongamos que quieres verificar el stock para el pedido con ID 1, y todos los cómics de este pedido tienen suficiente stock.
```sql
-- Verificar si hay suficiente stock para el pedido con ID 1
SELECT VerificarStock(1) AS stock_suficiente;
```

---

# Store Procedure

Un stored procedure (procedimiento almacenado) es un bloque de código SQL predefinido y almacenado en la base de datos, diseñado para realizar una tarea específica. Puede incluir consultas, cálculos y lógica condicional, y se ejecuta cuando se invoca por su nombre. A diferencia de las funciones, los procedimientos almacenados pueden realizar acciones como insertar, actualizar o eliminar datos, y no siempre devuelven un valor. Son útiles para automatizar tareas repetitivas, mejorar el rendimiento y garantizar la seguridad al limitar el acceso directo a las consultas SQL.

## Store Procedure aplicados

- *`RegistrarCliente`*: Registrar un nuevo cliente. 
- *`RegistrarPedido`*: Registrar un nuevo pedido.
- *`RegistrarPago`*: Registrar un pago para un pedido.
- *`RegistrarRecepcion`*: Registrar una recepción de cómics (movimiento de inventario). 
- *`AplicarOferta`*: Aplicar un descuento a un cómic en una oferta.
- *`ActualizarEstadoEnvio`*: •	Actualizar estado de envío.
- *`ObtenerDetallePedido`*: Obtener detalles del pedido con los cómics asociados.
- *`ActualizarStock`*: Procedimiento para Actualizar el Stock al Registrar una Venta. 

---

## 1. RegistrarCliente

*`Propósito`*: Permite insertar nuevos clientes en la base de datos, simplificando el proceso de registro y asegurando que todos los datos necesarios se capturen correctamente.

*`Objetivo`*: Facilitar la inserción de nuevos registros en la tabla Cliente, evitando repeticiones en el código SQL y promoviendo una gestión centralizada del registro de clientes.

**Tablas Involucradas**:

- *`Cliente`*: Recibe los datos proporcionados como parámetros en el procedimiento.

---

### Descripción del Procedimiento:
El procedimiento almacenado RegistrarCliente recibe los siguientes parámetros:
•	p_nombre: El nombre del cliente.
•	p_apellido: El apellido del cliente.
•	p_email: El correo electrónico del cliente.
•	p_direccion: La dirección física del cliente.
•	p_telefono: El número de teléfono del cliente.

### Lógica Interna:

#### 1. INSERT INTO Cliente: Inserta los valores proporcionados por los parámetros en la tabla Cliente.

#### 2. Los datos son insertados directamente, sin validación adicional en este ejemplo básico.

---
### Ejemplo de uso:

### Registrar un cliente válido
Supongamos que deseas registrar un nuevo cliente llamado "Pedro Suárez" con los siguientes datos:
- Email: pedro.suarez@example.com
- Dirección: Av. del Libertador 5000, Buenos Aires
- Teléfono: 6612345678
```sql
CALL RegistrarCliente(
    'Pedro',
    'Suárez',
    'pedro.suarez@example.com',
    'Av. del Libertador 5000, Buenos Aires',
    '6612345678'
);
```
#### Resultado esperado: El procedimiento inserta un nuevo registro en la tabla Cliente con los datos proporcionados.

---
#### Validación: Consulta para verificar que el cliente fue registrado correctamente:
```sql
SELECT * FROM Cliente WHERE email = 'pedro.suarez@example.com';
```

---

## 2. RegistrarPedido

*`Propósito`*: Permite insertar nuevos pedidos en la base de datos, simplificando el proceso de registro y asegurando que todos los datos necesarios se capturen correctamente, además de registrar la fecha del pedido automáticamente.

*`Objetivo`*: Facilitar la inserción de nuevos registros en la tabla Pedido, evitando repeticiones en el código SQL y promoviendo una gestión centralizada de los pedidos, además de asegurar que la fecha del pedido se registre de manera consistente.

**Tablas Involucradas**:

- *`Pedido`*: Recibe los datos proporcionados como parámetros en el procedimiento (cliente_id, estado, total, tarifa_envio).

---

### Descripción del Procedimiento:
El procedimiento almacenado RegistrarPedido recibe los siguientes parámetros:
•	p_cliente_id: El ID del cliente que realiza el pedido.
•	p_estado: El estado del pedido (por ejemplo, 'Pendiente', 'Completado').
•	p_total: El total del pedido, que incluye los costos de los cómics, descuentos y tarifas de envío.
•	p_tarifa_envio: El costo del envío del pedido.

### Lógica Interna:

#### 1. INSERT INTO Pedido: Inserta los valores proporcionados por los parámetros en la tabla Pedido. La fecha del pedido se obtiene automáticamente mediante la función CURDATE(), lo que asegura que se registre la fecha actual.

#### 2. Datos insertados: Los datos son insertados directamente sin validaciones adicionales en este ejemplo básico. Esto asegura que el pedido se registre correctamente con los valores proporcionados.

---
### Ejemplo de uso:
Registrar un nuevo pedido para el cliente con cliente_id = 3, cuyo estado es 'Pendiente', el total del pedido es 1850.00 y la tarifa de envío es 200.00.
```sql
CALL RegistrarPedido(
    3,               -- p_cliente_id
    'Pendiente',     -- p_estado
    1850.00,         -- p_total
    200.00           -- p_tarifa_envio
);

```
#### Resultado esperado: El procedimiento insertará un nuevo registro en la tabla Pedido, con los siguientes valores:
- cliente_id = 3
- fecha_pedido = CURDATE() (fecha actual)
- estado = 'Pendiente'
- total = 1850.00
- tarifa_envio = 200.00

---
#### Validación: Consulta para verificar que el pedido fue registrado correctamente:
```sql
SELECT * FROM Pedido WHERE cliente_id = 3 AND total = 1850.00;
```

---

## 3. RegistrarPago

*`Propósito`*: Permite registrar los pagos realizados para un pedido, asegurando que los detalles del pago (monto, fecha y método) se almacenen correctamente en la base de datos..

*`Objetivo`*: Facilitar la inserción de nuevos pagos asociados a pedidos existentes, promoviendo una gestión centralizada de los pagos y asegurando que el monto pagado se registre con el método de pago correspondiente.

**Tablas Involucradas**:

- *`Pago`*: Recibe los datos proporcionados como parámetros en el procedimiento (pedido_id, monto, metodo_pago).

---

### Descripción del Procedimiento:
El procedimiento almacenado RegistrarPago recibe los siguientes parámetros:
•	p_pedido_id: El ID del pedido asociado al pago.
•	p_monto: El monto del pago realizado.
•	p_metodo_pago: El método de pago utilizado (por ejemplo, 'Tarjeta de Crédito', 'Transferencia', etc.).

### Lógica Interna:

#### 1. INSERT INTO Pago: Inserta los valores proporcionados por los parámetros en la tabla Pago. La fecha del pago se obtiene automáticamente mediante la función CURDATE(), lo que asegura que se registre la fecha actual del pago.

#### 2. Datos insertados: Los datos son insertados directamente en la tabla Pago sin validaciones adicionales en este ejemplo básico.

--
### Ejemplo de uso:
Registrar un pago para el pedido con ID 4, cuyo monto es 2000.00 y el método de pago es 'PayPal'.
```sql
CALL RegistrarPago(
    4,               -- p_pedido_id
    2000.00,         -- p_monto
    'PayPal'         -- p_metodo_pago
);
```
#### Resultado esperado: El procedimiento insertará un nuevo registro en la tabla Pago, con los siguientes valores:
- pedido_id = 4
- fecha_pago = CURDATE() (fecha actual)
- monto = 2000.00
- metodo_pago = 'PayPal'

---
#### Consulta para verificar que el pago fue registrado correctamente:
```sql
SELECT * FROM Pago WHERE pedido_id = 4 AND monto = 2000.00;
```

---













# ¡Muchas gracias por haber llegado hasta acá! 



![1f44b-1f3fb](https://github.com/user-attachments/assets/fd0981ee-c142-41dd-a632-096c378880a9)


