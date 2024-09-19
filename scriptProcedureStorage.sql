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

