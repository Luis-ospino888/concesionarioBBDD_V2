USE CONCESIONARIO
GO

/* Para efectos del funcionamiento el código debe irse ejecutando de manera secuencial */

-- 1. Crear un CRUD. procedimiento almacenado tabla Cars.

-- 1.1. INSERCION CON STORAGE PROCEDURE (CREATE)

CREATE PROCEDURE sp_AddCars
	@idCars INT,
	@idOptions INT,
	@brandCar NVARCHAR(20),
	@modelCar NVARCHAR(20),
	@registrationCar NVARCHAR(20),
	@displacement NVARCHAR(20),
	@priceCar INT
AS
BEGIN
	INSERT INTO 
		Cars(idCars, idOptions, brandCar, modelCar, registrationCar, displacement, priceCar)
	VALUES (@idCars,
			@idOptions,
			@brandCar,
			@modelCar,
			@registrationCar,
			@displacement,
			@priceCar)
END

SELECT * FROM Cars
EXECUTE sp_AddCars 51, 2, 'TOYOTA', '2028', 'LAOH', '1000', 200000000
SELECT * FROM Cars

-- 1.2. MOSTRAR DATOS CON STORAGE PROCEDURE (READ)

CREATE PROCEDURE sp_queryCars
	@idCars INT
AS
BEGIN
	SELECT idCars, brandCar, modelCar, registrationCar, displacement, priceCar
	from Cars
	where idCars = @idCars
END

EXECUTE sp_queryCars 51

-- 1.3. ACTUALIZACION O MODIFICACION CON STORAGE PROCEDURE (UPDATE)

CREATE PROCEDURE sp_updateCars
	@idCars INT,
	@idOptions INT,
	@brandCar NVARCHAR(20),
	@modelCar NVARCHAR(20),
	@registrationCar NVARCHAR(20),
	@displacement NVARCHAR(20),
	@priceCar INT
AS
BEGIN
	UPDATE Cars
	set 
		idCars = @idCars,
		idOptions = @idOptions,
		brandCar = @brandCar,
		modelCar = @modelCar,
		registrationCar = @registrationCar,
		displacement = @displacement,
		priceCar = @priceCar
	WHERE idCars = @idCars -- vammos a modificar o actualizar por el id del carro, es decir por su llave primaria (condición)
END

EXEC sp_updateCars 51, 3, 'MERCEDES BENZ', '2029', 'LAOH123', '100', 25000000
SELECT * FROM Cars where idCars = 51
SELECT * FROM Cars

-- 1.4. ELIMINAR REGISTROS CON STORAGE PROCEDURE (DELETE)

CREATE PROCEDURE sp_DeleteCars
@idCars INT
AS
BEGIN
	DELETE Cars
	WHERE idCars = @idCars
END

EXEC sp_DeleteCars 51
SELECT * FROM Cars

/***************************************************************************/
/**************************************************************************/

-- 2. Crear un CRUD. procedimiento almacenado tabla Customers.

-- 2.1. INSERCION CON STORAGE PROCEDURE (CREATE)

CREATE PROCEDURE sp_AddCustomers
	@idCustomers INT,
	@nameCustomer NVARCHAR(20),
	@adressCustomer NVARCHAR(20),
	@phoneCustomer NVARCHAR(15)
AS
BEGIN
	INSERT INTO 
		Customers(idCustomers, nameCustomer, adressCustomer, phoneCustomer)
	VALUES (@idCustomers,
			@nameCustomer,
			@adressCustomer,
			@phoneCustomer)
END

SELECT * FROM Customers

EXECUTE sp_AddCustomers 51, 'LUIS', 'ENVIGADO ANT', '3235369329'
SELECT * FROM Customers

-- 2.2. MOSTRAR DATOS CON STORAGE PROCEDURE (READ)

CREATE PROCEDURE sp_queryCustomers
	@idCustomers INT
AS
BEGIN
	SELECT idCustomers, nameCustomer, adressCustomer, phoneCustomer
	from Customers
	where idCustomers = @idCustomers
END

EXECUTE sp_queryCustomers 51

-- 2.3. ACTUALIZACION O MODIFICACION CON STORAGE PROCEDURE (UPDATE)

CREATE PROCEDURE sp_updateCustomers
	@idCustomers INT,
	@nameCustomers NVARCHAR(20),
	@adressCustomer NVARCHAR(20),
	@phoneCustomer NVARCHAR(15)
AS
BEGIN
	UPDATE Customers
	set 
		idCustomers = @idCustomers,
		nameCustomer = @nameCustomers,
		adressCustomer = @adressCustomer,
		phoneCustomer = @phoneCustomer
	WHERE idCustomers = @idCustomers -- vammos a modificar o actualizar por el id del cliente, es decir por su llave primaria (condición)
END

EXEC sp_updateCustomers 51, 'BENZ', 'sabaneta', '12345678'
SELECT * FROM Customers where idCustomers = 51

SELECT * FROM Customers

-- 2.4. ELIMINAR REGISTROS CON STORAGE PROCEDURE (DELETE)

CREATE PROCEDURE sp_DeleteCustomers
@idCustomers INT
AS
BEGIN
	DELETE Customers
	WHERE idCustomers = @idCustomers
END

EXEC sp_DeleteCustomers 51
SELECT * FROM Customers

/***************************************************************************/
/**************************************************************************/

-- 3. Crear un procedimiento almacenado que solicite el id de vendedor y muestre
--		todos los datos del vendedor y los vehículos vendidos.
/*
ALTER PROCEDURE sp_querySellers 
	@idSellers INT
AS
BEGIN
SELECT Sellers.idSellers, Sellers.nameSellers, Sellers.adressSellers, Sellers.phoneSellers, Cars.brandCar, 
		Cars.modelCar, Cars.priceCar, Cars.registrationCar
FROM Sellers INNER JOIN Sales ON Sellers.idSellers = Sales.idSales
				INNER JOIN Cars ON Cars.idCars = Sales.idSales
WHERE Sales.idSellers = @idSellers and Sales.idCars = Cars.idCars
END

select * from Sales
EXECUTE sp_querySellers 21 
*/

-- 5.4.	Crea un procedimiento almacenado que solicite el id del vehículo 
--			y muestre todos los datos del vehículo

EXECUTE sp_queryCars 4 -- YA ESTE STORAGE PROCEDURE EXISTE --

-- 5.5. Crear un procedimiento almacenado que solicite el id de cliente y 
--       muestre todos los vehículos del cliente. 

ALTER PROCEDURE sp_queryCustomers_2
	@idCustomers INT
AS
BEGIN
SELECT Cars.brandCar, Cars.modelCar, Cars.priceCar, Cars.registrationCar, Customers.nameCustomer
FROM Buys INNER JOIN Cars ON Cars.idCars = Buys.idBuys
				INNER JOIN Customers ON Customers.idCustomers = Buys.idBuys
WHERE Buys.idCustomers = @idCustomers
END

select * from Cars
EXECUTE sp_queryCustomers_2 27

-- 5.6. Crear un procedimiento almacenado que muestre los siguientes 
--			datos de un vendedor:

-- Cuantas ventas
-- Total de ventas
-- Promedio ventas
-- Venta máxima
-- Venta mínima

ALTER PROCEDURE sp_contSalesSellers
	@idSellers INT
AS
BEGIN
SELECT Sales.idSellers, count (Sales.idSellers) as 'cuantas ventas', 
		AVG(Cars.priceCar) as 'promedio ventas', MAX(Cars.priceCar) 
		AS 'VENTA MAXIMA', MIN(Cars.priceCar) AS 'VENTA MINIMA'
FROM Sellers INNER JOIN Sales ON Sellers.idSellers = Sales.idSales 
				INNER JOIN Cars ON Cars.idCars = Sales.idSales
WHERE Sales.idSellers = @idSellers
GROUP BY Sales.idSellers
END

EXECUTE sp_contSalesSellers 21

