create or replace view V_VENTAS_RESUMEN as
select 
hv.id_producto,
sum(hv.cantidad) as cantidad,
sum(hv.monto) as monto,
sum(hv.total) as total,
hv.est_venta
from 
hechos_ventas hv 
group by 
hv.id_producto,
hv.est_venta;


select * from v_ventas_resumen vvr 































































