use centrodecalculo;

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

call Login(1234,'1234');