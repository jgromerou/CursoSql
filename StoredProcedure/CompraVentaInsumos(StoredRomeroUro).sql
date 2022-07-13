-- CREAR SCHEMA 
CREATE SCHEMA `compraventainsumosromerouro`;
USE `compraventainsumosromerouro`;

-- 
-- TABLA: Clientes 
--

CREATE TABLE Clientes(
    idCliente    INT            NOT NULL,
    Nombres      VARCHAR(40)    NOT NULL,
    Apellidos    VARCHAR(40)    NOT NULL,
    Email        VARCHAR(50)    NOT NULL,
    Telefono     VARCHAR(15)    NOT NULL,
    Estado       CHAR(1)        NOT NULL,
    PRIMARY KEY (idCliente)
)ENGINE=INNODB
;



-- 
-- TABLA: Compras 
--

CREATE TABLE Compras(
    idCompra       BIGINT      NOT NULL,
    idProveedor    INT         NOT NULL,
    idEmpleado     INT         NOT NULL,
    FechaCompra    DATETIME    NOT NULL,
    PRIMARY KEY (idCompra)
)ENGINE=INNODB
;



-- 
-- TABLA: ComprasProductos 
--

CREATE TABLE ComprasProductos(
    idCompra      BIGINT            NOT NULL,
    idProducto    INT               NOT NULL,
    Precio        DECIMAL(10, 2)    NOT NULL,
    Cantidad      SMALLINT          NOT NULL,
    PRIMARY KEY (idCompra, idProducto)
)ENGINE=INNODB
;



-- 
-- TABLA: Empleados 
--

CREATE TABLE Empleados(
    idEmpleado      INT            NOT NULL,
    idRol           TINYINT        NOT NULL,
    Nombres         VARCHAR(40)    NOT NULL,
    Apellidos       VARCHAR(40)    NOT NULL,
    Usuario         VARCHAR(30)    NOT NULL,
    Password        VARCHAR(64)    NOT NULL,
    FechaIngreso    DATETIME       NOT NULL,
    PRIMARY KEY (idEmpleado)
)ENGINE=INNODB
;



-- 
-- TABLA: Productos 
--

CREATE TABLE Productos(
    idProducto    INT               NOT NULL,
    idRubro       SMALLINT          NOT NULL,
    producto	   VARCHAR(100)      NOT NULL,
    PrecioCosto   DECIMAL(12,2)     NOT NULL,
    PrecioVenta   DECIMAL(12,2)     NOT NULL,
    Stock 	   INT               NOT NULL,
    Estado        CHAR(1)           NOT NULL,
    PRIMARY KEY (idProducto)
)ENGINE=INNODB
;



-- 
-- TABLA: Proveedores 
--

CREATE TABLE Proveedores(
    idProveedor    INT            NOT NULL,
    Proveedor      VARCHAR(40)    NOT NULL,
    CUIT           VARCHAR(20)    NOT NULL,
    Estado         CHAR(1)        NOT NULL,
    PRIMARY KEY (idProveedor)
)ENGINE=INNODB
;



-- 
-- TABLA: Roles 
--

CREATE TABLE Roles(
    idRol     TINYINT        NOT NULL,
    Rol       VARCHAR(30)    NOT NULL,
    Estado    CHAR(1)        NOT NULL,
    PRIMARY KEY (idRol)
)ENGINE=INNODB
;



-- 
-- TABLA: Rubros 
--

CREATE TABLE Rubros(
    idRubro    SMALLINT       NOT NULL,
    Rubro      VARCHAR(30)    NOT NULL,
    Estado     CHAR(1)        NOT NULL,
    PRIMARY KEY (idRubro)
)ENGINE=INNODB
;



-- 
-- TABLA: Ventas 
--

CREATE TABLE Ventas(
    idVenta       BIGINT      NOT NULL,
    idCliente     INT         NOT NULL,
    idEmpleado    INT         NOT NULL,
    FechaVenta    DATETIME    NOT NULL,
    PRIMARY KEY (idVenta)
)ENGINE=INNODB
;



-- 
-- TABLA: VentasProductos 
--

CREATE TABLE VentasProductos(
    idVenta       BIGINT            NOT NULL,
    idProducto    INT               NOT NULL,
    Precio        DECIMAL(12, 2)    NOT NULL,
    Cantidad      SMALLINT          NOT NULL,
    PRIMARY KEY (idVenta, idProducto)
)ENGINE=INNODB
;



-- 
-- INDEX: UniqueIndex_Email 
--

CREATE UNIQUE INDEX UI_Email ON Clientes(Email)
;
-- 
-- INDEX: RefidEmpleado 
--

CREATE INDEX RefidEmpleado ON Compras(idEmpleado)
;
-- 
-- INDEX: RefidProveedor 
--

CREATE INDEX RefidProveedor ON Compras(idProveedor)
;
-- 
-- INDEX: RefComprasProductos 
--

CREATE INDEX RefComprasProductos ON ComprasProductos(idProducto)
;
-- 
-- INDEX: RefidCompras 
--

CREATE INDEX RefidCompras ON ComprasProductos(idCompra)
;
-- 
-- INDEX: UniqueIndex_Usuario 
--

CREATE UNIQUE INDEX UniqueIndex_Usuario ON Empleados(Usuario)
;
-- 
-- INDEX: RefEmpleadoidRol 
--

CREATE INDEX RefEmpleadoidRol ON Empleados(idRol)
;
-- 
-- INDEX: UniqueIndex_Producto 
--

CREATE UNIQUE INDEX UniqueIndex_Producto ON Productos(producto)
;
-- 
-- INDEX: RefProductosidRubro 
--

CREATE INDEX RefProductosidRubro ON Productos(idRubro)
;
-- 
-- INDEX: UniqueIndex_Proveedor 
--

CREATE UNIQUE INDEX UniqueIndex_Proveedor ON Proveedores(Proveedor)
;
-- 
-- INDEX: UniqueIndex_Rubro 
--

CREATE UNIQUE INDEX UniqueIndex_Rubro ON Rubros(Rubro)
;
-- 
-- INDEX: RefVentasidEmpleado 
--

CREATE INDEX RefVentasidEmpleado ON Ventas(idEmpleado)
;
-- 
-- INDEX: RefVentasidCliente 
--

CREATE INDEX RefVentasidCliente ON Ventas(idCliente)
;
-- 
-- INDEX: RefVentasidProductos 
--

CREATE INDEX RefVentasidProductos ON VentasProductos(idProducto)
;
-- 
-- INDEX: RefVentas 
--

CREATE INDEX RefVentas ON VentasProductos(idVenta)
;
-- 
-- Tabla: Compras 
--

ALTER TABLE Compras ADD CONSTRAINT Comp_empl
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleados(idEmpleado)
;

ALTER TABLE Compras ADD CONSTRAINT Comp_prov 
    FOREIGN KEY (idProveedor)
    REFERENCES Proveedores(idProveedor)
;


-- 
-- Tabla: ComprasProductos 
--

ALTER TABLE ComprasProductos ADD CONSTRAINT Cp_prod 
    FOREIGN KEY (idProducto)
    REFERENCES Productos(idProducto)
;

ALTER TABLE ComprasProductos ADD CONSTRAINT Cp_comp 
    FOREIGN KEY (idCompra)
    REFERENCES Compras(idCompra)
;


-- 
-- Tabla: Empleados 
--

ALTER TABLE Empleados ADD CONSTRAINT Empl_rol 
    FOREIGN KEY (idRol)
    REFERENCES Roles(idRol)
;


-- 
-- Tabla: Productos 
--

ALTER TABLE Productos ADD CONSTRAINT Prod_rubro 
    FOREIGN KEY (idRubro)
    REFERENCES Rubros(idRubro)
;


-- 
-- Tabla: Ventas 
--

ALTER TABLE Ventas ADD CONSTRAINT Venta_Empl
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleados(idEmpleado)
;

ALTER TABLE Ventas ADD CONSTRAINT Venta_Cli 
    FOREIGN KEY (idCliente)
    REFERENCES Clientes(idCliente)
;


-- 
-- Tabla: VentasProductos 
--

ALTER TABLE VentasProductos ADD CONSTRAINT Vp_prod 
    FOREIGN KEY (idProducto)
    REFERENCES Productos(idProducto)
;

ALTER TABLE VentasProductos ADD CONSTRAINT Vp_venta 
    FOREIGN KEY (idVenta)
    REFERENCES Ventas(idVenta)
;

INSERT INTO `Roles` (`idRol`,`Rol`,`Estado`) VALUES (1,'ADMIN','A');
INSERT INTO `Roles` (`idRol`,`Rol`,`Estado`) VALUES (2,'EMPLEADO','A');
INSERT INTO `Roles` (`idRol`,`Rol`,`Estado`) VALUES (3,'TEST','A');
INSERT INTO `Roles` (`idRol`,`Rol`,`Estado`) VALUES (4,'TEST 2','B');

INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (1,2,'Gabriela','Gouth','sgouth0','Y4i5R8Z1j','2022-08-17 15:34:00');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (2,2,'Carlos','Nurny','cnurny1','hx8gPFx0uz','2022-06-29 15:33:02');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (3,2,'Benjamin','Shafier','bshafier2','1rYHuyPpSdv','2022-09-06 13:02:04');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (4,2,'Bautista','Semerad','bsemerad3','yiZSrbL6','2022-04-03 14:02:10');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (5,2,'Blanca','Yellep','byellep4','BgEnqQ','2022-01-18 10:02:21');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (6,2,'Juan','Pentony','jpentony5','4rcZ47Mc','2022-12-12 08:01:02');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (7,2,'Ricardo','Bastone','rbastone6','3L9b2G','2022-10-10 09:02:30');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (8,2,'Liam','Hudson','lhudson7','qSWJGXUsIl','2022-11-07 11:03:06');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (9,2,'Ezequiel','Armer','earmer8','vA8K2ZU8db','2022-04-02 14:03:05');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (10,2,'Florencia','Tunsley','ftunsley9','YsJW8q7N4a','2022-04-13 13:03:07');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (11,2,'Juan','Pentony','jpentony53','4rcZ47Mc','2022-12-12 14:15:03');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (12,2,'Ricardo Jóse','Bastone perez','rbastone63','3L9b2G','2022-10-10 13:11:30');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (13,2,'Liam Nicole','Hudson','lhudson73','qSWJGXUsIl','2022-11-07 11:20:16');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (14,2,'Ezequiel Jose','Armer','earmer83','vA8K2ZU8db','2022-04-02 10:50:05');
INSERT INTO `Empleados` (`idEmpleado`,`idRol`,`Nombres`,`Apellidos`,`Usuario`,`Password`,`FechaIngreso`) VALUES (15,1,'Juan','Romero','jromero15','esJW8q7N4a','2022-01-29 10:10:20');

INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (1,'Tucumán Ofertas','20334455663','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (2,'Exo Soluciones Informáticas','20151617483','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (3,'Ceven','27234242221','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (4,'Computronic SRL','20345234241','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (5,'Nh Computación','20342532523','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (6,'Compuciti','32423423424','B');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (7,'Tecnologic','32423424241','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (8,'Amazon','34324324324','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (9,'Alum Computación','20343242352','B');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (10,'SYSCOM','20345324324','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (11,'Compumaq','22343243242','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (12,'Punto Com punto ar','33234234234','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (13,'Pronet','23423532522','A');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (14,'Mundo PC','22343242555','B');
INSERT INTO `Proveedores` (`idProveedor`,`Proveedor`,`CUIT`,`Estado`) VALUES (15,'Mercado Libre','22342343245','A');

INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (1,'Cort','Cogle','ccogle0@last.fm','269-433-3884','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (2,'Petronilla','Foro','pforo1@chicagotribune.com','265-763-9016','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (3,'Adeline','Beattie','abeattie2@alexa.com','513-698-3743','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (4,'Ruggiero','Rosenfeld','rrosenfeld3@jiathis.com','226-126-2672','B');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (5,'Bernetta','Crews','bcrews4@wikimedia.org','807-436-6134','B');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (6,'Flory','MacMaster','fmacmaster5@wp.com','701-788-0167','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (7,'Trey','Patkin','tpatkin6@tamu.edu','360-844-7252','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (8,'Dimitry','Markel','dmarkel7@google.co.uk','140-838-7270','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (9,'Roxanna','Mara','rmara8@cornell.edu','764-148-6397','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (10,'Ailina','Gamage','agamage9@ocn.ne.jp','390-327-2429','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (11,'Cully','Cocking','ccockinga@va.gov','748-271-1565','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (12,'Correy','Wortt','cworttb@gravatar.com','287-364-0543','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (13,'Nikolaus','Tutin','ntutinc@newyorker.com','941-689-1061','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (14,'Renate','Tetlow','rtetlowd@slate.com','666-317-3679','A');
INSERT INTO `Clientes` (`idCliente`,`Nombres`,`Apellidos`,`Email`,`Telefono`,`Estado`) VALUES (15,'Livvy','Stoeckle','lstoecklee@sakura.ne.jp','300-994-0533','A');

INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (1,'Impresora','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (2,'Mouse','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (3,'Teclado','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (4,'Discos Rigidos','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (5,'Memoria RAM','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (6,'Placa de Video','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (7,'Monitor','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (8,'Cables VGA','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (9,'Cables HDMI','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (10,'Cargador Notebook','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (11,'Notebook','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (12,'Pendrive','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (13,'Procesador','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (14,'Modem','A');
INSERT INTO `Rubros` (`idRubro`,`Rubro`,`Estado`) VALUES (15,'Placa de Red','A');

INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (1,4,'Disco WD 1Tb',4800.00,8000.00,50,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (2,1,'Impresora Epson Tx241',9000.00,15000.00,40,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (3,2,'Mouse Genius Dx300',1800.00,3000.00,30,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (4,2,'Mouse Logitech G605',4200.00,7000.00,40,'B');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (5,4,'Disco WD Green 480Gb SSD',6000.00,10000.00,55,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (6,5,'Memoria RAM 2GB HyperX Fury',3600.00,6000.00,50,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (7,6,'Monitor 22\" Samsung Dx3',24000.00,40000.00,30,'B');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (8,12,'Pendrive 32 Gb Kingston d300',1200.00,2000.00,45,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (9,6,'Placa de Video GTX 3060 OC',96000.00,160000.00,10,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (10,3,'Teclado Genius KB300',3600.00,6000.00,25,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (11,11,'Notebook HP 15\'6 Intel I3 256 Gb SSD 16 Gb RAM',120000.00,200000.00,6,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (12,5,'Memoria RAM 8GB Kingston ValueRAM DDR3',3000.00,5000.00,20,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (13,12,'Pendrive 16 Gb Kingston x40',7200.00,12000.00,25,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (14,6,'Placa de Video GT 1060 4 Gb',30000.18,50000.30,30,'A');
INSERT INTO `Productos` (`idProducto`,`idRubro`,`producto`,`PrecioCosto`,`PrecioVenta`,`Stock`,`Estado`) VALUES (15,14,'Modem Tp-Link 300Mb WR-850RE',2400.30,4000.50,40,'A');

INSERT INTO `Compras` (`idCompra`,`idProveedor`,`idEmpleado`,`FechaCompra`) VALUES (1,2,3,'2022-06-28 15:11:02');
INSERT INTO `Compras` (`idCompra`,`idProveedor`,`idEmpleado`,`FechaCompra`) VALUES (2,1,4,'2022-06-28 15:11:33');
INSERT INTO `Compras` (`idCompra`,`idProveedor`,`idEmpleado`,`FechaCompra`) VALUES (3,5,4,'2022-06-28 15:11:58');
INSERT INTO `Compras` (`idCompra`,`idProveedor`,`idEmpleado`,`FechaCompra`) VALUES (4,6,2,'2022-06-28 15:12:58');
INSERT INTO `Compras` (`idCompra`,`idProveedor`,`idEmpleado`,`FechaCompra`) VALUES (5,7,3,'2022-06-28 15:15:58');

INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (1,1,4800.00,2);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (1,3,1800.00,3);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (1,5,6000.00,1);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (1,6,3600.00,4);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (2,1,4800.00,4);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (3,1,4800.00,3);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (3,4,4200.00,2);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (3,6,3600.00,5);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (3,10,3600.00,7);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,1,4800.00,4);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,10,3600.00,6);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,11,120000.00,2);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (5,1,4800.00,3);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (5,10,3600.00,2);
INSERT INTO `ComprasProductos` (`idCompra`,`idProducto`,`Precio`,`Cantidad`) VALUES (5,15,2400.30,4);

INSERT INTO `Ventas` (`idVenta`,`idCliente`,`idEmpleado`,`FechaVenta`) VALUES (1,1,2,'2022-06-28 15:01:02');
INSERT INTO `Ventas` (`idVenta`,`idCliente`,`idEmpleado`,`FechaVenta`) VALUES (2,2,2,'2022-06-28 15:02:00');
INSERT INTO `Ventas` (`idVenta`,`idCliente`,`idEmpleado`,`FechaVenta`) VALUES (3,3,1,'2022-06-28 15:02:31');
INSERT INTO `Ventas` (`idVenta`,`idCliente`,`idEmpleado`,`FechaVenta`) VALUES (4,3,3,'2022-06-28 15:03:24');
INSERT INTO `Ventas` (`idVenta`,`idCliente`,`idEmpleado`,`FechaVenta`) VALUES (5,4,4,'2022-06-28 15:04:00');
INSERT INTO `Ventas` (`idVenta`,`idCliente`,`idEmpleado`,`FechaVenta`) VALUES (6,2,2,'2022-06-28 15:04:59');

INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (1,2,15000.00,1);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (2,6,6000.00,2);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (2,9,160000.00,1);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (3,3,6000.00,3);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,1,8000.00,2);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,5,10000.00,1);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,8,2000.00,4);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (4,10,6000.00,3);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (5,4,7000.00,2);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (5,5,10000.00,1);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (6,1,8000.00,2);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (6,5,10000.00,1);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (6,7,40000.00,1);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (6,8,2000.00,4);
INSERT INTO `VentasProductos` (`idVenta`,`idProducto`,`Precio`,`Cantidad`) VALUES (6,9,160000.00,1);

/* Desafío Creación de Vistas Romero Uro*/

/*Total de Proveedores*/
CREATE OR REPLACE VIEW TotalProveedores AS
	(SELECT COUNT(*) AS TotalProveedores FROM Proveedores);

/*Nombres y Apellidos de Clientes dados de Baja */
CREATE OR REPLACE VIEW NombresApellidosClientesBaja AS
	(SELECT DISTINCT c.Nombres,c.Apellidos  FROM Clientes c WHERE c.Estado = 'B'); 

/* Mostrar los Empleados con roles activos */
CREATE OR REPLACE VIEW MostrarEmpleadosRolActivo AS
	(SELECT *
	FROM   Empleados
	WHERE  idRol IN (SELECT idRol FROM Roles WHERE Estado = 'A')
	ORDER BY Empleados.idEmpleado);


/*Obtener el total de las ventas por el rango de fechas y por el nombre de Empleados*/
/*Por ejemplo: Ventas del mes de Junio del año 2022 de los empleados llamados Carlos */
CREATE OR REPLACE VIEW VentasMesJunio2022deCarlos AS
	(SELECT 
        v.FechaVenta AS FechaVenta,
        v.idVenta AS idVenta,
        v.idEmpleado AS NroEmpleado,
        e.Nombres AS Nombres,
        e.Apellidos AS Apellidos
    FROM
        (Ventas v
        JOIN Empleados e 
			ON ((v.idEmpleado = e.idEmpleado)))
    WHERE
        ((v.FechaVenta BETWEEN '20220601' AND '20220630')
            AND (e.Nombres LIKE '%Carlos%'))
    ORDER BY v.FechaVenta);

/*Precio Total por Venta*/
CREATE OR REPLACE VIEW PrecioTotaldeVentas AS 
	(SELECT 
        v.idVenta AS idVenta,
        SUM(vp.Precio) AS PrecioTotal
    FROM
        (Ventas v
        JOIN VentasProductos vp 
			ON (v.idVenta = vp.idVenta))
    GROUP BY v.idVenta);
    
/* Desafío Funciones Formato Romero Uro*/
/*Para saber el Estado de un Proveedor*/
DELIMITER $$
CREATE FUNCTION saberEstadoProveedor(pnombre char(40))
RETURNS CHAR(255)
READS SQL DATA
BEGIN
	DECLARE cantidad int DEFAULT 0;
    SET cantidad = (SELECT count(*) FROM Proveedores WHERE Proveedor=pnombre AND Estado='A');
    IF(cantidad=1) THEN
		RETURN CONCAT('El proveedor ',pnombre,' está activo');
	ELSE
		RETURN CONCAT('El proveedor ',pnombre,' no está activo');
	END IF;
END $$
/*Para saber cuantas ventas hizo un/a empleado/a por su nombre */
-- Eliminar función saberVentasEmpleadoporsunombre
-- DROP FUNCTION IF EXISTS saberVentasEmpleadoporsuNombre;
DELIMITER $$
CREATE FUNCTION saberVentasEmpleadoporsuNombre(pnombre char(40))
RETURNS CHAR(255)
READS SQL DATA
BEGIN
	DECLARE cantidad int DEFAULT 0;
    SET cantidad = (SELECT count(*) FROM Ventas v 
    			INNER JOIN Empleados e 
    			ON v.idEmpleado = e.idEmpleado
    			WHERE e.Nombres=pnombre);
		RETURN CONCAT('',pnombre,' realizó ',cantidad,' ventas');
END $$

-- Verficamos saber Estado de un Proveedor
-- SELECT saberEstadoProveedor('Compuciti') as EstadoProveedor;
-- SELECT saberEstadoProveedor('Ceven') as EstadoProveedor;

-- Verficamos saber Ventas de Empleado por su nombre
-- SELECT saberVentasEmpleadoporsuNombre('Carlos') as VentasNombreEmpleado;
-- SELECT saberVentasEmpleadoporsuNombre('Gabriela') as VentasNombreEmpleado;
-- SELECT saberVentasEmpleadoporsuNombre('Gerardo') as VentasNombreEmpleado;

/*-----------------------------------------------------------------------------------------------------------*/
/*-----------------------------------------------------------------------------------------------------------*/
/*Desafío Stored Romero Uro*/
/*1° Stored Procedure: Permite indicar a través de un parámetro el campo de ordenamiento de una tabla
y mediante un segundo parámetro, si el orden es Ascendente o Descendente.*/ 
/*ASC o DESC*/
DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `sp_get_empleados_ordenamiento`(
	IN field CHAR(20),
    IN orden CHAR(4)
)
BEGIN
	IF field <>  '' THEN
		SET @rubro_order = concat('ORDER BY ',field,' ',orden,'');
	ELSE
		SET @rubro_order = '';
	END IF;
    SET @clausula = concat('SELECT * FROM Empleados ',@rubro_order);
	PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END$$

/*2° Stored Procedure: Permite ingresar un nuevo rubro*/ 
/*Parámetros a ingresar son: Rubro, Estado(A:Alta, B:Baja)*/
DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `sp_insert_rubro`(
	IN prubro CHAR(30),
    IN pestado CHAR(1)
)
BEGIN
	DECLARE ultimoIDmasuno smallint;
	SET @clausula = concat('SELECT MAX(idRubro) FROM Rubros INTO @ultimoID');
	PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
    set ultimoIDmasuno=@ultimoID+1;
   SET @ftexsql=CONCAT('INSERT INTO Rubros (idRubro,Rubro,Estado) VALUES (',"'",CAST(ultimoIDmasuno AS CHAR),"','",prubro,"','",pestado,"')");
	PREPARE fordsql FROM @ftexsql;
    EXECUTE fordsql;
    DEALLOCATE PREPARE fordsql;
     SELECT 'Se ingresó satisfactoriamente el nuevo rubro de Nombre:',prubro,'con el ID: ',ultimoIDmasuno,'';
END$$

/*3° Stored Procedure: Permite Eliminar un rubro por su ID*/ 
/*Parámetros a ingresar son: ID del rubro*/
DELIMITER $$
CREATE DEFINER=`root`@`%` PROCEDURE `sp_delete_rubro`(
	IN pidrubro CHAR(8)
)
BEGIN
   SET @ftexsql=CONCAT('DELETE FROM Rubros WHERE idRubro=(',pidrubro,')');
	PREPARE fordsql FROM @ftexsql;
    EXECUTE fordsql;
    DEALLOCATE PREPARE fordsql;
     SELECT 'Se eliminó satisfactoriamente el rubro de ID:',pidrubro,'';
END$$

-- Verificamos el 1° Stored Procedure
call compraventainsumosromerouro.sp_get_empleados_ordenamiento('Apellidos', 'DESC');
call compraventainsumosromerouro.sp_get_empleados_ordenamiento('Nombres', 'ASC');

-- Verificamos el 2° Stored Procedure
call compraventainsumosromerouro.sp_insert_rubro('ESCRITORIO DE PC', 'A');
call compraventainsumosromerouro.sp_insert_rubro('SILLA GAMER', 'B');

-- Verificamos el 3° Stored Procedure
call compraventainsumosromerouro.sp_delete_rubro('15');
 
