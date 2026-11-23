DELIMITER //

CREATE PROCEDURE ObtenerProductosFecha
(
	IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
	SELECT * FROM hechos_ventas  WHERE fecha BETWEEN fecha_inicio AND fecha_fin;
END //
DELIMITER ;

CALL ObtenerProductosFecha('20240131','20241130');