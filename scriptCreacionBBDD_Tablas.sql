CREATE DATABASE CONCESIONARIO
GO
USE CONCESIONARIO
GO

-- CREACIÓN DE TABLAS
DROP TABLE Customers
CREATE TABLE Customers(
	idCustomers INT PRIMARY KEY,
	nameCustomer NVARCHAR(20),
	adressCustomer NVARCHAR(20),
	phoneCustomer NVARCHAR(15)
)
DROP TABLE UsedCars
CREATE TABLE UsedCars(
	idUsedCars INT PRIMARY KEY,
	idCustomers INT,
	brandUsedCar NVARCHAR(20),
	modelUsedCar NVARCHAR(20),
	registrationUsedCar NVARCHAR(20),
	priceUsedCar INT,
	dateCesion DATE,
	FOREIGN KEY (idCustomers) REFERENCES Customers (idCustomers)
)
DROP TABLE Options
CREATE TABLE Options(
	idOptions INT PRIMARY KEY, 
	nameOption NVARCHAR(20),
	descriptionOption NVARCHAR(50),
	priceOption INT
)
drop table Cars
CREATE TABLE Cars(
	idCars INT PRIMARY KEY,
	idOptions INT,
	brandCar NVARCHAR(20),
	modelCar NVARCHAR(20),
	registrationCar NVARCHAR(20),
	displacement NVARCHAR(10),
	priceCar INT,
	FOREIGN KEY (idOptions) REFERENCES Options (idOptions)
)
drop table Buys
CREATE TABLE Buys(
	idBuys INT PRIMARY KEY,
	idCustomers INT,
	idCars INT UNIQUE,
	dateBuy DATE,
	FOREIGN KEY (idCustomers) REFERENCES Customers (idCustomers),
	FOREIGN KEY (idCars) REFERENCES Cars (idCars)
)
drop table Sellers
CREATE TABLE Sellers(
	idSellers INT PRIMARY KEY,
	nameSellers NVARCHAR(20),
	adressSellers NVARCHAR(20),
	phoneSellers NVARCHAR(15) 
)
drop table Sales
CREATE TABLE Sales(
	idSales INT PRIMARY KEY,
	idSellers INT,
	idCars INT UNIQUE,
	dateSale DATE,
	FOREIGN KEY (idSellers) REFERENCES Sellers (idSellers),
	FOREIGN KEY (idCars) REFERENCES Cars (idCars)
)
