/* Crear tablas*/
CREATE TABLE ventas (idventa NUMERIC primary key, vendedor varchar(50), cantarticulos numeric, subtotal numeric, impuesto numeric,  total numeric, clientes_idcliente numeric);
CREATE TABLE clientes (idcliente numeric primary key, nombres varchar (50),  apellidos varchar (50), direccion varchar(70), telefono numeric);
ALTER TABLE ventas ADD CONSTRAINT ventas_clientes_FK FOREIGN KEY (clientes_idcliente) REFERENCES clientes (idcliente);

/*1. Desarrolle una consulta que permita generar una secuencia para el campo idcliente de la
tabla clientes. Junto con ello, debe crear un trigger o disparador que, al momento de
insertar un registro, asigne de manera automática el identificador a la tabla.*/

ALTER TABLE clientes MODIFY COLUMN idcliente INT AUTO_INCREMENT;

DELIMITER //
CREATE TRIGGER autoinc_id
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
DECLARE next_id INT;
SELECT AUTO_INCREMENT INTO next_id FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'clientes';
SET NEW.idcliente = next_id;
END 
//

/*2. Genere dos consultas de inserción de registros en la tabla clientes, sin indicar el
identificador de clientes en ella.*/

INSERT INTO clientes(nombres, apellidos, direccion, telefono) 
VALUES ("Susana", "Reinoso", "El morro 431", 965486215), ("Rosario", "Gangas", "Venezuela 999", 8745154562);

/*3. Genere una consulta que añada una restricción por chequeo de control de valores en la
tabla ventas al campo cantarticulos, dando opción a que este sea solo un valor entre 1 y 5
(sólo números enteros).*/

ALTER TABLE ventas ADD CONSTRAINT chk_qty CHECK (cantarticulos BETWEEN 1 AND 5 AND FLOOR(cantarticulos) = cantarticulos);