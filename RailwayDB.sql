CREATE DATABASE RailwayReservationDB;
USE RailwayReservationDB;

-- Table: Trains
CREATE TABLE Trains (
    TrainID INT PRIMARY KEY AUTO_INCREMENT,
    TrainName VARCHAR(100) NOT NULL,
    Source VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    TotalSeats INT NOT NULL
);

-- Table: Passengers
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

-- Table: Reservations
CREATE TABLE Reservations (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    PassengerID INT,
    TrainID INT,
    JourneyDate DATE NOT NULL,
    SeatNumber VARCHAR(10) NOT NULL,
    Class VARCHAR(20),
    Status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    FOREIGN KEY (TrainID) REFERENCES Trains(TrainID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationID INT,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentDate DATE NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
);

-- Sample Data

-- Insert into Trains
INSERT INTO Trains (TrainName, Source, Destination, DepartureTime, ArrivalTime, TotalSeats) VALUES
('Express 101', 'New York', 'Los Angeles', '08:00:00', '20:00:00', 200),
('Coastal Line', 'San Francisco', 'Seattle', '10:00:00', '18:00:00', 150);

-- Insert into Passengers
INSERT INTO Passengers (FirstName, LastName, Age, Gender, Email, Phone) VALUES
('Alice', 'Johnson', 30, 'Female', 'alice@example.com', '123-456-7890'),
('Bob', 'Smith', 40, 'Male', 'bob@example.com', '234-567-8901');

-- Insert into Reservations
INSERT INTO Reservations (PassengerID, TrainID, JourneyDate, SeatNumber, Class, Status) VALUES
(1, 1, '2023-10-15', 'A1', 'First Class', 'Confirmed'),
(2, 2, '2023-10-16', 'B5', 'Economy', 'Confirmed');

-- Insert into Payments
INSERT INTO Payments (ReservationID, PaymentMethod, PaymentDate, AmountPaid) VALUES
(1, 'Credit Card', '2023-10-01', 150.00),
(2, 'PayPal', '2023-10-02', 100.00);
