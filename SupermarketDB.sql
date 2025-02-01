CREATE DATABASE SupermarketDB;
USE SupermarketDB;

-- Table: Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
-- Table: Suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT
);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address TEXT
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2),
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table: OrderDetails (Many-to-Many between Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentDate DATE NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Sample Data

-- Insert into Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Phone, Address) VALUES
('Fresh Farms', 'John Doe', '123-456-7890', '123 Green St, City'),
('Dairy Best', 'Jane Smith', '234-567-8901', '456 Milk Ave, Town');

-- Insert into Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity, SupplierID) VALUES
('Apple', 'Fruits', 1.50, 100, 1),
('Milk', 'Dairy', 2.00, 50, 2);

-- Insert into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Alice', 'Johnson', 'alice@example.com', '345-678-9012', '789 Maple Rd, Village'),
('Bob', 'Brown', 'bob@example.com', '456-789-0123', '321 Oak St, City');

-- Insert into Employees
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate) VALUES
('Charlie', 'White', 'Cashier', 3000.00, '2022-01-15'),
('Diana', 'Green', 'Manager', 5000.00, '2021-06-01');

-- Insert into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, EmployeeID) VALUES
(1, '2023-09-25', 3.50, 1),
(2, '2023-09-26', 2.00, 2);

-- Insert into OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES
(1, 1, 2, 3.00),
(2, 2, 1, 2.00);

-- Insert into Payments
INSERT INTO Payments (OrderID, PaymentMethod, PaymentDate, AmountPaid) VALUES
(1, 'Credit Card', '2023-09-25', 3.50),
(2, 'Cash', '2023-09-26', 2.00);
