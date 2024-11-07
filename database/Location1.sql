-- Create Database
CREATE DATABASE Location1;
USE Location1;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Region VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Quincy Guerra', 'quincy@email.com', 'Finland'),
(2, 'Katalina Poole', 'katalina@email.com', 'Finland'),
(3, 'Grant Miranda', 'muranda@email.com', 'Finland'),
(4, 'Elise Guzman', 'elise@eemail.com', 'Finland'),
(5, 'Ronan Williams', 'ronan@email.com', 'Finland'),
(6, 'Reese Conway', 'reese@email.com', 'Finland');

-- Products Table (create this before Orders to avoid foreign key issues)
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products VALUES
(101, 'Laptop', 799.99),
(102, 'Smartphone', 499.99),
(103, 'Tablet', 299.99),
(104, 'Smartwatch', 199.99),
(105, 'TV', 699.99),
(106, 'Phone Charger', 29.99),
(107, 'Laptop Charger', 49.99),
(108, 'HDMI Cable', 9.99),
(109, 'Mouse', 14.99),
(110, 'Keyboard', 24.99);

-- Orders Table (create after Products to enable foreign key references)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders VALUES
(1, 1, 101, '2024-01-01'),
(2, 3, 105, '2024-01-01'),
(3, 5, 107, '2024-01-02'),
(4, 2, 103, '2024-01-02'),
(5, 4, 110, '2024-01-03');


-- Inventory Table
CREATE TABLE Inventory (
    ProductID INT,
    Stock INT,
    Location VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Inventory VALUES
(101, 3, 'Finland'),
(102, 5, 'Finland'),
(103, 7, 'Finland'),
(104, 15, 'Finland'),
(105, 11, 'Finland'),
(106, 19, 'Finland'),
(107, 8, 'Finland'),
(108, 26, 'Finland'),
(109, 1, 'Finland'),
(110, 16, 'Finland');
