-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: tierra_uno_comic
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `autor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`autor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Alan','Moore','Británica'),(2,'Frank','Miller','Estadounidense'),(3,'Neil','Gaiman','Británica'),(4,'Grant','Morrison','Escocesa'),(5,'Brian','K. Vaughan','Estadounidense');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Pérez','juan.perez@example.com','Calle Falsa 123, Buenos Aires','1112345678'),(2,'María','Gómez','maria.gomez@example.com','Av. Siempre Viva 742, Córdoba','2212345678'),(3,'Carlos','López','carlos.lopez@example.com','Calle Principal 456, Rosario','3312345678'),(4,'Ana','Martínez','ana.martinez@example.com','Boulevard Central 789, Mendoza','4412345678'),(5,'Lucía','Fernández','lucia.fernandez@example.com','Ruta Nacional 1, Salta','5512345678');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comic`
--

DROP TABLE IF EXISTS `comic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comic` (
  `comic_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor_id` int NOT NULL,
  `editorial_id` int NOT NULL,
  `genero_id` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `descripcion` text,
  `stock` int NOT NULL,
  PRIMARY KEY (`comic_id`),
  KEY `autor_id` (`autor_id`),
  KEY `editorial_id` (`editorial_id`),
  KEY `genero_id` (`genero_id`),
  CONSTRAINT `comic_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`autor_id`),
  CONSTRAINT `comic_ibfk_2` FOREIGN KEY (`editorial_id`) REFERENCES `editorial` (`editorial_id`),
  CONSTRAINT `comic_ibfk_3` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`genero_id`),
  CONSTRAINT `comic_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comic`
--

LOCK TABLES `comic` WRITE;
/*!40000 ALTER TABLE `comic` DISABLE KEYS */;
INSERT INTO `comic` VALUES (1,'Watchmen',1,1,1,1500.00,'1986-09-01','Una historia revolucionaria de superhéroes',40),(2,'The Dark Knight Returns',2,1,1,1800.00,'1986-02-01','Batman vuelve para enfrentar un mundo oscuro',30),(3,'Sandman',3,1,3,2000.00,'1989-01-01','Una saga fantástica sobre los sueños',40),(4,'Saga',5,3,2,1200.00,'2012-03-14','Una historia épica de ciencia ficción',25),(5,'Hellboy',4,4,4,1000.00,'1994-03-01','El detective paranormal del infierno',20);
/*!40000 ALTER TABLE `comic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comicsmasvendidos`
--

DROP TABLE IF EXISTS `comicsmasvendidos`;
/*!50001 DROP VIEW IF EXISTS `comicsmasvendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comicsmasvendidos` AS SELECT 
 1 AS `comic_id`,
 1 AS `titulo`,
 1 AS `total_vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detallepedido`
--

DROP TABLE IF EXISTS `detallepedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedido` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `comic_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `descuento` decimal(5,2) DEFAULT '0.00',
  PRIMARY KEY (`detalle_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `comic_id` (`comic_id`),
  CONSTRAINT `detallepedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`),
  CONSTRAINT `detallepedido_ibfk_2` FOREIGN KEY (`comic_id`) REFERENCES `comic` (`comic_id`),
  CONSTRAINT `detallepedido_chk_1` CHECK ((`cantidad` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedido`
--

LOCK TABLES `detallepedido` WRITE;
/*!40000 ALTER TABLE `detallepedido` DISABLE KEYS */;
INSERT INTO `detallepedido` VALUES (1,1,1,1,1500.00,0.00),(2,2,2,1,1800.00,0.00),(3,3,3,1,2000.00,0.00),(4,3,5,1,1000.00,50.00),(5,5,4,1,1200.00,0.00);
/*!40000 ALTER TABLE `detallepedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `aplicar_descuento_oferta` BEFORE INSERT ON `detallepedido` FOR EACH ROW BEGIN
    DECLARE descuento_actual DECIMAL(5, 2) DEFAULT 0;
    
    SELECT descuento
    INTO descuento_actual
    FROM Ofertas
    WHERE comic_id = NEW.comic_id
      AND CURDATE() BETWEEN fecha_inicio AND fecha_fin
    LIMIT 1;

    SET NEW.descuento = IFNULL(descuento_actual, 0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calcular_total_pedido` AFTER INSERT ON `detallepedido` FOR EACH ROW BEGIN
    DECLARE total_actual DECIMAL(10, 2);
    SELECT SUM((precio_unitario * cantidad) - (precio_unitario * cantidad * (descuento / 100)))
    INTO total_actual
    FROM DetallePedido
    WHERE pedido_id = NEW.pedido_id;

    UPDATE Pedido
    SET total = total_actual + tarifa_envio
    WHERE pedido_id = NEW.pedido_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `editorial_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`editorial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'DC Comics','Estados Unidos','1234567890'),(2,'Marvel Comics','Estados Unidos','0987654321'),(3,'Image Comics','Estados Unidos','4567891230'),(4,'Dark Horse Comics','Estados Unidos','7891234560'),(5,'IDW Publishing','Estados Unidos','3216549870');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `envio_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `tarifa_id` int NOT NULL,
  `fecha_envio` date NOT NULL,
  `estado_envio` varchar(50) NOT NULL,
  `numero_seguimiento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`envio_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `tarifa_id` (`tarifa_id`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`),
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`tarifa_id`) REFERENCES `tarifaenvio` (`tarifa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES (1,1,1,'2024-11-02','Entregado','ABC123'),(2,2,2,'2024-11-03','En camino','DEF456'),(3,3,3,'2024-11-04','En tránsito','GHI789'),(4,5,4,'2024-11-05','Pendiente','JKL012');
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `genero_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`genero_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Superhéroes'),(2,'Ciencia Ficción'),(3,'Fantasía'),(4,'Terror'),(5,'Drama');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `inventario_id` int NOT NULL AUTO_INCREMENT,
  `comic_id` int NOT NULL,
  `proveedor_id` int DEFAULT NULL,
  `fecha_movimiento` date NOT NULL,
  `cantidad` int NOT NULL,
  `tipo_movimiento` enum('recepcion','venta') NOT NULL,
  PRIMARY KEY (`inventario_id`),
  KEY `comic_id` (`comic_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`comic_id`) REFERENCES `comic` (`comic_id`),
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`),
  CONSTRAINT `inventario_chk_1` CHECK ((`cantidad` <> 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,1,'2024-10-01',50,'recepcion'),(2,2,2,'2024-10-02',30,'recepcion'),(3,3,3,'2024-10-03',40,'recepcion'),(4,4,4,'2024-10-04',25,'recepcion'),(5,5,5,'2024-10-05',20,'recepcion'),(6,1,NULL,'2024-11-24',-10,'venta');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `validar_stock_comic` BEFORE INSERT ON `inventario` FOR EACH ROW BEGIN
    IF NEW.tipo_movimiento = 'venta' THEN
        -- Verifica si el stock es suficiente
        IF (SELECT stock FROM Comic WHERE comic_id = NEW.comic_id) < NEW.cantidad THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta.';
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_stock_comic` AFTER INSERT ON `inventario` FOR EACH ROW BEGIN
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
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ofertas` (
  `oferta_id` int NOT NULL AUTO_INCREMENT,
  `comic_id` int NOT NULL,
  `descuento` decimal(5,2) DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`oferta_id`),
  KEY `comic_id` (`comic_id`),
  CONSTRAINT `ofertas_ibfk_1` FOREIGN KEY (`comic_id`) REFERENCES `comic` (`comic_id`),
  CONSTRAINT `ofertas_chk_1` CHECK ((`descuento` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertas`
--

LOCK TABLES `ofertas` WRITE;
/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
INSERT INTO `ofertas` VALUES (1,1,10.00,'2024-11-01','2024-11-10'),(2,2,15.00,'2024-11-05','2024-11-15'),(3,3,20.00,'2024-11-10','2024-11-20'),(4,4,5.00,'2024-11-15','2024-11-25'),(5,5,25.00,'2024-11-20','2024-11-30');
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  PRIMARY KEY (`pago_id`),
  KEY `pedido_id` (`pedido_id`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`pedido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,'2024-11-02',1650.00,'Tarjeta de Crédito'),(2,2,'2024-11-02',1850.00,'Transferencia Bancaria'),(3,3,'2024-11-03',2200.00,'Efectivo'),(4,5,'2024-11-05',1200.00,'Tarjeta de Débito');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `actualizar_estado_pedido` AFTER INSERT ON `pago` FOR EACH ROW BEGIN
    UPDATE Pedido
    SET estado = 'Pagado'
    WHERE pedido_id = NEW.pedido_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `estado` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `tarifa_envio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2024-11-01','Completado',1650.00,150.00),(2,2,'2024-11-02','Pendiente',1850.00,200.00),(3,3,'2024-11-03','Enviado',2200.00,250.00),(4,4,'2024-11-04','Cancelado',0.00,0.00),(5,5,'2024-11-05','Completado',1200.00,100.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidospendientesdeenvio`
--

DROP TABLE IF EXISTS `pedidospendientesdeenvio`;
/*!50001 DROP VIEW IF EXISTS `pedidospendientesdeenvio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidospendientesdeenvio` AS SELECT 
 1 AS `pedido_id`,
 1 AS `fecha_pedido`,
 1 AS `estado`,
 1 AS `cliente_nombre`,
 1 AS `cliente_apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Distribuidora A','1234567890','Calle Comercio 123, Buenos Aires'),(2,'Distribuidora B','0987654321','Av. Central 456, Córdoba'),(3,'Distribuidora C','1122334455','Calle Industrial 789, Rosario'),(4,'Distribuidora D','2233445566','Boulevard Negocios 101, Mendoza'),(5,'Distribuidora E','3344556677','Ruta Comercial 202, Salta');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resena`
--

DROP TABLE IF EXISTS `resena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resena` (
  `resena_id` int NOT NULL AUTO_INCREMENT,
  `comic_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `fecha_resena` date NOT NULL,
  `calificacion` int DEFAULT NULL,
  `comentario` text,
  PRIMARY KEY (`resena_id`),
  KEY `comic_id` (`comic_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `resena_ibfk_1` FOREIGN KEY (`comic_id`) REFERENCES `comic` (`comic_id`),
  CONSTRAINT `resena_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  CONSTRAINT `resena_chk_1` CHECK ((`calificacion` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resena`
--

LOCK TABLES `resena` WRITE;
/*!40000 ALTER TABLE `resena` DISABLE KEYS */;
INSERT INTO `resena` VALUES (1,1,1,'2024-11-06',5,'Obra maestra, un clásico imperdible'),(2,2,2,'2024-11-07',4,'Intensa y emocionante, una gran lectura'),(3,3,3,'2024-11-08',5,'La narrativa es simplemente perfecta'),(4,4,4,'2024-11-09',5,'Increíble historia y arte'),(5,5,5,'2024-11-10',4,'Entretenido y único');
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifaenvio`
--

DROP TABLE IF EXISTS `tarifaenvio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifaenvio` (
  `tarifa_id` int NOT NULL AUTO_INCREMENT,
  `zona` varchar(100) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `metodo_envio` varchar(100) NOT NULL,
  PRIMARY KEY (`tarifa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifaenvio`
--

LOCK TABLES `tarifaenvio` WRITE;
/*!40000 ALTER TABLE `tarifaenvio` DISABLE KEYS */;
INSERT INTO `tarifaenvio` VALUES (1,'Buenos Aires',150.00,'Correo Argentino'),(2,'Córdoba',200.00,'Andreani'),(3,'Rosario',250.00,'OCA'),(4,'Mendoza',300.00,'DHL'),(5,'Salta',350.00,'FedEx');
/*!40000 ALTER TABLE `tarifaenvio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_comic_detalles`
--

DROP TABLE IF EXISTS `vista_comic_detalles`;
/*!50001 DROP VIEW IF EXISTS `vista_comic_detalles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_comic_detalles` AS SELECT 
 1 AS `comic_id`,
 1 AS `titulo`,
 1 AS `precio`,
 1 AS `fecha_publicacion`,
 1 AS `autor_nombre`,
 1 AS `autor_apellido`,
 1 AS `editorial_nombre`,
 1 AS `genero_nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_envios`
--

DROP TABLE IF EXISTS `vista_envios`;
/*!50001 DROP VIEW IF EXISTS `vista_envios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_envios` AS SELECT 
 1 AS `envio_id`,
 1 AS `fecha_envio`,
 1 AS `estado_envio`,
 1 AS `numero_seguimiento`,
 1 AS `zona_envio`,
 1 AS `metodo_envio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_pedidos`
--

DROP TABLE IF EXISTS `vista_historial_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_pedidos` AS SELECT 
 1 AS `pedido_id`,
 1 AS `fecha_pedido`,
 1 AS `estado_pedido`,
 1 AS `total`,
 1 AS `comic_id`,
 1 AS `comic_titulo`,
 1 AS `cantidad`,
 1 AS `precio_unitario`,
 1 AS `descuento`,
 1 AS `total_comic`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_inventario_actual`
--

DROP TABLE IF EXISTS `vista_inventario_actual`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_actual`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_actual` AS SELECT 
 1 AS `comic_id`,
 1 AS `titulo`,
 1 AS `cantidad_recepcion`,
 1 AS `cantidad_venta`,
 1 AS `cantidad_disponible`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ofertas_activas`
--

DROP TABLE IF EXISTS `vista_ofertas_activas`;
/*!50001 DROP VIEW IF EXISTS `vista_ofertas_activas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ofertas_activas` AS SELECT 
 1 AS `oferta_id`,
 1 AS `comic_titulo`,
 1 AS `descuento`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_pagos_pedidos`
--

DROP TABLE IF EXISTS `vista_pagos_pedidos`;
/*!50001 DROP VIEW IF EXISTS `vista_pagos_pedidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_pagos_pedidos` AS SELECT 
 1 AS `pago_id`,
 1 AS `fecha_pago`,
 1 AS `monto`,
 1 AS `metodo_pago`,
 1 AS `pedido_id`,
 1 AS `total_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_resenas`
--

DROP TABLE IF EXISTS `vista_resenas`;
/*!50001 DROP VIEW IF EXISTS `vista_resenas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_resenas` AS SELECT 
 1 AS `resena_id`,
 1 AS `cliente_nombre`,
 1 AS `cliente_apellido`,
 1 AS `cliente_email`,
 1 AS `calificacion`,
 1 AS `comentario`,
 1 AS `comic_titulo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'tierra_uno_comic'
--

--
-- Dumping routines for database 'tierra_uno_comic'
--
/*!50003 DROP FUNCTION IF EXISTS `CalcularCostoEnvio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularCostoEnvio`(zona VARCHAR(100), metodo VARCHAR(100)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE costo DECIMAL(10, 2);
    SELECT costo
    INTO costo
    FROM TarifaEnvio
    WHERE zona = zona AND metodo_envio = metodo
    LIMIT 1;
    RETURN COALESCE(costo, 0); -- Devuelve 0 si no se encuentra tarifa.
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CalcularStockTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularStockTotal`(comic INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total_stock INT;
    SELECT COALESCE(SUM(cantidad), 0)
    INTO total_stock
    FROM Inventario
    WHERE comic_id = comic;
    RETURN total_stock;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CalcularTotalPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularTotalPedido`(pedido INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM((precio_unitario - (precio_unitario * (descuento / 100))) * cantidad)
    INTO total
    FROM DetallePedido
    WHERE pedido_id = pedido;
    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `CalificacionPromedio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalificacionPromedio`(comic INT) RETURNS decimal(3,2)
    DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(3, 2);
    SELECT AVG(calificacion)
    INTO promedio
    FROM Resena
    WHERE comic_id = comic;
    RETURN COALESCE(promedio, 0); -- Devuelve 0 si no hay reseñas.
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GenerarNumeroSeguimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GenerarNumeroSeguimiento`(pedido INT) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    RETURN CONCAT('ENV-', pedido, '-', UNIX_TIMESTAMP());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ObtenerDescuento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ObtenerDescuento`(comic INT, fecha DATE) RETURNS decimal(5,2)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VerificarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VerificarStock`(pedido INT) RETURNS tinyint(1)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEstadoEnvio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEstadoEnvio`(
    IN p_envio_id INT,
    IN p_estado_envio VARCHAR(50),
    IN p_numero_seguimiento VARCHAR(100)
)
BEGIN
    UPDATE Envio
    SET estado_envio = p_estado_envio, numero_seguimiento = p_numero_seguimiento
    WHERE envio_id = p_envio_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStock`(pedido INT)
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AplicarOferta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AplicarOferta`(
    IN p_comic_id INT,
    IN p_descuento DECIMAL(5, 2),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    INSERT INTO Ofertas (comic_id, descuento, fecha_inicio, fecha_fin)
    VALUES (p_comic_id, p_descuento, p_fecha_inicio, p_fecha_fin);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerDetallePedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDetallePedido`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarCliente`(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(15)
)
BEGIN
    INSERT INTO Cliente (nombre, apellido, email, direccion, telefono)
    VALUES (p_nombre, p_apellido, p_email, p_direccion, p_telefono);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPago`(
    IN p_pedido_id INT,
    IN p_monto DECIMAL(10, 2),
    IN p_metodo_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Pago (pedido_id, fecha_pago, monto, metodo_pago)
    VALUES (p_pedido_id, CURDATE(), p_monto, p_metodo_pago);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarPedido`(
    IN p_cliente_id INT,
    IN p_estado VARCHAR(50),
    IN p_total DECIMAL(10, 2),
    IN p_tarifa_envio DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Pedido (cliente_id, fecha_pedido, estado, total, tarifa_envio)
    VALUES (p_cliente_id, CURDATE(), p_estado, p_total, p_tarifa_envio);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegistrarRecepcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistrarRecepcion`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `comicsmasvendidos`
--

/*!50001 DROP VIEW IF EXISTS `comicsmasvendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comicsmasvendidos` AS select `c`.`comic_id` AS `comic_id`,`c`.`titulo` AS `titulo`,sum(`dp`.`cantidad`) AS `total_vendido` from (`detallepedido` `dp` join `comic` `c` on((`dp`.`comic_id` = `c`.`comic_id`))) group by `c`.`comic_id`,`c`.`titulo` order by `total_vendido` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidospendientesdeenvio`
--

/*!50001 DROP VIEW IF EXISTS `pedidospendientesdeenvio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidospendientesdeenvio` AS select `p`.`pedido_id` AS `pedido_id`,`p`.`fecha_pedido` AS `fecha_pedido`,`p`.`estado` AS `estado`,`c`.`nombre` AS `cliente_nombre`,`c`.`apellido` AS `cliente_apellido` from ((`pedido` `p` join `cliente` `c` on((`p`.`cliente_id` = `c`.`cliente_id`))) left join `envio` `e` on((`p`.`pedido_id` = `e`.`pedido_id`))) where (`e`.`pedido_id` is null) order by `p`.`fecha_pedido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_comic_detalles`
--

/*!50001 DROP VIEW IF EXISTS `vista_comic_detalles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_comic_detalles` AS select `c`.`comic_id` AS `comic_id`,`c`.`titulo` AS `titulo`,`c`.`precio` AS `precio`,`c`.`fecha_publicacion` AS `fecha_publicacion`,`a`.`nombre` AS `autor_nombre`,`a`.`apellido` AS `autor_apellido`,`e`.`nombre` AS `editorial_nombre`,`g`.`nombre` AS `genero_nombre` from (((`comic` `c` join `autor` `a` on((`c`.`autor_id` = `a`.`autor_id`))) join `editorial` `e` on((`c`.`editorial_id` = `e`.`editorial_id`))) join `genero` `g` on((`c`.`genero_id` = `g`.`genero_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_envios`
--

/*!50001 DROP VIEW IF EXISTS `vista_envios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_envios` AS select `e`.`envio_id` AS `envio_id`,`e`.`fecha_envio` AS `fecha_envio`,`e`.`estado_envio` AS `estado_envio`,`e`.`numero_seguimiento` AS `numero_seguimiento`,`t`.`zona` AS `zona_envio`,`t`.`metodo_envio` AS `metodo_envio` from (`envio` `e` join `tarifaenvio` `t` on((`e`.`tarifa_id` = `t`.`tarifa_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_pedidos` AS select `p`.`pedido_id` AS `pedido_id`,`p`.`fecha_pedido` AS `fecha_pedido`,`p`.`estado` AS `estado_pedido`,`p`.`total` AS `total`,`dp`.`comic_id` AS `comic_id`,`c`.`titulo` AS `comic_titulo`,`dp`.`cantidad` AS `cantidad`,`dp`.`precio_unitario` AS `precio_unitario`,`dp`.`descuento` AS `descuento`,((`dp`.`cantidad` * `dp`.`precio_unitario`) - `dp`.`descuento`) AS `total_comic` from ((`pedido` `p` join `detallepedido` `dp` on((`p`.`pedido_id` = `dp`.`pedido_id`))) join `comic` `c` on((`dp`.`comic_id` = `c`.`comic_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_inventario_actual`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_actual`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario_actual` AS select `i`.`comic_id` AS `comic_id`,`c`.`titulo` AS `titulo`,sum((case when (`i`.`tipo_movimiento` = 'recepcion') then `i`.`cantidad` else 0 end)) AS `cantidad_recepcion`,sum((case when (`i`.`tipo_movimiento` = 'venta') then `i`.`cantidad` else 0 end)) AS `cantidad_venta`,(sum((case when (`i`.`tipo_movimiento` = 'recepcion') then `i`.`cantidad` else 0 end)) - sum((case when (`i`.`tipo_movimiento` = 'venta') then `i`.`cantidad` else 0 end))) AS `cantidad_disponible` from (`inventario` `i` join `comic` `c` on((`i`.`comic_id` = `c`.`comic_id`))) group by `i`.`comic_id`,`c`.`titulo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ofertas_activas`
--

/*!50001 DROP VIEW IF EXISTS `vista_ofertas_activas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ofertas_activas` AS select `o`.`oferta_id` AS `oferta_id`,`c`.`titulo` AS `comic_titulo`,`o`.`descuento` AS `descuento`,`o`.`fecha_inicio` AS `fecha_inicio`,`o`.`fecha_fin` AS `fecha_fin` from (`ofertas` `o` join `comic` `c` on((`o`.`comic_id` = `c`.`comic_id`))) where (curdate() between `o`.`fecha_inicio` and `o`.`fecha_fin`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_pagos_pedidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_pagos_pedidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_pagos_pedidos` AS select `pa`.`pago_id` AS `pago_id`,`pa`.`fecha_pago` AS `fecha_pago`,`pa`.`monto` AS `monto`,`pa`.`metodo_pago` AS `metodo_pago`,`p`.`pedido_id` AS `pedido_id`,`p`.`total` AS `total_pedido` from (`pago` `pa` join `pedido` `p` on((`pa`.`pedido_id` = `p`.`pedido_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_resenas`
--

/*!50001 DROP VIEW IF EXISTS `vista_resenas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_resenas` AS select `r`.`resena_id` AS `resena_id`,`c`.`nombre` AS `cliente_nombre`,`c`.`apellido` AS `cliente_apellido`,`c`.`email` AS `cliente_email`,`r`.`calificacion` AS `calificacion`,`r`.`comentario` AS `comentario`,`co`.`titulo` AS `comic_titulo` from ((`resena` `r` join `cliente` `c` on((`r`.`cliente_id` = `c`.`cliente_id`))) join `comic` `co` on((`r`.`comic_id` = `co`.`comic_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-21 12:20:19
