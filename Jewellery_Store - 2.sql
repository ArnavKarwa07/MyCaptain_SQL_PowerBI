-- Insert customers
INSERT INTO Customer (FirstName, LastName, Email, Password, Phone, Address)
VALUES
('Alice', 'Johnson', 'alice@example.com', 'password123', '1234567890', '123 Elm Street'),
('Bob', 'Smith', 'bob@example.com', 'password456', '0987654321', '456 Oak Avenue'),
('Charlie', 'Brown', 'charlie@example.com', 'password789', '1122334455', '789 Pine Road'),
('David', 'Wilson', 'david@example.com', 'password321', '2233445566', '101 Maple Blvd'),
('Eva', 'Davis', 'eva@example.com', 'password654', '3344556677', '202 Birch Lane');

-- Insert products
INSERT INTO Product (Name, Description, Price, StockQuantity, Weight, Category)
VALUES
('Gold Ring', '18K Gold Engagement Ring', 499.99, 10, 0.05, 'Rings'),
('Silver Necklace', '925 Silver Pendant Necklace', 79.99, 20, 0.1, 'Necklaces'),
('Diamond Earrings', 'Diamond Stud Earrings', 999.99, 5, 0.02, 'Earrings'),
('Platinum Bracelet', 'Elegant Platinum Bracelet', 1299.99, 3, 0.08, 'Bracelets'),
('Sapphire Pendant', '14K Gold Sapphire Pendant', 749.99, 8, 0.03, 'Necklaces'),
('Emerald Ring', '18K Gold Emerald Ring', 899.99, 12, 0.06, 'Rings'),
('Pearl Earrings', 'Freshwater Pearl Earrings', 199.99, 15, 0.01, 'Earrings'),
('Diamond Necklace', '14K Gold Diamond Necklace', 1999.99, 7, 0.05, 'Necklaces'),
('Rose Gold Ring', '14K Rose Gold Ring', 799.99, 10, 0.04, 'Rings'),
('Silver Bangle', '925 Silver Bangle', 149.99, 25, 0.1, 'Bracelets');

-- Insert orders
INSERT INTO `Order` (CustomerID, TotalAmount, OrderStatus)
VALUES
(1, 579.98, 'Pending'),
(2, 999.99, 'Shipped'),
(3, 799.99, 'Delivered'),
(4, 1299.99, 'Pending'),
(5, 1799.98, 'Shipped');

-- Insert order details
INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Subtotal)
VALUES
(1, 1, 1, 499.99),  -- Gold Ring
(1, 2, 1, 79.99),   -- Silver Necklace
(2, 3, 1, 999.99),  -- Diamond Earrings
(3, 1, 1, 499.99),  -- Gold Ring
(3, 4, 1, 799.99),  -- Platinum Bracelet
(4, 2, 2, 159.98),  -- Silver Necklace
(4, 5, 1, 749.99),  -- Sapphire Pendant
(5, 6, 1, 899.99),  -- Emerald Ring
(5, 7, 1, 199.99);  -- Pearl Earrings

select * from `order`;
select * from orderdetail;

update `order` set OrderDate = "2024-11-22 13:53:02" where orderid = 1;
update `order` set OrderDate = "2024-11-22 13:53:02" where orderid = 2;
update `order` set OrderDate = "2024-11-23 13:53:02" where orderid = 3;