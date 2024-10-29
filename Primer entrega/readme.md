
![logo](https://github.com/user-attachments/assets/69425ae8-f58c-42ad-9c96-b8e37c6992bd)


# Proyecto: Tierra Uno Comics

**Alumno:** Pablo José Carey  
**Curso:** SQL  
**Comisión:** 59430  
**Docente:** Anderson Michel Torres  
**Tutor:** Hugo González  

---

**Introducción**

En un mundo lleno de historias increíbles, **Tierra Uno Comics** es un lugar donde los fanáticos encuentran mucho más que cómics: encuentran momentos, personajes y mundos que alimentan su imaginación. Para seguir ofreciendo esta experiencia única, la propuesta de base de datos busca ser el motor detrás de cada venta, pedido y oferta que la tienda ofrece.

Este sistema estará diseñado para que "Tierra Uno Comics" pueda organizar y gestionar cada aspecto clave del negocio: desde el seguimiento de ventas y pedidos hasta la administración de pagos y envíos, con un registro claro de referencias de productos y promociones. Al integrar toda esta información en una base de datos unificada, la tienda podrá enfocarse en lo que mejor sabe hacer: conectar a las personas con las historias que aman, mientras optimiza y simplifica su funcionamiento.

---

**Situación Problema**

Actualmente, **Tierra Uno Comics** enfrenta varios desafíos en la gestión de sus ventas y pedidos. Con el aumento de la demanda, se ha vuelto difícil hacer un seguimiento preciso de cada venta, verificar el estado de cada pedido y coordinar los envíos a tiempo. Además, la falta de una estructura unificada para almacenar información sobre productos, precios, referencias y promociones genera inconsistencias en la atención al cliente, afectando la experiencia de los compradores y complicando el proceso de ofrecer descuentos especiales o promociones.

En este contexto, los empleados de "Tierra Uno Comics" pierden tiempo valioso buscando datos dispersos en registros independientes y en sistemas de control no centralizados, lo que incrementa la probabilidad de errores en pedidos y pagos, y dificulta una rápida resolución de problemas.

---

**Solución Propuesta**

La implementación de una base de datos optimizada y unificada permitirá a **Tierra Uno Comics** tener un control detallado de cada venta y pedido desde un solo sistema. Con esta estructura, el equipo podrá:

- Realizar un seguimiento en tiempo real de todos los pedidos y su estado (pagado, enviado, pendiente), permitiendo una atención más rápida y precisa.
- Acceder fácilmente a la información del cliente, lo cual mejora la personalización en las ofertas y descuentos, fidelizando a los compradores y fomentando la repetición de compras.
- Administrar inventarios y referencias de productos de manera organizada, reduciendo errores en el control de stock y evitando inconsistencias de precios o productos agotados que puedan frustrar a los clientes.
- Ofrecer promociones y descuentos de manera ágil y sin errores, logrando que el sistema refleje de inmediato las ofertas disponibles, mejorando la experiencia de compra y atrayendo a nuevos clientes.

---

**Diagrama de entidad relación**

**DER - Notación de CHEN**
![imagen](https://github.com/user-attachments/assets/13f076b7-d277-4242-b6ce-f082d69f2bcc)

---

**DER - MySQL Workbench**
![DER-Tierra_uno_comic_MySQL_Workbench](https://github.com/user-attachments/assets/1c20c526-6250-4793-af6a-3c71b8863249)

---

**Tablas y Descripción de los Campos** - Ver estructura_proyecto.sql

Tabla Autor

    autor_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del autor.
    nombre (VARCHAR(100), NOT NULL): Nombre del autor.
    apellido (VARCHAR(100), NOT NULL): Apellido del autor.
    nacionalidad (VARCHAR(100)): Nacionalidad del autor.

Tabla Editorial

    editorial_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la editorial.
    nombre (VARCHAR(100), NOT NULL): Nombre de la editorial.
    pais (VARCHAR(100)): País de la editorial.
    telefono (VARCHAR(15)): Teléfono de contacto de la editorial.

Tabla Género

    genero_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del género.
    nombre (VARCHAR(100), NOT NULL): Nombre del género.

Tabla Cliente

    cliente_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del cliente.
    nombre (VARCHAR(100), NOT NULL): Nombre del cliente.
    apellido (VARCHAR(100), NOT NULL): Apellido del cliente.
    email (VARCHAR(100), NOT NULL, UNIQUE): Correo electrónico del cliente.
    direccion (VARCHAR(255), NOT NULL): Dirección del cliente.
    telefono (VARCHAR(15)): Teléfono de contacto del cliente.

Tabla Cómic

    comic_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del cómic.
    titulo (VARCHAR(255), NOT NULL): Título del cómic.
    autor_id (INT, NOT NULL, FOREIGN KEY): Relación con el autor del cómic.
    editorial_id (INT, NOT NULL, FOREIGN KEY): Relación con la editorial del cómic.
    genero_id (INT, NOT NULL, FOREIGN KEY): Relación con el género del cómic.
    precio (DECIMAL(10, 2), NOT NULL): Precio de venta del cómic.
    fecha_publicacion (DATE, NOT NULL): Fecha de publicación del cómic.
    descripcion (TEXT): Descripción del cómic.
    stock (INT, NOT NULL, CHECK(stock >= 0)): Cantidad disponible en inventario.

Tabla Pedido

    pedido_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del pedido.
    cliente_id (INT, NOT NULL, FOREIGN KEY): Relación con el cliente que realizó el pedido.
    fecha_pedido (DATE, NOT NULL): Fecha en que se realizó el pedido.
    estado (VARCHAR(50), NOT NULL): Estado actual del pedido.
    total (DECIMAL(10, 2), NOT NULL): Total de la compra.

Tabla Pago

    pago_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del pago.
    pedido_id (INT, NOT NULL, FOREIGN KEY): Relación con el pedido asociado.
    fecha_pago (DATE, NOT NULL): Fecha del pago.
    monto (DECIMAL(10, 2), NOT NULL): Monto del pago.
    metodo_pago (VARCHAR(50), NOT NULL): Método de pago utilizado.

Tabla Detalle Pedido

    detalle_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del detalle de pedido.
    pedido_id (INT, NOT NULL, FOREIGN KEY): Relación con el pedido correspondiente.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
    cantidad (INT, NOT NULL, CHECK(cantidad > 0)): Cantidad de cómics en el pedido.
    precio_unitario (DECIMAL(10, 2), NOT NULL): Precio unitario en el momento del pedido.

Tabla Proveedor

    proveedor_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del proveedor.
    nombre (VARCHAR(100), NOT NULL): Nombre del proveedor.
    telefono (VARCHAR(15)): Teléfono de contacto del proveedor.
    direccion (VARCHAR(255)): Dirección del proveedor.

Tabla Inventario

    inventario_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del registro de inventario.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
    proveedor_id (INT, NOT NULL, FOREIGN KEY): Relación con el proveedor.
    fecha_recepcion (DATE, NOT NULL): Fecha de recepción del cómic en inventario.
    cantidad (INT, NOT NULL, CHECK(cantidad > 0)): Cantidad de cómics recibidos.

Tabla Reseña

    resena_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la reseña.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic.
    cliente_id (INT, NOT NULL, FOREIGN KEY): Relación con el cliente que realizó la reseña.
    fecha_resena (DATE, NOT NULL): Fecha de la reseña.
    calificacion (INT, CHECK(calificacion BETWEEN 1 AND 5)): Calificación dada al cómic.
    comentario (TEXT): Comentario del cliente sobre el cómic.

Tabla Ofertas

    oferta_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la oferta.
    comic_id (INT, NOT NULL, FOREIGN KEY): Relación con el cómic en oferta.
    descuento (DECIMAL(5, 2), CHECK(descuento BETWEEN 0 AND 100)): Porcentaje de descuento.
    fecha_inicio (DATE, NOT NULL): Fecha de inicio de la oferta.
    fecha_fin (DATE, NOT NULL): Fecha de fin de la oferta.

Tabla Tarifa Envío

    tarifa_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único de la tarifa de envío.
    zona (VARCHAR(100), NOT NULL): Zona geográfica de envío.
    costo (DECIMAL(10, 2), NOT NULL): Costo del envío.
    metodo_envio (VARCHAR(100), NOT NULL): Método de envío.

Tabla Envío

    envio_id (INT, NOT NULL, PRIMARY KEY, AUTO_INCREMENT): Identificador único del envío.
    pedido_id (INT, NOT NULL, FOREIGN KEY): Relación con el pedido asociado.
    tarifa_id (INT, NOT NULL, FOREIGN KEY): Relación con la tarifa de envío.
    fecha_envio (DATE, NOT NULL): Fecha del envío.
    estado_envio (VARCHAR(50), NOT NULL): Estado actual del envío.
    numero_seguimiento (VARCHAR(100)): Número de seguimiento del envío.

Relaciones y Problemáticas Resueltas

    Relación Cliente-Pedido-Pago: Un cliente puede realizar múltiples pedidos, y cada pedido puede tener un pago asociado. Esta estructura permite rastrear la actividad de cada cliente y sus pagos.
    Relación Cómic-Inventario-Detalle Pedido: Permite el control del stock de cómics en la tienda, facilitando la reposición y el control de ventas.
    Relación Cómic-Reseña-Cliente: Permite que los clientes dejen reseñas y calificaciones de los cómics, mejorando la interacción y aportando valor informativo a futuros compradores.
    Relación Cómic-Ofertas: Facilita el establecimiento de descuentos y promociones, proporcionando flexibilidad en la estrategia de ventas.
    Relación Pedido-Envío-Tarifa Envío: Gestiona el envío de los pedidos, incluyendo costos y zonas geográficas, lo que permite una logística de envíos más organizada y detallada.


# Muchas gracias por haber llegado hasta aca 

![1f44b-1f3fb](https://github.com/user-attachments/assets/fd0981ee-c142-41dd-a632-096c378880a9)


