-- Tabla Autor
CREATE TABLE Autor (
    autor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(100)
);

-- Tabla Editorial
CREATE TABLE Editorial (
    editorial_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100),
    telefono VARCHAR(15)
);

-- Tabla Genero
CREATE TABLE Genero (
    genero_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Cliente
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(15)
);

-- Tabla Comic
CREATE TABLE Comic (
    comic_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    editorial_id INT NOT NULL,
    genero_id INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    descripcion TEXT,
    stock INT NOT NULL CHECK (stock >= 0),
    FOREIGN KEY (autor_id) REFERENCES Autor(autor_id),
    FOREIGN KEY (editorial_id) REFERENCES Editorial(editorial_id),
    FOREIGN KEY (genero_id) REFERENCES Genero(genero_id)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabla Pago
CREATE TABLE Pago (
    pago_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);

-- Tabla DetallePedido
CREATE TABLE DetallePedido (
    detalle_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
    comic_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (comic_id) REFERENCES Comic(comic_id)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255)
);

-- Tabla Inventario
CREATE TABLE Inventario (
    inventario_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    comic_id INT NOT NULL,
    proveedor_id INT, 
    fecha_movimiento DATE NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad <> 0), -- Cantidad positiva para recepciones, negativa para ventas
    tipo_movimiento ENUM('recepcion', 'venta') NOT NULL, -- Define si es un ingreso o egreso de stock
    FOREIGN KEY (comic_id) REFERENCES Comic(comic_id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);

-- Tabla Resena
CREATE TABLE Resena (
    resena_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    comic_id INT NOT NULL,
    cliente_id INT NOT NULL,
    fecha_resena DATE NOT NULL,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    FOREIGN KEY (comic_id) REFERENCES Comic(comic_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabla Ofertas
CREATE TABLE Ofertas (
    oferta_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    comic_id INT NOT NULL,
    descuento DECIMAL(5, 2) CHECK (descuento BETWEEN 0 AND 100),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (comic_id) REFERENCES Comic(comic_id)
);

-- Tabla TarifaEnvio
CREATE TABLE TarifaEnvio (
    tarifa_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    zona VARCHAR(100) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    metodo_envio VARCHAR(100) NOT NULL
);

-- Tabla Envio
CREATE TABLE Envio (
    envio_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pedido_id INT NOT NULL,
    tarifa_id INT NOT NULL,
    fecha_envio DATE NOT NULL,
    estado_envio VARCHAR(50) NOT NULL,
    numero_seguimiento VARCHAR(100),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (tarifa_id) REFERENCES TarifaEnvio(tarifa_id)
);
