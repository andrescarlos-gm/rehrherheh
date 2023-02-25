/*1. Genere un set de consultas que permitan crear las tablas indicadas en el modelo. Tenga en
consideración las llaves primarias, los tipos de dato indicados y las condiciones de nulidad.*/
CREATE TABLE cliente (rutcliente NUMERIC(9) PRIMARY KEY, nombres VARCHAR(30) NOT NULL, 
apellidos VARCHAR(30) NOT NULL, telefono VARCHAR (20) NOT NULL, afp VARCHAR (30), 
sistemasalud NUMERIC (2), direccion VARCHAR(70), comuna VARCHAR (50), 
edad NUMERIC (3) NOT NULL);

CREATE TABLE Capacitacion (idcapacitacion NUMERIC (9) PRIMARY KEY, fecha DATE, hora DATE,
lugar VARCHAR(50) NOT NULL, duracion NUMERIC (3), cantidadasistentes NUMERIC (5) NOT NULL, 
Cliente_rutcliente NUMERIC (9) NOT NULL);

CREATE TABLE Asistentes (idasistente NUMERIC (9), nombres VARCHAR (100) NOT NULL, 
edad NUMERIC (3) NOT NULL, Capacitacion_idcapacitacion NUMERIC (9) NOT NULL);

CREATE TABLE Accidente (accidenteid NUMERIC (9) PRIMARY KEY, dia DATE, hora DATE, lugar VARCHAR (50) NOT NULL,
origen VARCHAR (100), consecuencias VARCHAR (100), Cliente_rutcliente NUMERIC (9) NOT NULL);

/*2. Desarrolle consultas que permitan crear las llaves foráneas antes indicadas, respetando el
sentido lógico de su creación.*/

ALTER TABLE accidente ADD CONSTRAINT Accidente_Cliente_FK FOREIGN KEY (Cliente_rutcliente) REFERENCES cliente (rutcliente);

ALTER TABLE capacitacion ADD CONSTRAINT Capacitacion_Cliente_FK FOREIGN KEY (Cliente_rutcliente) REFERENCES cliente (rutcliente);

ALTER TABLE asistentes ADD CONSTRAINT Asistentes_Capacitacion_FK FOREIGN KEY (Capacitacion_idcapacitacion) REFERENCES capacitacion (idcapacitacion) ;

/*3. Genere una consulta que permita crear una restricción de valor único sobre el campo
“telefono” de la tabla Cliente.*/
ALTER TABLE cliente ADD UNIQUE (telefono);
/*4. Genere una consulta que permita restringir los valores posibles del campo sistemasalud de
la tabla Cliente al conjunto {1,2}.*/
ALTER TABLE cliente ADD CONSTRAINT SIS_CHECK CHECK (sistemasalud IN (1,2));
/*5. Genere las consultas para insertar cuatro registros en la tabla Cliente, y consultas para
insertar siete registros en la tabla Accidente, asociados a los clientes recién ingresados.*/
INSERT INTO cliente VALUE ('16132435-K', 'ANA', 'PEREZ', 989303033, 'MODELO', 1, 'LOS COIPOS 333', 'QUILPUE', '33');