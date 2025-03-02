-- Tạo database
USE master;
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name='PorscheDB')
BEGIN
    ALTER DATABASE PorscheDB SET OFFLINE WITH ROLLBACK IMMEDIATE;
    ALTER DATABASE PorscheDB SET ONLINE;
    DROP DATABASE PorscheDB;
END;
GO

CREATE DATABASE PorscheDB;
GO

USE PorscheDB;
GO

-- Tạo bảng Car
CREATE TABLE Car (
    car_ID INT PRIMARY KEY,
    car_Name VARCHAR(150) NOT NULL,
    max_Speed VARCHAR(50),
    acceleration VARCHAR(50),
    price VARCHAR(50),
    quantity INT NOT NULL
);
GO

-- Tạo bảng Dealer
CREATE TABLE Dealer (
    ID INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    location VARCHAR(255) NOT NULL
);
GO

-- Tạo bảng Customer
CREATE TABLE Customer (
    ID INT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    age INT NOT NULL,
    phoneNumber VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(255) NOT NULL
);
GO

-- Tạo bảng quan hệ Car_Dealer (Đại lý phân phối xe)
CREATE TABLE Car_Dealer (
    car_ID INT NOT NULL,
    ID INT NOT NULL,
    CONSTRAINT PK_Car_Dealer PRIMARY KEY (car_ID, ID),
    CONSTRAINT FK_Car_Dealer_Car FOREIGN KEY (car_ID) REFERENCES Car(car_ID),
    CONSTRAINT FK_Car_Dealer_Dealer FOREIGN KEY (ID) REFERENCES Dealer(ID)
);
GO

-- Car_Purchase (Giao dịch mua xe của khách hàng)
CREATE TABLE Car_Purchase (
    ID INT NOT NULL,
    car_ID INT NOT NULL,
    CONSTRAINT PK_Car_Purchase PRIMARY KEY (ID, car_ID),
    CONSTRAINT FK_Car_Purchase_Customer FOREIGN KEY (ID) REFERENCES Customer(ID),
    CONSTRAINT FK_Car_Purchase_Car FOREIGN KEY (car_ID) REFERENCES Car(car_ID)
);
GO

-- Car_Supply (Cung cấp xe từ đại lý)
CREATE TABLE Car_Supply (
    car_ID INT NOT NULL,
    ID INT NOT NULL,
    CONSTRAINT PK_Car_Supply PRIMARY KEY (car_ID, ID),
    CONSTRAINT FK_Car_Supply_Car FOREIGN KEY (car_ID) REFERENCES Car(car_ID),
    CONSTRAINT FK_Car_Supply_Dealer FOREIGN KEY (ID) REFERENCES Dealer(ID)
);
GO

-- Thêm dữ liệu vào bảng Car
INSERT INTO Car (car_ID, car_Name, max_Speed, acceleration, price, quantity) VALUES
(1, 'Porsche 718 Boxster', '275 km/h', '4.9s', '4.380.000.000 VNĐ', 10),
(2, 'Porsche 911 Carrera', '293 km/h', '4.2s', '8.240.000.000 VNĐ', 5),
(3, 'Porsche Taycan', '230 km/h', '5.4s', '4.040.000.000 VNĐ', 7),
(4, 'Porsche Macan', '232 km/h', '6.4s', '3.280.000.000 VNĐ', 8),
(5, 'Porsche Cayenne', '248 km/h', '5.9s', '5.430.000.000 VNĐ', 6),
(6, 'Porsche Panamera', '270 km/h', '5.6s', '5.550.000.000 VNĐ', 4);
GO

-- Thêm dữ liệu vào bảng Dealer
INSERT INTO Dealer (ID, name, location) VALUES
(1, 'Porsche Sai Gon', 'Tan Thuan Dong, District 7, Ho Chi Minh City'),
(2, 'Porsche Ha Noi', 'Gia Thuy Ward, Long Bien District, Ha Noi');
GO

-- Thêm dữ liệu vào bảng Customer
INSERT INTO Customer (ID, name, age, phoneNumber, address) VALUES
(1, 'Nguyen Van A', 30, '0901234567', 'HCMC'),
(2, 'Tran Thi B', 28, '0912345678', 'Hanoi'),
(3, 'Le Van C', 35, '0923456789', 'Da Nang');
GO

-- Gán xe cho đại lý vào bảng Car_Dealer
INSERT INTO Car_Dealer (car_ID, ID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 2);
GO

-- Thêm dữ liệu vào bảng Car_Purchase (Khách hàng mua xe)
INSERT INTO Car_Purchase (ID, car_ID) VALUES
(1, 1),
(2, 3),
(3, 5);
GO

-- Thêm dữ liệu vào bảng Car_Supply (Nhà cung cấp giao xe cho đại lý)
INSERT INTO Car_Supply (car_ID, ID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1),
(6, 2);
GO

-- Truy vấn để kiểm tra dữ liệu
SELECT * FROM Car;
SELECT * FROM Dealer;
SELECT * FROM Customer;
SELECT * FROM Car_Dealer;
SELECT * FROM Car_Purchase;
SELECT * FROM Car_Supply;
GO
