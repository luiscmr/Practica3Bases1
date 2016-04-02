use centrodecalculo;
--  ------------------------------------- Log in ---------------------------------------------------------------
drop procedure if exists Login;
delimiter $$
create procedure Login(User int, Pass varchar(45))
comment 'Login para el usuario, devuelve 1 si coincide y 0 si no'
begin
select count(*) Cuenta from detalle_tipousuario d
where d.Codigo = User
and d.Password = Pass;
end
$$

delimiter ;

-- ----------------------------------------Devuelve Tipo Usuario ------------------------------------------------------

drop procedure if exists TipoUsuario;
delimiter $$
create procedure TipoUsuario(User int, Pass varchar(45))
comment 'obtiene el tipo de usuario para redireccionar'
begin
select d.Tipo from detalle_tipousuario d
where d.Codigo = User
and d.Password = Pass;
end
$$
delimiter ;

-- -----------------------------------------Devuelve Datos del Usuario --------------------------------------------------
drop procedure if exists Datosusuario;
delimiter $$
create procedure DatosUsuario(User int)
comment 'Login para el usuario, devuelve 1 si coincide y 0 si no'
begin
select d.Codigo, d.Tipo from detalle_tipousuario d
where d.Codigo = User;
end
$$
delimiter ;

-- -----------------------------------------Muestra las Unidades Administrativas -------------------------------------------------

drop procedure if exists VerUnidadesAmin;

delimiter $$
create procedure VerUnidadesAmin()
comment 'muesta las unidades administrativas'
begin

select * from unidad_noacademica u ;

end
$$
delimiter ;


-- ----------------------------------------Inserta una Unidad Administrativa ------------------------------------------------------

drop procedure if exists InsertarUnidadAdmin;

delimiter $$

create procedure InsertarUnidadAdmin(in Nombre varchar(45), in Fundacion date, in Apertura time, in Cierre time, in Salon int, in Edificio varchar(4), out respuesta int)
comment 'Inserta unidades administrativas'
begin
declare existe int;
declare existe2 int;

select count(*) into existe from unidad_noacademica u where u.Nombre = Nombre;
select count(*) into existe2 from salon s where s.Salon = Salon and s.Edificio = Edificio;

if existe = 0 and existe2 = 1 then
	insert into unidad_noacademica(Nombre,Fundacion,Apertura,Cierre,Salon_Salon, Salon_Edificio)
	values(Nombre, Fundacion, Apertura, Cierre, Salon, Edificio);
	select count(*) into existe2 from unidad_noacademica u where u.Nombre = Nombre;
    set respuesta = existe2;
else
	set respuesta = -1;
end if;

end
$$
delimiter ;


-- ---------------------------------Actualizar Unidad ------------------------------------------------------

drop procedure if exists ActualizarUnidadAdmin;

delimiter $$

create procedure ActualizarUnidadAdmin(in Codigo int, in Nombre varchar(45), in Fundacion date, in Apertura time, in Cierre time, in Salon int, in Edificio varchar(4), out respuesta int)
comment 'Inserta unidades administrativas'
begin
declare existe int;
declare existe2 int;

select count(*) into existe from unidad_noacademica u where u.Nombre = Nombre;
select count(*) into existe2 from salon s where s.Salon = Salon and s.Edificio = Edificio;

if existe = 0 and existe2 = 1 then
	update unidad_noacademica u set u.Nombre = Nombre, u.Fundacion = Fundacion, u.Apertura = Apertura, u.Cierre = Cierre, u.Salon_Salon = Salon, u.Salon_Edificio = Edificio  where u.Codigo = Codigo;
	select count(*) into existe2 from unidad_noacademica u where u.Nombre = Nombre;
    set respuesta = existe2;
else
	set respuesta = -1;
end if;

end
$$
delimiter ;

-- ---------------------------------Eliminar Unidad ------------------------------------------------------

drop procedure if exists EliminarUnidadAdmin;

delimiter $$

create procedure EliminarUnidadAdmin(in Codigo int, out respuesta int)
comment 'Inserta unidades administrativas'
begin
declare existe int;
delete from unidad_noacademica where unidad_noacademica.Codigo = Codigo;
select count(*) into existe from unidad_noacademica u where u.Codigo = Codigo;
set respuesta = existe;
end
$$
delimiter ;

-- -------------------------------------Buscar Unidad------------------------------------------------------
drop procedure if exists BuscarUnidadAdmin;

delimiter $$

create procedure BuscarUnidadAdmin(Codigo int)
begin
select * from unidad_noacademica u where u.Codigo = Codigo;
end
$$
delimiter ;
