create or replace view V_VENTAS_RESUMEN as
select 
hv.id_producto,
p.producto,
sum(hv.cantidad) as cantidad,
sum(hv.monto) as monto,
sum(hv.total) as total,
hv.est_venta
from 
hechos_ventas hv 
inner join producto p 
on hv.id_producto = p.id_producto
where 
hv.est_venta = 'REND'
group by 
hv.id_producto,
p.producto,
hv.est_venta;


-- select * from v_ventas_resumen vvr 































































