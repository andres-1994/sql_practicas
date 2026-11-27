create or replace
view V_PRODUCTOS
as
select
	PROD.*,
	M.marca_descripcion
from
	PRODUCTO PROD
	inner join marcas M
	on prod.marca_codigo = m.marca_codigo
where
	prod.tipo_producto = 'PROD'
;


