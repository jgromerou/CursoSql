/*Desafió Sentencias*/
use mysql;
SELECT * FROM user;

/*Creación de usuarios nuevos*/
CREATE USER usuarioLectura@127.0.0.1 IDENTIFIED BY 'Clave123!';
CREATE USER usuarioCRU@127.0.0.1 IDENTIFIED BY 'Clave123!';

/*Permiso de sólo lectura*/
GRANT SELECT ON *.* TO usuarioLectura@127.0.0.1;

/*Permiso de lectura,inserción y modificación*/
GRANT SELECT, INSERT, UPDATE ON *.* TO usuarioCRU@127.0.0.1;

/*Revocar permisos de eliminar registros de tablas*/
REVOKE DELETE ON *.* FROM usuarioLectura@127.0.0.1;
REVOKE DELETE ON *.* FROM usuarioCRU@127.0.0.1;

/*Mostrar los permisos de los nuevos usuarios */
-- SHOW GRANTS FOR usuarioLectura@127.0.0.1;
-- SHOW GRANTS FOR usuarioCRU@127.0.0.1;
