-- Insert sample data into Flights table
INSERT INTO Flights (Airline, DepartureCity, DestinationCity, DepartureTime, ArrivalTime, Price)
VALUES 
    ('Airline A', 'City A', 'City B', '2024-12-01 08:00:00', '2024-12-01 12:00:00', 200.00),
    ('Airline B', 'City C', 'City D', '2024-12-02 10:00:00', '2024-12-02 14:00:00', 300.00),
    ('Airline C', 'City A', 'City C', '2024-12-03 09:00:00', '2024-12-03 13:00:00', 250.00);

-- Insert sample data into Hotels table
INSERT INTO Hotels (HotelName, Location, RoomType, PricePerNight)
VALUES 
    ('Hotel Luxury', 'City B', 'Suite', 150.00),
    ('Hotel Comfort', 'City D', 'Standard', 100.00),
    ('Hotel Economy', 'City C', 'Economy', 80.00);

-- Insert sample data into Customers table
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321'),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '1122334455');

-- Read Operations

-- Retrieve all flights
SELECT * FROM Flights;

-- Retrieve all hotels
SELECT * FROM Hotels;

-- Retrieve all customer information
SELECT * FROM Customers;

-- Retrieve details of available flights from City A to City B
SELECT * 
FROM Flights 
WHERE DepartureCity = 'City A' AND DestinationCity = 'City B';

-- Update Operations

-- Update flight details
UPDATE Flights
SET Price = 220.00, DepartureTime = '2024-12-01 09:00:00'
WHERE FlightID = 1;

-- Update hotel information
UPDATE Hotels
SET PricePerNight = 120.00
WHERE HotelName = 'Hotel Comfort';

-- Update customer contact details
UPDATE Customers
SET PhoneNumber = '3344556677'
WHERE Email = 'john.doe@example.com';

-- Insert new booking
INSERT INTO Bookings (CustomerID, FlightID, HotelID, BookingDate, TotalPrice)
VALUES (1, 1, 1, '2024-12-01', @TotalPrice);

-- Payment Script

-- Record a payment for BookingID = 1
INSERT INTO Payments (BookingID, PaymentAmount, PaymentDate)
VALUES (1, 350.00, '2024-12-02');

-- Retrieve all payments for a booking
SELECT * 
FROM Payments
WHERE BookingID = 1;

-- Delete Operations

-- Delete a booking
DELETE FROM Bookings
WHERE BookingID = 1;

-- Delete a flight
DELETE FROM Flights
WHERE FlightID = 1;

-- Delete a hotel
DELETE FROM Hotels
WHERE HotelID = 1;

-- clear all the tables
delete from Flights;
delete from Hotels;
delete from Customers;
delete from Bookings;
delete from Payments;