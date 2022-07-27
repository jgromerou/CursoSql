/* Desafío TCL - Romero Uro */

SET AUTOCOMMIT = 0;
-- SELECT @@AUTOCOMMIT;

/* Tabla VentasProductos */
START TRANSACTION;
	DELETE FROM VentasProductos WHERE idVenta = 6 AND idProducto=9;
-- ROLLBACK;
-- COMMIT;

/* Tabla ComprasProductos */
START TRANSACTION;
	INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,2,2500,3);
	INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,3,2600,2);
	INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,4,2700,1);
    INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,5,3000,4);
SAVEPOINT LOTE_1;
    INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,6,1500,5);
    INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,7,3500,6);
    INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,8,5500,7);
	INSERT INTO ComprasProductos (idCompra,idProducto,Precio,Cantidad) VALUES (5,9,3500,8);
SAVEPOINT LOTE_2;
-- RELEASE SAVEPOINT LOTE_1;
-- ROLLBACK TO LOTE_1; /*Para Verificar que ya no existe el SAVEPOINT LOTE_1*/