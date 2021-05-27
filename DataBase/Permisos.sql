--
-- File generated with SQLiteStudio v3.3.3 on jue. may. 27 04:50:51 2021
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: areaTrabajo
CREATE TABLE areaTrabajo (idAreaEmpleado INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descripcionArea VARCHAR (40) NOT NULL);
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (1, 'Desarrollo Software');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (2, 'Electromecanica');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (3, 'Construccion');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (4, 'Control e Instrumentacion');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (5, 'Mecanica Automotriz');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (6, 'Maquinas y Herramientas');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (7, 'Quimica en Farmacos');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (8, 'Electronica y comunicaciones');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (9, 'Administrativas');
INSERT INTO areaTrabajo (idAreaEmpleado, descripcionArea) VALUES (10, 'Basicas');

-- Table: empleado
CREATE TABLE empleado (numeroDeNomina INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nombres VARCHAR (40) NOT NULL, apellidoPaterno VARCHAR (20) NOT NULL, apellidoMaterno VARCHAR (20) NOT NULL, curp VARCHAR (18) NOT NULL, email VARCHAR (40) NOT NULL, numeroTelefonico INTEGER (10), calle VARCHAR (20) NOT NULL, numeroInterior INTEGER (5), numeroExterior INTEGER (5) NOT NULL, codigoPostal INTEGER (5) NOT NULL, colonia VARCHAR (30) NOT NULL, "municipio " VARCHAR (30) NOT NULL, fechaCumpleanos DATE NOT NULL, fechaIngreso DATE NOT NULL, areaTrabajo INTEGER REFERENCES areaTrabajo (idAreaEmpleado) NOT NULL, tipoEmpleado INTEGER REFERENCES tipoEmpleado (idTipoEmpleado) NOT NULL, plantel INTEGER REFERENCES plantel (idTipoPlantel) NOT NULL);
INSERT INTO empleado (numeroDeNomina, nombres, apellidoPaterno, apellidoMaterno, curp, email, numeroTelefonico, calle, numeroInterior, numeroExterior, codigoPostal, colonia, "municipio ", fechaCumpleanos, fechaIngreso, areaTrabajo, tipoEmpleado, plantel) VALUES (1001, 'Yesenia Guadalupe', 'Gomez', 'Gonzalez', 'GOGY901103MJCMNS18', 'yeseniagomez@ceti.mx', 3398013978, 'Sevilla', NULL, 979, 44280, 'El Retiro', 'Guadalajara', '1990-11-03', '2019-03-03', 10, 4, 1);
INSERT INTO empleado (numeroDeNomina, nombres, apellidoPaterno, apellidoMaterno, curp, email, numeroTelefonico, calle, numeroInterior, numeroExterior, codigoPostal, colonia, "municipio ", fechaCumpleanos, fechaIngreso, areaTrabajo, tipoEmpleado, plantel) VALUES (1002, 'Diana Marisol', 'Figueroa', 'Flores', 'FIFD870311MJCGLN84', 'dianafigueroa@ceti.mx', 3388371098, 'Becerra y Tanco', 10, 100, 44500, 'Chapalita', 'Guadalajara', '1987-03-11', '2011-04-14', 1, 4, 1);
INSERT INTO empleado (numeroDeNomina, nombres, apellidoPaterno, apellidoMaterno, curp, email, numeroTelefonico, calle, numeroInterior, numeroExterior, codigoPostal, colonia, "municipio ", fechaCumpleanos, fechaIngreso, areaTrabajo, tipoEmpleado, plantel) VALUES (1003, 'Juan Daniel', 'Ramirez', 'Landell', 'RALJ910816HJCMND66', 'juanramirez@ceti.mx', 3390436655, 'Guanajuato', NULL, 876, 44260, 'Mezquitan Country', 'Zapopan', '1991-08-16', '2014-11-18', 9, 4, 1);

-- Table: estadoPermiso
CREATE TABLE estadoPermiso (idEstadoPermiso INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descripcionEstado VARCHAR (30) NOT NULL);
INSERT INTO estadoPermiso (idEstadoPermiso, descripcionEstado) VALUES (1, 'Aceptado');
INSERT INTO estadoPermiso (idEstadoPermiso, descripcionEstado) VALUES (2, 'Rechazado');
INSERT INTO estadoPermiso (idEstadoPermiso, descripcionEstado) VALUES (3, 'Solicitado');
INSERT INTO estadoPermiso (idEstadoPermiso, descripcionEstado) VALUES (4, 'Aprobado (Supervisor)');
INSERT INTO estadoPermiso (idEstadoPermiso, descripcionEstado) VALUES (5, 'Cancelado');

-- Table: Login
CREATE TABLE Login (idLogin INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, password VARCHAR (15) NOT NULL, usuario INTEGER REFERENCES empleado (numeroDeNomina) NOT NULL);
INSERT INTO Login (idLogin, password, usuario) VALUES (1, '123456', 1001);
INSERT INTO Login (idLogin, password, usuario) VALUES (2, '123456', 1002);
INSERT INTO Login (idLogin, password, usuario) VALUES (3, '123456', 1003);

-- Table: permiso
CREATE TABLE permiso (folio INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, empleado INTEGER NOT NULL REFERENCES empleado (numeroDeNomina), fechaElaboracion DATE NOT NULL, fechaJustificacionInicio DATE NOT NULL, fechaJustificacionFin DATE NOT NULL, horaInicio TIME, horaFin TIME, estadoPermiso INTEGER NOT NULL REFERENCES estadoPermiso (idEstadoPermiso), tipoPermiso INTEGER NOT NULL REFERENCES tipoPermiso (idTipoPermiso));
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210001, 1001, '2021-02-16', '2021-02-19', '2021-02-19', NULL, NULL, 3, 1);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210002, 1001, '2021-04-26', '2021-04-30', '2021-04-30', '13:00:00', '15:00:00', 3, 3);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210003, 1001, '2021-05-19', '2021-05-24', '2021-05-24', NULL, NULL, 3, 1);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210004, 1002, '2021-03-08', '2021-03-11', '2021-03-11', NULL, NULL, 3, 2);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210005, 1002, '2021-04-19', '2021-04-22', '2021-04-22', NULL, NULL, 3, 1);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210006, 1002, '2021-02-15', '2021-02-18', '2021-02-18', '07:00:00', '9:00:00', 3, 3);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210007, 1003, '2021-02-15', '2021-02-18', '2021-02-18', '7:00:00', '9:00:00', 3, 3);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210008, 1003, '2021-03-15', '2021-03-18', '2021-03-18', NULL, NULL, 3, 1);
INSERT INTO permiso (folio, empleado, fechaElaboracion, fechaJustificacionInicio, fechaJustificacionFin, horaInicio, horaFin, estadoPermiso, tipoPermiso) VALUES (210009, 1003, '2021-05-03', '2021-05-06', '2021-05-06', NULL, NULL, 3, 1);

-- Table: plantel
CREATE TABLE plantel (idTipoPlantel INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descripcionPlantel VARCHAR (30) NOT NULL);
INSERT INTO plantel (idTipoPlantel, descripcionPlantel) VALUES (1, 'Colomos');
INSERT INTO plantel (idTipoPlantel, descripcionPlantel) VALUES (2, 'Santiago');
INSERT INTO plantel (idTipoPlantel, descripcionPlantel) VALUES (3, 'Tonala');

-- Table: tipoEmpleado
CREATE TABLE tipoEmpleado (idTipoEmpleado INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descripcionEmpleado VARCHAR (30) NOT NULL);
INSERT INTO tipoEmpleado (idTipoEmpleado, descripcionEmpleado) VALUES (1, 'Director');
INSERT INTO tipoEmpleado (idTipoEmpleado, descripcionEmpleado) VALUES (2, 'Supervisor');
INSERT INTO tipoEmpleado (idTipoEmpleado, descripcionEmpleado) VALUES (3, 'Supervisor-Profesor');
INSERT INTO tipoEmpleado (idTipoEmpleado, descripcionEmpleado) VALUES (4, 'Profesor');

-- Table: tipoPermiso
CREATE TABLE tipoPermiso (idTipoPermiso INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, descripcionPermiso VARCHAR (30) NOT NULL);
INSERT INTO tipoPermiso (idTipoPermiso, descripcionPermiso) VALUES (1, 'Economico');
INSERT INTO tipoPermiso (idTipoPermiso, descripcionPermiso) VALUES (2, 'Cumpleños');
INSERT INTO tipoPermiso (idTipoPermiso, descripcionPermiso) VALUES (3, 'Dos Horas');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
