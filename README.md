## Integrantes
#### Andrey Jerez Rubio
#### Alejandro Jimenez

### Consultas sobre una tabla

1

```sql
SELECT 
    o.codigo_oficina,
    o.ciudad
FROM 
    oficinas o;
```

2

```SQL
SELECT
	o.ciudad,
	o.telefono
FROM
	oficinas o
WHERE
	o.ciudad = "España";
```

3

```sql
SELECT
	e.nombre,
	e.apellido1,
	e.apellido2,
	e.email
FROM
	empleados e
WHERE
	e.codigo_jefe = "7";
```

4

```sql
SELECT
	e.nombre,
	e.apellidos,
	e.email,
	e.codigo_jefe,
	e.puesto
FROM
	empleados e;
```

5

```SQL
SELECT
	e.nombre,
	e.apellidos
FROM
	empleados e
WHERE
	e.puesto NOT IN ("representantes de ventas");
```

6

```SQL
SELECT
	c.nombre
FROM
	clientes c
WHERE
	c.ciudad NOT IN ("España");
```

7

```SQL
SELECT
	p.estado
FROM
	pedidos p;
```

8.1

```SQL
SELECT
	p.codigo_cliente,
	p.fecha_pago,
	COUNT(p.codigo_cliente)
FROM
	pagos p
WHERE
	p.fecha_pago >= YEAR("2008-01-01") AND p.fecha_pago <= YEAR("2008-12-31")
GROUP BY
	p.codigo_cliente, p.fecha_pago;
```

8.2

```SQL
SELECT
	p.codigo_cliente,
	p.fecha_pago,
	COUNT(p.codigo_cliente)
FROM
	pagos p
WHERE
	"2008" = DATE_FORMAT(p.fecha_pago,"%Y")
GROUP BY
	p.codigo_cliente, p.fecha_pago;
```

8.3

```SQL
SELECT
	p.codigo_cliente,
	p.fecha_pago,
	COUNT(p.codigo_cliente)
FROM
	pagos p
WHERE
	p.fecha_pago LIKE "%2008"
GROUP BY
	p.codigo_cliente, p.fecha_pago;
```

9

```SQL
SELECT
	p.codigo_pedido,
	p.codigo_cliente,
	p.fecha_esperada,
	p.fecha_entrega
FROM
	pedidos p
WHERE
	p.fecha_entrega > NOW();
```

10.1

```SQL
SELECT
	p.codigo_pedido,
	p.codigo_cliente,
	p.fecha_esperada,
	p.fecha_entrega
FROM
	pedidos p
WHERE
	ADDDATE(p.fecha_entrega, -2) < p.fecha_esperada;
```

10.2

```SQL
SELECT
	p.codigo_pedido,
	p.codigo_cliente,
	p.fecha_esperada,
	p.fecha_entrega
FROM
	pedidos p
WHERE
	DATEDIFF(p.fecha_esperada,p.fecha_entrega) < 2;
```

10.3

```SQL
SELECT
	p.codigo_pedido,
	p.codigo_cliente,
	p.fecha_esperada,
	p.fecha_entrega
FROM
	pedidos p
WHERE
	;
```

11

```SQL
SELECT
	p.codigo_pedido,
	p.fecha_pedido,
	p.estado
FROM
	pedidos p
WHERE
	p.estado IN ("Rechazado") AND "2009" = DATE_FORMAT(p.fecha_estado,"%Y");
```

12

```SQL
SELECT
	p.codigo_pedido,
	p.fecha_pedido,
	p.estado
FROM
	pedidos p
WHERE
	p.estado IN ("Entregado") AND "01" = DATE_FORMAT(p.fecha_estado,"%m");
```

13

```SQL
SELECT
	p.id_transaccion,
	p.fecha_pago,
	p.forma_pago,
	p.total
FROM
	pagos p
WHERE
	p.forma_pago IN ("PayPal") AND "2008" = DATE_FORMAT(p.fecha_pago,"%Y");
ORDER BY
	p.total ASC;
```

14

```SQL
SELECT
	p.id_transaccion,
	p.forma_pago,
	COUNT(p.id_transaccion)
FROM
	pagos p
GROUP BY
	p.id_transaccion, p.forma_pago;
```

15

```SQL
SELECT
	p.codigo_producto,
	p.nombre,
	g.descripcion_texto,
	p.cantidad_en_stock as stock,
	p.precio_venta
FROM
	productos p
JOIN
	gama_productos g ON g.gama = p.gama
WHERE
	g.descripcion_texto IN ("Ornamentales") AND p.cantidad_en_stock > 100
ORDER BY
	p.precio_venta ASC;
```

16

```SQL
SELECT
	c.codigo_cliente,
	c.ciudad,
	c.codigo_empleado_rep_ventas
FROM
	clientes c
WHERE
	c.ciudad = "Madrid" AND c.codigo_empleado_rep_ventas IN ("11","30");
```

### Consultas multitabla (Composición interna)

1

```SQL
SELECT
	c.nombre as nombre cliente,
	e.puesto,
	e.nombre as nombre representante,
	e.apellido
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
```

2

```SQL
SELECT
	c.nombre as nombre cliente,
	e.nombre as nombre representante,
	p.total
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
	pagos p ON p.codigo_cliente = c.codigo_cliente
WHERE
	p.total != 0;
```

3

```SQL
SELECT
	c.nombre as nombre cliente,
	e.nombre as nombre representante,
	p.total
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
	pagos p ON p.codigo_cliente = c.codigo_cliente
WHERE
	p.total = 0;
```

4

```SQL
SELECT
	c.nombre as nombre cliente,
	e.nombre as nombre representante,
	p.total,
	o.ciudad
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
	pagos p ON p.codigo_cliente = c.codigo_cliente
JOIN
	oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE
	p.total != 0;
```

5

```SQL
SELECT
	c.nombre as nombre cliente,
	e.nombre as nombre representante,
	p.total,
	o.ciudad
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
	pagos p ON p.codigo_cliente = c.codigo_cliente
JOIN
	oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE
	p.total != 0;
```

6

```SQL
SELECT
	o.linea_direccion1,
	o.linea_direccion2,
	c.ciudad
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
	oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE
	c.ciudad IN ("Fuenlabrada");
```

7

```SQL
SELECT
	c.nombre as nombre cliente,
	e.nombre as nombre representante,
	p.total,
	o.ciudad
FROM
	clientes c
JOIN
	empleados e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
JOIN
	pagos p ON p.codigo_cliente = c.codigo_cliente
JOIN
	oficina o ON o.codigo_oficina = e.codigo_oficina;
```

8

```SQL
SELECT
	e.nombre as nombre empleado,
	j.nombre as nombre jefe
FROM
	empleados e
JOIN
	jefes j ON j.codigo_jefe = e.codigo_jefe;
```

9

```SQL
SELECT
	e.nombre as nombre empleado,
	j.nombre as nombre jefe,
	j2.nombre as nombre jefe de jefes
FROM
	empleados e
JOIN
	jefes j ON j.codigo_jefe = e.codigo_jefe;
```

10

```SQL
SELECT
	c.nombre,
	p.codigo_pedido,
	p.fecha_esperada,
	p.fecha_entrega
FROM
	pedidos p
JOIN
	clientes c ON c.codigo_cliente = p.codigo_cliente
WHERE
	p.fecha_entrega > p.fecha_esperada; 
```

11

```SQL

```

### Consultas multitabla (Composición externa)

1

```sql
SELECT
	c.codigo_cliente, c.nombre_cliente, p.id_transaccion
FROM
	cliente c
LEFT JOIN
	pago p ON c.codigo_cliente = p.codigo_cliente
WHERE
	p.codigo_cliente IS NULL;
```

2

```sql
SELECT
	c.nombre_cliente
FROM
	cliente c
LEFT JOIN
	pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE
	p.codigo_cliente IS NULL;
```

3

```sql
SELECT
	c.nombre_cliente
FROM
	cliente c
LEFT JOIN
	pago ON c.codigo_cliente = pago.codigo_cliente
WHERE
	pago.codigo_cliente IS NULL

UNION

SELECT
	c.nombre_cliente
FROM
	clientes c
LEFT JOIN
	pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE
	p.codigo_cliente IS NULL;
```

4

```sql
SELECT
	e.nombre
FROM
	empleado e
LEFT JOIN
	oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE
	o.codigo_oficina IS NULL;
```

5

```sql
SELECT
	e.nombre
FROM
	empleado e
LEFT JOIN
	cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
	c.codigo_empleado_rep_ventas IS NULL;
```

6

```sql
SELECT
	e.nombre, o.linea_direccion1
FROM
	empleado e
LEFT JOIN
	cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN
	oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE
	c.codigo_empleado_rep_ventas IS NULL;
```

7

```sql
SELECT
	e.nombre
FROM
	empleado e
LEFT JOIN
	oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE
	o.codigo_oficina IS NULL

UNION

SELECT
	e.nombre
FROM
	empleado e
LEFT JOIN
	cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
	c.codigo_empleado_rep_ventas IS NULL;
```

8

```sql
SELECT
	p.nombre, p.codigo_producto
FROM
	producto p
LEFT JOIN
	detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE
	dp.codigo_producto IS NULL;
```

9

```sql
SELECT
	p.nombre_producto, p.descripcion, p.imagen
FROM
	producto p
LEFT JOIN
	detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE
	dp.codigo_producto IS NULL;
```

10

```sql

```

11

```sql
SELECT DISTINCT
	c.nombre_cliente
FROM
	cliente c
LEFT JOIN
	pedido pe ON c.codigo_cliente = pe.codigo_cliente
LEFT JOIN
	pago pa ON c.codigo_cliente = pa.codigo_cliente
WHERE pe.codigo_pedido IS NOT NULL AND pa.codigo_cliente IS NULL;
```

### Consultas resumen

1. 
```sql
SELECT 
    COUNT(e.codigo_empleado) AS cantidad_empleados
FROM
    empleados e;
```
2. 
```sql
SELECT 
    COUNT(e.codigo_empleado) AS cantidad_empleados,
    o.pais
FROM
    empleados e
JOIN 
    oficinas o ON o.codigo_oficina = e.codigo_oficina
GROUP BY
    o.pais;
```
3. 
```sql
SELECT
    AVG(p.total) AS pago_medio
FROM
    pagos p INNER JOIN (
        SELECT p.total, p.id_transaccion
        FROM pagos p
        WHERE "2009" = DATE_FORMAT(p.fecha_pago, "%Y")
    ) AS t on p.id_transaccion = t.id_transaccion;
```
4. 
```sql
SELECT
    p.estado,
    COUNT(p.estado) AS numero_pedidos
FROM
    pedidos p
GROUP BY
    p.estado
ORDER BY 
    numero_pedidos DESC;
```
5. 
```sql
SELECT
    MAX(p.precio_venta) AS valores
FROM
    productos p
 
UNION
SELECT
    MIN(p.precio_venta)
FROM
    productos p;
```
6. 
```sql
SELECT
    COUNT(c.codigo_cliente) AS Nro_clientes
FROM
    clientes c;
```
7. 
```sql
SELECT
    COUNT(c.codigo_cliente) as Nro_Clientes_madrid
FROM
    clientes c
WHERE
    c.ciudad = 'Madrid';
```
8. 
```sql
SELECT
    c.ciudad,
    COUNT(c.codigo_cliente) as Nro_Clientes_M
FROM
    clientes c
WHERE
    c.ciudad LIKE 'm%'
GROUP BY 
    c.ciudad;
```
9. 
```sql
SELECT
    e.nombre,
    COUNT(c.codigo_cliente) AS numero_clientes
FROM
    clientes c
JOIN empleados e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
GROUP BY
    e.nombre;
```
10. 
```sql
SELECT
    COUNT(c.codigo_cliente) AS numero_clientes
FROM
    clientes c
JOIN empleados e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE
    c.codigo_empleado_rep_ventas = 0 OR c.codigo_empleado_rep_ventas = NULL;
```
