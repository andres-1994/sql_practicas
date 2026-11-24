create or replace
view V_PRODUCTOS
as
select
	*
from
	PRODUCTO PROD
where
	prod.tipo_producto = 'PROD'
;


