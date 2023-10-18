CREATE DOMAIN id_clientes
  AS text
   CONSTRAINT id_clientes_check CHECK ((VALUE ~ '^[0-9]{3,3}$'::text));

CREATE DOMAIN regfedcont
  AS text
   CONSTRAINT regfedcont_check CHECK (((VALUE ~ '^[A-Z]{4}[0-9]{6,6}$') OR (VALUE ~ '^[A-Z]{4}[0-9]{6,6}[A-Z0-9]{3,3}$'::text)));

CREATE DOMAIN Id_Productos
  AS text
   CONSTRAINT Id_productos_check CHECK ((VALUE ~ '^[A-Z]{3,3}[0-9]{4,4}$'));


CREATE TYPE Ciudad AS ENUM (
    'Oaxaca',
    'Miahuatlán'
);

CREATE TYPE Puestos AS ENUM (
    'Gerente',
    'Administrativo',
    'Vendedor'
);

CREATE TYPE Colores AS ENUM (
    'rojo',
    'azul',
    'negro',
    'verde'
);

create table Cliente (
id_cliente id_clientes primary key,
nombre varchar(50),
cd ciudad);

create table Empleado (
id_empleado regfedcont primary key,
nombre varchar(50),
puesto puestos);

create table Producto (
id_producto id_productos primary key,
nombre varchar(50),
color colores);

create table Inventario (
id_producto id_productos primary key,
existencia integer,
check (existencia>0),
foreign key(id_producto) references producto(id_producto) on update cascade on delete cascade);

create table Venta (
id_Venta integer primary key,
id_cliente id_clientes,
id_empleado regfedcont,
check (id_Venta>0),
foreign key(id_cliente) references Cliente(id_cliente) on update cascade on delete restrict,
foreign key(id_empleado) references Empleado(id_empleado) on update cascade on delete restrict);

create table Venta_detalle (
id_Venta integer ,
id_Producto id_productos,
cantidad integer,
check (cantidad>0),
primary key(id_venta,id_producto),
foreign key(id_Venta) references Venta(id_venta) on update restrict on delete restrict,
foreign key(id_producto) references Producto(id_producto) on update cascade on delete cascade);

CREATE OR REPLACE FUNCTION cuenta()
  RETURNS trigger AS
$BODY$
declare
    total integer;
begin
	select count(*) from "empleado" into total 
	where puesto='Gerente';
	if total=1 and new.puesto='Gerente' then
	 raise notice 'Sólo puede existir un Gerente';
         return NULL;
        end if;
        
	select count(*) from "empleado" into total 
	where puesto='Administrativo';
	if total>=5 and new.puesto='Administrativo' then
	 raise notice 'Sólo pueden existir 5 Administrativos';
         return NULL;
        end if;  
	return new;
end;
$BODY$
  LANGUAGE 'plpgsql'

CREATE TRIGGER valida_gerentes_admvos
  BEFORE INSERT OR UPDATE
  ON "empleado"
  FOR EACH ROW
  EXECUTE PROCEDURE cuenta();

CREATE OR REPLACE FUNCTION cuenta_prods()
  RETURNS trigger AS
$BODY$
declare
    exis integer;
begin
	select existencia from "inventario" into exis
	where id_producto=new.id_producto;
	
	
	
	if exis< new.cantidad then
	 raise notice 'No hay más productos suficientes en existencia';
         return NULL;
        end if;
        
	return new;
end;
$BODY$
  LANGUAGE plpgsql 

CREATE TRIGGER valida_prods
  BEFORE INSERT OR UPDATE
  ON "venta_detalle"
  FOR EACH ROW
  EXECUTE PROCEDURE cuenta_prods();





