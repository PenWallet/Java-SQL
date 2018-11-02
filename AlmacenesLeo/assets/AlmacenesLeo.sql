-- Almacenes
CREATE DATABASE AlmacenesLeo
GO
USE AlmacenesLeo
GO
CREATE TABLE Almacenes (
ID Int NOT NULL CONSTRAINT PK_Almacenes Primary Key
,Denominacion NVarChar (30) Not NULL
,Direccion NVarChar (50) Not NULL
,Capacidad BigInt Not NULL
)
GO
CREATE TABLE Distancias (
IDAlmacen1 Int NOT NULL
,IDAlmacen2 Int NOT NULL
,Distancia Int NOT NULL
,CONSTRAINT PK_Distancias Primary Key (IDAlmacen1, IDAlmacen2)
,CONSTRAINT FK_DistanciaAlmacen1 Foreign KEy (IDAlmacen1) REFERENCES Almacenes (ID)
,CONSTRAINT FK_DistanciaAlmacen2 Foreign Key (IDAlmacen2) REFERENCES Almacenes (ID)
)
CREATE TABLE Envios (
ID BigInt NOT NULL CONSTRAINT PK_Envios Primary Key
,NumeroContenedores Int Not NULL DEFAULT 1
,FechaCreacion DATE NOT NULL
,FechaAsignacion DATE NULL
,AlmacenPreferido Int NOT NULL
)
GO
CREATE TABLE Asignaciones (
IDEnvio BigInt NOT NULL CONSTRAINT PK_Asignaciones Primary Key
,IDAlmacen Int NOT NULL
,CONSTRAINT FK_AsignacionEnvio Foreign KEy (IDEnvio) REFERENCES Envios (ID)
,CONSTRAINT FK_AsignacionAlmacen Foreign KEy (IDAlmacen) REFERENCES Almacenes (ID)
)