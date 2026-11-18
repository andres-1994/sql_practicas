create
or replace view V_VENTAS_RESUMEN as
select
    hv.id_producto,
    p.producto,
    p.marca,
    sum(hv.cantidad) as cantidad,
    sum(hv.monto) as monto,
    sum(hv.total) as total,
    hv.est_venta,
    date(hv.fecha_ins) as fecha_venta
from
    hechos_ventas hv
    inner join producto p on hv.id_producto = p.id_producto
where
    hv.est_venta = 'REND'
group by
    hv.id_producto,
    p.producto,
    p.marca,
    hv.est_venta,
    date(hv.fecha_ins);

-- select * from v_ventas_resumen vvr