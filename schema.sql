DROP DATABASE IF EXISTS dealership_db;

CREATE DATABASE dealership_db;

USE dealership_db; 

CREATE TABLE dealerships(
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50)NOT NULL,
address VARCHAR(50),
phone VARCHAR(12)
);

CREATE TABLE vehicles(
vin INT PRIMARY KEY,
type VARCHAR(50),
year INT NOT NULL,
make VARCHAR(10),
model VARCHAR(10),
vehicle_type VARCHAR(10),
color VARCHAR(10),
odometer INT,
dealership_id INT,
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
sold BOOLEAN 
);

CREATE TABLE inventory(
dealership_id INT,
vin INT,
FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
FOREIGN KEY (vin) REFERENCES vehicles(vin),
PRIMARY kEY (dealership_id,vin)
);

CREATE TABLE sales_contract (
id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
finance BOOLEAN NOT NULL ,
vin INT,
FOREIGN KEY (vin) REFERENCES vehicles (vin)

);

CREATE TABLE lease_contract(
customer_name VARCHAR(100) NOT NULL,
id INT AUTO_INCREMENT PRIMARY KEY,
vin INT,
FOREIGN KEY (vin) REFERENCES vehicles (vin)

);


INSERT INTO dealerships (name, address, phone) 
VALUES
('Downtown Motors', '123 Main St, Dallas, TX', '2145551234'),
('Elite Autos', '456 Elm St, Dallas, TX', '9725554567'),
('Luxury Wheels', '789 Oak St, Dallas, TX', '8175557890');

INSERT INTO vehicles (vin, type, year, make, model, vehicle_type, color, odometer, dealership_id, sold) VALUES
(1001, 'Car', 2020, 'Toyota', 'Camry', 'Sedan', 'Blue', 30000, 1, FALSE),
(1002, 'SUV', 2022, 'Honda', 'CR-V', 'SUV', 'Black', 15000, 1, FALSE),
(1003, 'Truck', 2021, 'Ford', 'F-150', 'Truck', 'White', 20000, 2, TRUE),
(1004, 'Car', 2023, 'Tesla', 'Model 3', 'Electric', 'Red', 5000, 3, FALSE),
(1005, 'SUV', 2021, 'BMW', 'X5', 'Luxury', 'Gray', 25000, 2, TRUE);

INSERT INTO inventory (dealership_id, vin) VALUES
(1, 1001),
(1, 1002),
(2, 1003),
(3, 1004),
(2, 1005);

INSERT INTO sales_contract (customer_name, finance, vin) VALUES
('John Doe', TRUE, 1003),
('Jane Smith', FALSE, 1005);

INSERT INTO lease_contract (customer_name, vin) VALUES
('Alice Johnson', 1002),
('Bob Brown', 1004);
