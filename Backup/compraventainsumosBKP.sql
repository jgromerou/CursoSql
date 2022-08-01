--Desafío Backup - Romero Uro

-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: compraventainsumosromerouro
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu5

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

-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS `compraventainsumosromerouro`;
USE `compraventainsumosromerouro`;


--
-- Tabla `AuditoriaClientes`
--

DROP TABLE IF EXISTS `AuditoriaClientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaClientes` (
  `idAuditoriaCliente` int NOT NULL AUTO_INCREMENT,
  `NombresAnteriores` varchar(40) DEFAULT NULL,
  `ApellidosAnteriores` varchar(40) DEFAULT NULL,
  `EmailAnterior` varchar(50) DEFAULT NULL,
  `TelefonoAnterior` varchar(15) DEFAULT NULL,
  `NombresNuevos` varchar(40) DEFAULT NULL,
  `ApellidosNuevos` varchar(40) DEFAULT NULL,
  `EmailNuevo` varchar(50) DEFAULT NULL,
  `TelefonoNuevo` varchar(15) DEFAULT NULL,
  `UsuarioCreacion` varchar(40) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  `HoraCreacion` time DEFAULT NULL,
  `UsuarioModificacion` varchar(40) DEFAULT NULL,
  `FechaModificacion` date DEFAULT NULL,
  `HoraModificacion` time DEFAULT NULL,
  `Operacion` varchar(10) NOT NULL,
  `idCliente` int NOT NULL,
  PRIMARY KEY (`idAuditoriaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaClientes`
--

LOCK TABLES `AuditoriaClientes` WRITE;
/*!40000 ALTER TABLE `AuditoriaClientes` DISABLE KEYS */;
INSERT INTO `AuditoriaClientes` VALUES (1,NULL,NULL,NULL,NULL,'adrian','rodriguez','arodriguez@gmail.com','323-222-2222','root@%','2022-08-01','12:45:42',NULL,NULL,NULL,'NUEVO',16),(2,NULL,NULL,NULL,NULL,'jose','perea','jperea@gmail.com','5435-353-345','root@%','2022-08-01','12:45:42',NULL,NULL,NULL,'NUEVO',17),(3,'adrian','rodriguez','arodriguez@gmail.com','323-222-2222','adrian','rodriguez juarez','arodriguez@gmail.com','323-222-2222',NULL,NULL,NULL,'root@%','2022-08-01','12:45:42','EDITAR',16),(4,'jose','perea','jperea@gmail.com','5435-353-345','josé luis','perea','jperea@gmail.com','5435-353-345',NULL,NULL,NULL,'root@%','2022-08-01','12:45:42','EDITAR',17),(5,'adrian','rodriguez juarez',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BORRAR',16);
/*!40000 ALTER TABLE `AuditoriaClientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `idCliente` int NOT NULL,
  `Nombres` varchar(40) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Estado` char(1) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `UI_Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Cort','Cogle','ccogle0@last.fm','269-433-3884','A'),(2,'Petronilla','Foro','pforo1@chicagotribune.com','265-763-9016','A'),(3,'Adeline','Beattie','abeattie2@alexa.com','513-698-3743','A'),(4,'Ruggiero','Rosenfeld','rrosenfeld3@jiathis.com','226-126-2672','B'),(5,'Bernetta','Crews','bcrews4@wikimedia.org','807-436-6134','B'),(6,'Flory','MacMaster','fmacmaster5@wp.com','701-788-0167','A'),(7,'Trey','Patkin','tpatkin6@tamu.edu','360-844-7252','A'),(8,'Dimitry','Markel','dmarkel7@google.co.uk','140-838-7270','A'),(9,'Roxanna','Mara','rmara8@cornell.edu','764-148-6397','A'),(10,'Ailina','Gamage','agamage9@ocn.ne.jp','390-327-2429','A'),(11,'Cully','Cocking','ccockinga@va.gov','748-271-1565','A'),(12,'Correy','Wortt','cworttb@gravatar.com','287-364-0543','A'),(13,'Nikolaus','Tutin','ntutinc@newyorker.com','941-689-1061','A'),(14,'Renate','Tetlow','rtetlowd@slate.com','666-317-3679','A'),(15,'Livvy','Stoeckle','lstoecklee@sakura.ne.jp','300-994-0533','A'),(17,'josé luis','perea','jperea@gmail.com','5435-353-345','A');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compras`
--

DROP TABLE IF EXISTS `Compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Compras` (
  `idCompra` bigint NOT NULL,
  `idProveedor` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `FechaCompra` datetime NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `RefidEmpleado` (`idEmpleado`),
  KEY `RefidProveedor` (`idProveedor`),
  CONSTRAINT `Comp_empl` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleados` (`idEmpleado`),
  CONSTRAINT `Comp_prov` FOREIGN KEY (`idProveedor`) REFERENCES `Proveedores` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras`
--

LOCK TABLES `Compras` WRITE;
/*!40000 ALTER TABLE `Compras` DISABLE KEYS */;
INSERT INTO `Compras` VALUES (1,2,3,'2022-06-28 15:11:02'),(2,1,4,'2022-06-28 15:11:33'),(3,5,4,'2022-06-28 15:11:58'),(4,6,2,'2022-06-28 15:12:58'),(5,7,3,'2022-06-28 15:15:58');
/*!40000 ALTER TABLE `Compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `ComprasProductos`
--

DROP TABLE IF EXISTS `ComprasProductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ComprasProductos` (
  `idCompra` bigint NOT NULL,
  `idProducto` int NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` smallint NOT NULL,
  PRIMARY KEY (`idCompra`,`idProducto`),
  KEY `RefComprasProductos` (`idProducto`),
  KEY `RefidCompras` (`idCompra`),
  CONSTRAINT `Cp_comp` FOREIGN KEY (`idCompra`) REFERENCES `Compras` (`idCompra`),
  CONSTRAINT `Cp_prod` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComprasProductos`
--

LOCK TABLES `ComprasProductos` WRITE;
/*!40000 ALTER TABLE `ComprasProductos` DISABLE KEYS */;
INSERT INTO `ComprasProductos` VALUES (1,1,4800.00,2),(1,3,1800.00,3),(1,5,6000.00,1),(1,6,3600.00,4),(2,1,4800.00,4),(3,1,4800.00,3),(3,4,4200.00,2),(3,6,3600.00,5),(3,10,3600.00,7),(4,1,4800.00,4),(4,10,3600.00,6),(4,11,120000.00,2),(5,1,4800.00,3),(5,10,3600.00,2),(5,15,2400.30,4);
/*!40000 ALTER TABLE `ComprasProductos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `idEmpleado` int NOT NULL,
  `idRol` tinyint NOT NULL,
  `Nombres` varchar(40) NOT NULL,
  `Apellidos` varchar(40) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `FechaIngreso` datetime NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `UniqueIndex_Usuario` (`Usuario`),
  KEY `RefEmpleadoidRol` (`idRol`),
  CONSTRAINT `Empl_rol` FOREIGN KEY (`idRol`) REFERENCES `Roles` (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,2,'Gabriela','Gouth','sgouth0','Y4i5R8Z1j','2022-08-17 15:34:00'),(2,2,'Carlos','Nurny','cnurny1','hx8gPFx0uz','2022-06-29 15:33:02'),(3,2,'Benjamin','Shafier','bshafier2','1rYHuyPpSdv','2022-09-06 13:02:04'),(4,2,'Bautista','Semerad','bsemerad3','yiZSrbL6','2022-04-03 14:02:10'),(5,2,'Blanca','Yellep','byellep4','BgEnqQ','2022-01-18 10:02:21'),(6,2,'Juan','Pentony','jpentony5','4rcZ47Mc','2022-12-12 08:01:02'),(7,2,'Ricardo','Bastone','rbastone6','3L9b2G','2022-10-10 09:02:30'),(8,2,'Liam','Hudson','lhudson7','qSWJGXUsIl','2022-11-07 11:03:06'),(9,2,'Ezequiel','Armer','earmer8','vA8K2ZU8db','2022-04-02 14:03:05'),(10,2,'Florencia','Tunsley','ftunsley9','YsJW8q7N4a','2022-04-13 13:03:07'),(11,2,'Juan','Pentony','jpentony53','4rcZ47Mc','2022-12-12 14:15:03'),(12,2,'Ricardo Jóse','Bastone perez','rbastone63','3L9b2G','2022-10-10 13:11:30'),(13,2,'Liam Nicole','Hudson','lhudson73','qSWJGXUsIl','2022-11-07 11:20:16'),(14,2,'Ezequiel Jose','Armer','earmer83','vA8K2ZU8db','2022-04-02 10:50:05'),(15,1,'Juan','Romero','jromero15','esJW8q7N4a','2022-01-29 10:10:20');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Tabla `MovimientoVentasProductos`
--

DROP TABLE IF EXISTS `MovimientoVentasProductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MovimientoVentasProductos` (
  `idVenta` bigint NOT NULL,
  `idProducto` int NOT NULL,
  `StockAnterior` smallint NOT NULL,
  `Precio` decimal(12,2) NOT NULL,
  `Cantidad` smallint NOT NULL,
  `StockNuevo` smallint NOT NULL,
  `Usuario` varchar(40) DEFAULT NULL,
  `FechaVenta` date DEFAULT NULL,
  `HoraVenta` time DEFAULT NULL,
  `Operacion` varchar(10) NOT NULL,
  PRIMARY KEY (`idVenta`,`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovimientoVentasProductos`
--

LOCK TABLES `MovimientoVentasProductos` WRITE;
/*!40000 ALTER TABLE `MovimientoVentasProductos` DISABLE KEYS */;
INSERT INTO `MovimientoVentasProductos` VALUES (6,3,30,7500.00,25,5,'root@%','2022-08-01','12:45:42','NUEVAVENTA');
/*!40000 ALTER TABLE `MovimientoVentasProductos` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Tabla structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `idProducto` int NOT NULL,
  `idRubro` smallint NOT NULL,
  `producto` varchar(100) NOT NULL,
  `PrecioCosto` decimal(12,2) NOT NULL,
  `PrecioVenta` decimal(12,2) NOT NULL,
  `Stock` int NOT NULL,
  `Estado` char(1) NOT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `UniqueIndex_Producto` (`producto`),
  KEY `RefProductosidRubro` (`idRubro`),
  CONSTRAINT `Prod_rubro` FOREIGN KEY (`idRubro`) REFERENCES `Rubros` (`idRubro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,4,'Disco WD 1Tb',4800.00,8000.00,50,'A'),(2,1,'Impresora Epson Tx241',9000.00,15000.00,40,'A'),(3,2,'Mouse Genius Dx300',1800.00,3000.00,5,'A'),(4,2,'Mouse Logitech G605',4200.00,7000.00,40,'B'),(5,4,'Disco WD Green 480Gb SSD',6000.00,10000.00,55,'A'),(6,5,'Memoria RAM 2GB HyperX Fury',3600.00,6000.00,50,'A'),(7,6,'Monitor 22\" Samsung Dx3',24000.00,40000.00,30,'B'),(8,12,'Pendrive 32 Gb Kingston d300',1200.00,2000.00,45,'A'),(9,6,'Placa de Video GTX 3060 OC',96000.00,160000.00,10,'A'),(10,3,'Teclado Genius KB300',3600.00,6000.00,25,'A'),(11,11,'Notebook HP 15\'6 Intel I3 256 Gb SSD 16 Gb RAM',120000.00,200000.00,6,'A'),(12,5,'Memoria RAM 8GB Kingston ValueRAM DDR3',3000.00,5000.00,20,'A'),(13,12,'Pendrive 16 Gb Kingston x40',7200.00,12000.00,25,'A'),(14,6,'Placa de Video GT 1060 4 Gb',30000.18,50000.30,30,'A'),(15,14,'Modem Tp-Link 300Mb WR-850RE',2400.30,4000.50,40,'A');
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `idProveedor` int NOT NULL,
  `Proveedor` varchar(40) NOT NULL,
  `CUIT` varchar(20) NOT NULL,
  `Estado` char(1) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `UniqueIndex_Proveedor` (`Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (1,'Tucumán Ofertas','20334455663','A'),(2,'Exo Soluciones Informáticas','20151617483','A'),(3,'Ceven','27234242221','A'),(4,'Computronic SRL','20345234241','A'),(5,'Nh Computación','20342532523','A'),(6,'Compuciti','32423423424','B'),(7,'Tecnologic','32423424241','A'),(8,'Amazon','34324324324','A'),(9,'Alum Computación','20343242352','B'),(10,'SYSCOM','20345324324','A'),(11,'Compumaq','22343243242','A'),(12,'Punto Com punto ar','33234234234','A'),(13,'Pronet','23423532522','A'),(14,'Mundo PC','22343242555','B'),(15,'Mercado Libre','22342343245','A');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `idRol` tinyint NOT NULL,
  `Rol` varchar(30) NOT NULL,
  `Estado` char(1) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES (1,'ADMIN','A'),(2,'EMPLEADO','A'),(3,'TEST','A'),(4,'TEST 2','B');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `Rubros`
--

DROP TABLE IF EXISTS `Rubros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rubros` (
  `idRubro` smallint NOT NULL,
  `Rubro` varchar(30) NOT NULL,
  `Estado` char(1) NOT NULL,
  PRIMARY KEY (`idRubro`),
  UNIQUE KEY `UniqueIndex_Rubro` (`Rubro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rubros`
--

LOCK TABLES `Rubros` WRITE;
/*!40000 ALTER TABLE `Rubros` DISABLE KEYS */;
INSERT INTO `Rubros` VALUES (1,'Impresora','A'),(2,'Mouse','A'),(3,'Teclado','A'),(4,'Discos Rigidos','A'),(5,'Memoria RAM','A'),(6,'Placa de Video','A'),(7,'Monitor','A'),(8,'Cables VGA','A'),(9,'Cables HDMI','A'),(10,'Cargador Notebook','A'),(11,'Notebook','A'),(12,'Pendrive','A'),(13,'Procesador','A'),(14,'Modem','A'),(15,'Placa de Red','A');
/*!40000 ALTER TABLE `Rubros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Tabla `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ventas` (
  `idVenta` bigint NOT NULL,
  `idCliente` int NOT NULL,
  `idEmpleado` int NOT NULL,
  `FechaVenta` datetime NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `RefVentasidEmpleado` (`idEmpleado`),
  KEY `RefVentasidCliente` (`idCliente`),
  CONSTRAINT `Venta_Cli` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idCliente`),
  CONSTRAINT `Venta_Empl` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleados` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES (1,1,2,'2022-06-28 15:01:02'),(2,2,2,'2022-06-28 15:02:00'),(3,3,1,'2022-06-28 15:02:31'),(4,3,3,'2022-06-28 15:03:24'),(5,4,4,'2022-06-28 15:04:00'),(6,2,2,'2022-06-28 15:04:59');
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Tabla `VentasProductos`
--

DROP TABLE IF EXISTS `VentasProductos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VentasProductos` (
  `idVenta` bigint NOT NULL,
  `idProducto` int NOT NULL,
  `Precio` decimal(12,2) NOT NULL,
  `Cantidad` smallint NOT NULL,
  PRIMARY KEY (`idVenta`,`idProducto`),
  KEY `RefVentasidProductos` (`idProducto`),
  KEY `RefVentas` (`idVenta`),
  CONSTRAINT `Vp_prod` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`idProducto`),
  CONSTRAINT `Vp_venta` FOREIGN KEY (`idVenta`) REFERENCES `Ventas` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VentasProductos`
--

LOCK TABLES `VentasProductos` WRITE;
/*!40000 ALTER TABLE `VentasProductos` DISABLE KEYS */;
INSERT INTO `VentasProductos` VALUES (1,2,15000.00,1),(2,6,6000.00,2),(2,9,160000.00,1),(3,3,6000.00,3),(4,1,8000.00,2),(4,5,10000.00,1),(4,8,2000.00,4),(4,10,6000.00,3),(5,4,7000.00,2),(5,5,10000.00,1),(6,1,8000.00,2),(6,3,7500.00,25),(6,5,10000.00,1),(6,7,40000.00,1),(6,8,2000.00,4),(6,9,160000.00,1);
/*!40000 ALTER TABLE `VentasProductos` ENABLE KEYS */;
UNLOCK TABLES;


-- Dump completed on 2022-08-01 12:51:12
