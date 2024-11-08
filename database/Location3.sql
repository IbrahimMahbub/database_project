CREATE DATABASE Location3;
USE Location3;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Region VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Edith Ingram', 'Edith@email.com', 'USA'),
(2, 'Harold Huffman', 'Harold@email.com', 'USA'),
(3, 'Isabela Bautista', 'Isabela@email.com', 'USA'),
(4, 'Jaziel Galvan', 'Jaziel@email.com', 'USA'),
(5, 'RJaziel Galvan', 'RJaziel@email.com', 'USA'),
(6, 'Anya Ali', 'Anya@email.com', 'USA'),
(7, 'Grady Hutchinson', 'Grady@email.com', 'USA');

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

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders VALUES
(1, 7, 105, '2024-01-01'),
(2, 3, 106, '2024-01-01'),
(3, 2, 103, '2024-01-02'),
(4, 1, 107, '2024-01-02'),
(5, 4, 110, '2024-01-02'),
(6, 6, 109, '2024-01-03'),
(7, 5, 103, '2024-01-03'),
(8, 2, 101, '2024-01-03'),
(9, 1, 102, '2024-01-03'),
(10, 4, 104, '2024-01-03');


CREATE TABLE Inventory (
    ProductID INT,
    Stock INT,
    Location VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Inventory VALUES
(101, 12, 'USA'),
(102, 23, 'USA'),
(103, 15, 'USA'),
(104, 9, 'USA'),
(105, 11, 'USA'),
(106, 23, 'USA'),
(107, 5, 'USA'),
(108, 7, 'USA'),
(109, 0, 'USA'),
(110, 23, 'USA');
