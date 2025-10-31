create database hotel_management;
use hotel_management;
-- Customers Table
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY AUTO_INCREMENT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100) UNIQUE,
Phone VARCHAR(15)
);

-- Rooms Table
CREATE TABLE Rooms (
RoomID INT PRIMARY KEY AUTO_INCREMENT,
RoomType VARCHAR(50),
PricePerNight DECIMAL(10, 2),
Status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available'
);

-- Bookings Table
CREATE TABLE Bookings (
BookingID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
RoomID INT,
CheckInDate DATE NOT NULL,
CheckOutDate DATE NOT NULL,
TotalPrice DECIMAL(10, 2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);

-- Payments Table
CREATE TABLE Payments (
PaymentID INT PRIMARY KEY AUTO_INCREMENT,
BookingID INT,
AmountPaid DECIMAL(10, 2),

PaymentMethod ENUM('Credit Card', 'Cash', 'Online'),
FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);