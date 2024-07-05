DROP DATABASE IF EXISTS garden;
CREATE DATABASE garden;

USE garden;

CREATE TABLE gama_productos (
    gama VARCHAR(50) UNIQUE,
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),
    CONSTRAINT pk_gama_productos_gama PRIMARY KEY (gama)
);

CREATE TABLE productos (
    codigo_producto VARCHAR(15),
    nombre VARCHAR(70),
    gama VARCHAR(50),
    dimensiones VARCHAR(25),
    proveedor VARCHAR(50),
    descripcion TEXT,
    cantidad_en_stock SMALLINT(6),
    precio_venta DECIMAL(15,2),
    precio_proveedor DECIMAL(15,2),
    CONSTRAINT pk_productos_codigo_producto PRIMARY KEY (codigo_producto),
    CONSTRAINT fk_productos_gama_productos_gama FOREIGN KEY (gama) REFERENCES gama_productos(gama) 
);

CREATE TABLE oficinas (
    codigo_oficina VARCHAR(10),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(20),
    codigo_postal VARCHAR(10),
    telefono VARCHAR(20),
    linea_dirrecion1 VARCHAR(50),
    linea_dirrecion2 VARCHAR(50),
    CONSTRAINT pk_oficinas_codigo_oficina PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleados (
    codigo_empleado INT(11),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    codigo_oficina VARCHAR(10),
    codigo_jefe INT(11),
    puesto VARCHAR(50),
    CONSTRAINT pk_empleados_codigo_empleado PRIMARY KEY (codigo_empleado),
    CONSTRAINT fk_empleados_oficinas_codigo_oficina FOREIGN KEY (codigo_oficina) REFERENCES oficinas(codigo_oficina)
);

CREATE TABLE clientes (
    codigo_cliente INT(11),
    nombre_cliente VARCHAR(30),
    apellido_cliente VARCHAR(30),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    linea_dirrecion1 VARCHAR(50),
    linea_dirrecion2 VARCHAR(50),
    ciudad VARCHAR(30),
    pais VARCHAR(50),
    region VARCHAR(20),
    codigo_postal VARCHAR(10),
    codigo_empleado_rep_ventas INT(11),
    limite_credito DECIMAL(15,2),
    CONSTRAINT pk_clientes_codigo_cliente PRIMARY KEY (codigo_cliente),
    CONSTRAINT fk_clientes_empleado_codigo_empleado_rep_ventas FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleados(codigo_empleado)
);

CREATE TABLE pedidos (
    codigo_pedido INT(11),
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha_entrega DATE,
    estado VARCHAR(15),
    comentarions TEXT,
    codigo_cliente INT(11),
    CONSTRAINT pk_pedidos_codigo_pedido PRIMARY KEY (codigo_pedido),
    CONSTRAINT fk_pedidos_clientes_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

CREATE TABLE detalle_pedido (
    codigo_pedido int(11),
    codigo_producto varchar(15),
    cantidad int(11),
    precio_unidad decimal(15,2),
    numero_linea smallint(6),
    constraint pk_detalle_pedido_codigo_pedido PRIMARY KEY (codigo_pedido, codigo_producto),
    constraint fk_detalle_pedido_productos_codigo_producto FOREIGN KEY(codigo_producto) references productos(codigo_producto),
    constraint fk_detalle_pedido_pedido_codigo_pedido FOREIGN KEY (codigo_pedido) references pedidos(codigo_pedido)
);

CREATE TABLE pagos (
    codigo_cliente INT(11),
    forma_pago VARCHAR(40),
    id_transaccion VARCHAR(50),
    fecha_pago DATE,
    total DECIMAL(15,2),
    CONSTRAINT pk_pagos_forma_pago PRIMARY KEY (id_transaccion),
    CONSTRAINT fk_pagos_cliente_codigo_cliente FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);
