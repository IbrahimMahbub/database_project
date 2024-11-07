-- Create Database
CREATE DATABASE Location2;
USE Location2;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Region VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Amina Levy', 'Amina@mail.com', 'Singapore'),
(2, 'Jude Spears', 'Jude@mail.com', 'Singapore'),
(3, 'Ava Hoover', 'Ava@mail.com', 'Singapore'),
(4, 'Orlando Sheppard', 'Orlando@mail.com', 'Singapore'),
(5, 'Mira Delgado', 'Mira@mail.com', 'Singapore'),
(6, 'Ellison Daniel', 'llison@mail.com', 'Singapore'),
(7, 'Shane Benitez', 'Shane@mail.com', 'Singapore'),
(8, 'Rosa Hanson', 'Rosa@mail.com', 'Singapore');

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
(1, 3, 102, '2024-01-01'),
(2, 1, 109, '2024-01-02'),
(3, 5, 105, '2024-01-02'),
(4, 2, 103, '2024-01-03'),
(5, 4, 103, '2024-01-04'),
(6, 7, 103, '2024-01-04'),
(7, 8, 108, '2024-01-05');


-- Inventory Table
CREATE TABLE Inventory (
    ProductID INT,
    Stock INT,
    Location VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Inventory VALUES
(101, 17, 'Singapore'),
(102, 9, 'Singapore'),
(103, 11, 'Singapore'),
(104, 15, 'Singapore'),
(105, 9, 'Singapore'),
(106, 12, 'Singapore'),
(107, 4, 'Singapore'),
(108, 2, 'Singapore'),
(109, 7, 'Singapore'),
(110, 8, 'Singapore');
