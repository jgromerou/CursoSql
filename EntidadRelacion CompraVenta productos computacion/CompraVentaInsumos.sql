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
    producto      VARCHAR(40)       NOT NULL,
    Precio        DECIMAL(12, 2)    NOT NULL,
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


