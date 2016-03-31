use centrodecalculo;


insert into ciclo(Anio,Ciclo) values(2016,1);
insert into ciclo(Anio,Ciclo) values(2016,2);

insert into tipousuario(Descripcion) values('Empleado');
insert into tipousuario(Descripcion) values('Estudiante');
insert into tipousuario(Descripcion) values('Catedratico');

insert into rol(Descripcion) values('Select');
insert into rol(Descripcion) values('Update');
insert into rol(Descripcion) values('Delete');
insert into rol(Descripcion) values('Insert');

insert into salon(Salon,Edificio,Capacidad,Audiovisual)values(110,'T3',60,TRUE);
insert into salon(Salon,Edificio,Capacidad,Audiovisual)values(111,'T3',70,FALSE);
insert into salon(Salon,Edificio,Capacidad,Audiovisual)values(110,'T1',50,FALSE);
insert into salon(Salon,Edificio,Capacidad,Audiovisual)values(111,'T2',45,TRUE);

insert into empresatelefonica(Nombre)values('Movistar');
insert into empresatelefonica(Nombre)values('Tigo');
insert into empresatelefonica(Nombre)values('Claro');

insert into usuario(Nombres,Apellidos,FechaNacimiento,Telefono,Telefonica,DPI)
values('Luis Carlos','Mendez Rodas','1990-09-21','11111111',1,'123456789');

insert into usuario(Nombres,Apellidos,FechaNacimiento,Telefono,Telefonica,DPI)
values('Mynor Rolando','Masaya','1992-01-11','22222222',2,'987654321');

insert into usuario(Nombres,Apellidos,FechaNacimiento,Telefono,Telefonica,DPI)
values('Andrea','Juarez','1991-10-16','33333333',3,'11111111111');

insert into usuario(Nombres,Apellidos,FechaNacimiento,Telefono,Telefonica,DPI)
values('Helen','Medrano','1993-05-21','44444444',1,'123123123');

insert into detalle_tipousuario(Codigo,Usuario,Tipo,Password) 
values(1234,1,2,'1234');

insert into detalle_tipousuario(Codigo,Usuario,Tipo,Password) 
values(1235,2,1,'1234');

insert into detalle_tipousuario(Codigo,Usuario,Tipo,Password) 
values(1236,3,3,'1234');