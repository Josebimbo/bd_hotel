CREATE DATABASE Hotel

CREATE schema Ubicacion
GO

CREATE TABLE Ubicacion.Departamento (
IdDepartamento INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(100) NOT NULL,
CONSTRAINT PK_Departamento_IdDepartamento PRIMARY KEY(IdDepartamento)
)
GO

CREATE TABLE Ubicacion.Municipio (
IdMunicipio INT IDENTITY(1,1) NOT NULL,
IdDepartamento INT NOT NULL,
Nombre VARCHAR(100) NOT NULL,
CONSTRAINT PK_Municipio_IdMunicipio PRIMARY KEY(IdMunicipio),
CONSTRAINT FK_Municipio_Departamento_IdDepartamento FOREIGN KEY(IdDepartamento) 
REFERENCES Ubicacion.Departamento(IdDepartamento)
)
GO

CREATE SCHEMA Reserva
GO
CREATE TABLE Reserva.TipoHotel(
IdTipo INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR(100) NOT NULL,
CONSTRAINT PK_Tipo_IdTipo PRIMARY KEY(IdTipo)
)
GO

CREATE TABLE Reserva.Hotel(
	IdHotel INT IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
	IdMunicipio INT NOT NULL,
	IdTipo INT NOT NULL,
	CONSTRAINT PK_Hotel_IdHotel PRIMARY KEY(IdHotel),
	CONSTRAINT FK_Hotel_Municipio_IdMunicipio FOREIGN KEY(IdMunicipio)
	REFERENCES Ubicacion.Municipio(IdMunicipio),
	CONSTRAINT FK_Hotel_TipoHotel_IdTipo FOREIGN KEY(IdTipo)
	REFERENCES Reserva.TipoHotel(IdTipo)
)
GO