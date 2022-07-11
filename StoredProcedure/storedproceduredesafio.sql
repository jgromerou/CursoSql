use compraventainsumosromerouro;

/*Permite indicar a través de un parámetro el campo de ordenamiento de una tabla
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