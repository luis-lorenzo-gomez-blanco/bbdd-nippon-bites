DROP DATABASE IF EXISTS nippon_bites;
CREATE DATABASE IF NOT EXISTS nippon_bites;
USE nippon_bites;

DROP TABLE IF EXISTS menu;
CREATE TABLE IF NOT EXISTS menu (
	id_producto INT (2) NOT NULL,
	nombre_producto VARCHAR (25) NOT NULL,
	precio DECIMAL (4,2) NOT NULL,
	CONSTRAINT pk_menu PRIMARY KEY (id_producto)
);

DROP TABLE IF EXISTS miembro;
CREATE TABLE IF NOT EXISTS miembro (
	id_cliente CHAR (1) NOT NULL,
	fecha_alta DATE DEFAULT NULL,
	CONSTRAINT pk_miembro PRIMARY KEY (id_cliente)
);

DROP TABLE IF EXISTS ventas;
CREATE TABLE IF NOT EXISTS ventas (
	id_cliente CHAR (1) NOT NULL,
	id_producto INT (2) NOT NULL,
	fecha_pedido DATE NOT NULL,
	CONSTRAINT fk_ven_id_mie_di_cli FOREIGN KEY (id_cliente)
	REFERENCES miembro (id_cliente)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT fk_ven_id_pro_men_id_pro FOREIGN KEY (id_producto)
		REFERENCES menu (id_producto)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
