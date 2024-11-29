CREATE DATABASE jewellery_store;
USE jewellery_store;

CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Phone VARCHAR(20),
    Address TEXT,
    DateJoined DATETIME NOT NULL DEFAULT current_timestamp
);

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    Weight DECIMAL(10, 2),
    Category VARCHAR(50)
);

CREATE TABLE `Order` (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetail (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES `Order`(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Customer (FirstName, LastName, Email, Password, Phone, Address)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'password123', '1234567890', '123 Elm Street'),
('Bob', 'Smith', 'bob@example.com', 'password456', '0987654321', '456 Oak Avenue');

INSERT INTO Product (Name, Description, Price, StockQuantity, Weight, Category)
VALUES
('Gold Ring', '18K Gold Engagement Ring', 499.99, 10, 0.05, 'Rings'),
('Silver Necklace', '925 Silver Pendant Necklace', 79.99, 20, 0.1, 'Necklaces'),
('Diamond Earrings', 'Diamond Stud Earrings', 999.99, 5, 0.02, 'Earrings');

INSERT INTO `Order` (CustomerID, TotalAmount, OrderStatus)
VALUES
(1, 579.98, 'Pending'),
(2, 999.99, 'Shipped');

INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal)
VALUES
(1, 1, 1, 499.99),
(1, 2, 1, 79.99),
(2, 3, 1, 999.99);

-- Retrieve all customers
SELECT * FROM Customer;

-- Retrieve all products
SELECT * FROM Product;

-- Retrieve all orders
SELECT * FROM `Order`;

-- Retrieve details of a specific order (OrderID = 1)
SELECT * FROM OrderDetail WHERE OrderID = 1;

-- Retrieve the total number of customers
SELECT COUNT(*) AS TotalCustomers FROM Customer;

-- Retrieve products with stock less than 10
SELECT * FROM Product WHERE StockQuantity < 10;

-- Update stock quantity after a sale (reduce Gold Ring stock by 1)
UPDATE Product
SET StockQuantity = StockQuantity - 1
WHERE ProductID = 1;

-- Retrieve the updated stock for the Gold Ring
SELECT StockQuantity FROM Product WHERE ProductID = 1;

-- Retrieve the total value of a specific order (OrderID = 1)
SELECT SUM(Subtotal) AS TotalOrderValue FROM OrderDetail WHERE OrderID = 1;

-- Update the order status to 'Delivered' (OrderID = 2)
UPDATE `Order`
SET OrderStatus = 'Delivered'
WHERE OrderID = 2;

-- Retrieve all remaining customers
SELECT * FROM Customer;

-- Add a new product
INSERT INTO Product (Name, Description, Price, StockQuantity, Weight, Category)
VALUES ('Platinum Bracelet', 'Elegant Platinum Bracelet', 1299.99, 3, 0.08, 'Bracelets');

-- Retrieve products in the "Necklaces" category
SELECT * FROM Product WHERE Category = 'Necklaces';

-- Retrieve all orders with their corresponding customer details
SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.OrderStatus, c.FirstName, c.LastName
FROM `Order` o
JOIN Customer c ON o.CustomerID = c.CustomerID;

