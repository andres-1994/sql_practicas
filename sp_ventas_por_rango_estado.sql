-- 0) Asegúrate de estar en la base correcta
-- USE tu_base;

-- 1) Limpieza por si existía
DROP PROCEDURE IF EXISTS sp_ventas_por_rango_estado;

-- 2) Cambiar delimitador para que MySQL no corte el bloque en cada ;
DELIMITER $$

-- 3) Crear el procedimiento
CREATE PROCEDURE sp_ventas_por_rango_estado(
    IN p_fecha_ini DATE,
    IN p_fecha_fin DATE,
    IN p_estado_producto VARCHAR(20)   -- sin DEFAULT: MySQL no admite default en params de SP
)
BEGIN
    -- Si no pasan estado o viene vacío, usamos 'activo'
    IF p_estado_producto IS NULL OR p_estado_producto = '' THEN
        SET p_estado_producto = 'activo';
    END IF;

    SELECT 
        hv.id_venta,
        DATE(hv.fecha_ins)             AS fecha_venta,
        v.id_vendedor,
        v.vendedor,
        v.sucursal_vendedor            AS sucursal,
        p.id_producto,
        p.producto,
        c.categoria,
        s.subcategoria,
        hv.cantidad,
        hv.monto,
        hv.total,
        hv.forma_pago
    FROM hechos_ventas hv
    JOIN vendedor    v ON v.id_vendedor      = hv.id_vendedor
    JOIN producto    p ON p.id_producto      = hv.id_producto
    LEFT JOIN subcategoria s ON s.subcategoria_id = p.subcategoria_id
    LEFT JOIN categorias  c ON c.id_categoria     = s.id_categoria
    WHERE DATE(hv.fecha_ins) BETWEEN p_fecha_ini AND p_fecha_fin
      AND p.estado_producto = p_estado_producto;
END$$

-- 4) Volver al delimitador normal
DELIMITER ;
