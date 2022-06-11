--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      gerardo
-- Project :      CompraVentaInsumosCoder.DM1
-- Author :       gerardo
--
-- Date Created : Saturday, June 11, 2022 15:28:12
-- Target DBMS : MySQL 5.x
--
-- CREATE SCHEMA 
CREATE SCHEMA `compraventainsumosromerouro`;
USE `compraventainsumosromerouro`;

-- 
-- TABLE: Clientes 
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
-- TABLE: Compras 
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
-- TABLE: ComprasProductos 
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
-- TABLE: Empleados 
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
-- TABLE: Productos 
--

CREATE TABLE Productos(
    idProducto    INT               NOT NULL,
    idRubro       SMALLINT          NOT NULL,
    producto      VARCHAR(40)       NOT NULL,
    Precio        DECIMAL(12, 2)    NOT NULL,
    Estado        CHAR(1)           NOT NULL,
    PRIMARY KEY (idProducto)
)ENGINE=INNODB
;



-- 
-- TABLE: Proveedores 
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
-- TABLE: Roles 
--

CREATE TABLE Roles(
    idRol     TINYINT        NOT NULL,
    Rol       VARCHAR(30)    NOT NULL,
    Estado    CHAR(1)        NOT NULL,
    PRIMARY KEY (idRol)
)ENGINE=INNODB
;



-- 
-- TABLE: Rubros 
--

CREATE TABLE Rubros(
    idRubro    SMALLINT       NOT NULL,
    Rubro      VARCHAR(30)    NOT NULL,
    Estado     CHAR(1)        NOT NULL,
    PRIMARY KEY (idRubro)
)ENGINE=INNODB
;



-- 
-- TABLE: Ventas 
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
-- TABLE: VentasProductos 
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
-- INDEX: UI_Email 
--

CREATE UNIQUE INDEX UI_Email ON Clientes(Email)
;
-- 
-- INDEX: Ref215 
--

CREATE INDEX Ref215 ON Compras(idEmpleado)
;
-- 
-- INDEX: Ref819 
--

CREATE INDEX Ref819 ON Compras(idProveedor)
;
-- 
-- INDEX: Ref97 
--

CREATE INDEX Ref97 ON ComprasProductos(idProducto)
;
-- 
-- INDEX: Ref38 
--

CREATE INDEX Ref38 ON ComprasProductos(idCompra)
;
-- 
-- INDEX: UI_Usuario 
--

CREATE UNIQUE INDEX UI_Usuario ON Empleados(Usuario)
;
-- 
-- INDEX: Ref12 
--

CREATE INDEX Ref12 ON Empleados(idRol)
;
-- 
-- INDEX: UI_Producto 
--

CREATE UNIQUE INDEX UI_Producto ON Productos(producto)
;
-- 
-- INDEX: Ref104 
--

CREATE INDEX Ref104 ON Productos(idRubro)
;
-- 
-- INDEX: UI_Proveedor 
--

CREATE UNIQUE INDEX UI_Proveedor ON Proveedores(Proveedor)
;
-- 
-- INDEX: UI_Rubro 
--

CREATE UNIQUE INDEX UI_Rubro ON Rubros(Rubro)
;
-- 
-- INDEX: Ref211 
--

CREATE INDEX Ref211 ON Ventas(idEmpleado)
;
-- 
-- INDEX: Ref420 
--

CREATE INDEX Ref420 ON Ventas(idCliente)
;
-- 
-- INDEX: Ref95 
--

CREATE INDEX Ref95 ON VentasProductos(idProducto)
;
-- 
-- INDEX: Ref56 
--

CREATE INDEX Ref56 ON VentasProductos(idVenta)
;
-- 
-- TABLE: Compras 
--

ALTER TABLE Compras ADD CONSTRAINT RefEmpleados15 
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleados(idEmpleado)
;

ALTER TABLE Compras ADD CONSTRAINT RefProveedores19 
    FOREIGN KEY (idProveedor)
    REFERENCES Proveedores(idProveedor)
;


-- 
-- TABLE: ComprasProductos 
--

ALTER TABLE ComprasProductos ADD CONSTRAINT RefProductos7 
    FOREIGN KEY (idProducto)
    REFERENCES Productos(idProducto)
;

ALTER TABLE ComprasProductos ADD CONSTRAINT RefCompras8 
    FOREIGN KEY (idCompra)
    REFERENCES Compras(idCompra)
;


-- 
-- TABLE: Empleados 
--

ALTER TABLE Empleados ADD CONSTRAINT RefRoles2 
    FOREIGN KEY (idRol)
    REFERENCES Roles(idRol)
;


-- 
-- TABLE: Productos 
--

ALTER TABLE Productos ADD CONSTRAINT RefRubros4 
    FOREIGN KEY (idRubro)
    REFERENCES Rubros(idRubro)
;


-- 
-- TABLE: Ventas 
--

ALTER TABLE Ventas ADD CONSTRAINT RefEmpleados11 
    FOREIGN KEY (idEmpleado)
    REFERENCES Empleados(idEmpleado)
;

ALTER TABLE Ventas ADD CONSTRAINT RefClientes20 
    FOREIGN KEY (idCliente)
    REFERENCES Clientes(idCliente)
;


-- 
-- TABLE: VentasProductos 
--

ALTER TABLE VentasProductos ADD CONSTRAINT RefProductos5 
    FOREIGN KEY (idProducto)
    REFERENCES Productos(idProducto)
;

ALTER TABLE VentasProductos ADD CONSTRAINT RefVentas6 
    FOREIGN KEY (idVenta)
    REFERENCES Ventas(idVenta)
;


