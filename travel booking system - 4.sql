-- Update flight details (change price)
UPDATE Flights SET Price = 220.00 WHERE FlightID = 1;
-- Update hotel information (change location)
UPDATE Hotels SET Location = 'NewCity' WHERE HotelID = 1;
-- Update customer contact details (change phone number)
UPDATE Customers SET PhoneNumber = '555-1234' WHERE CustomerID = 1;
-- Retrieve the details of all flights departing from 'CityA':
SELECT * FROM Flights WHERE DepartureCity = 'CityA';
-- Find the hotels with room types 'Double' and their prices:
SELECT HotelName, RoomType, PricePerNight FROM Hotels WHERE RoomType = 'Double';
-- Retrieve bookings made for a specific flight (FlightID = 2):
SELECT * FROM Bookings WHERE FlightID = 2;
-- Retrieve the details of flights with prices less than $250
SELECT * FROM Flights WHERE Price < 250.00;
-- Retrieve all payments made within a specific date range (e.g., '2024-03-01' to '2024-03-31'):
SELECT * FROM Payments
WHERE PaymentDate BETWEEN '2024-03-01' AND '2024-03-31';
-- Cancel a booking
DELETE FROM Bookings WHERE BookingID = 1;
-- Remove a flight from the system
DELETE FROM Flights WHERE FlightID = 1;
-- Remove a hotel from the system
DELETE FROM Hotels WHERE HotelID = 1;