use master
go

if exists(Select * from sysdatabases where name = 'LaEva')
begin
	drop database LaEva
end
go

create database LaEva
go

CREATE LOGIN [IIS APPPOOL\DefaultAppPool] FROM WINDOWS 
GO

use LaEva
go

CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool]
GO

exec sys.sp_addrolemember 'db_owner', [IIS APPPOOL\DefaultAppPool]
go

--Tabla

create Table Usuario
(
	email varchar(30) primary key check(email like '%[@]%'),
	usuario varchar(20),
	pass varchar(10)

)
go

create Table Ingredientes
(
	id int identity(1,1) primary key,
	nombre varchar(50)
)
go

Create Table Hamburguesa
(
	burguerID int identity(1,1) primary key,
	nombre varchar(30),
	imagen image
)

Create Table ListaIngredientes
(
	burguerID int references Hamburguesa(burguerID),
	id int references Ingredientes(id),
	primary key (burguerID,id)
)
go

Insert into Ingredientes(nombre) values
('Jamon'),
('Panceta'),
('Queso'),
('oregano'),
('Gustos a elección'),
('Cheddar')
go

Insert into Usuario(email,usuario,pass) values
('laurab@gmail.com','laurita','123qwe'),
('diegofernandez@gmail.com','dieguitox','123asd')
go

Insert into Hamburguesa(nombre,imagen) values
('Star','C:\Users\Usuario\Desktop\Estudio\Trabajos\LaEva\LaEva\Sitio\Content\imagenes\Star.jpg'),
('Celeste','C:\Users\Usuario\Desktop\Estudio\Trabajos\LaEva\LaEva\Sitio\Content\imagenes\Celeste.jpg'),
('Doble Cheddar','C:\Users\Usuario\Desktop\Estudio\Trabajos\LaEva\LaEva\Sitio\Content\imagenes\Celeste.jpg')
go

Insert into ListaIngredientes(burguerID, id) values
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,2),
(2,3),
(2,4),
(2,5),
(3,6),
(3,2),
(3,4),
(3,5)
go
