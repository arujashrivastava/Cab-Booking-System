create database CabBookingSystem;
USE CabBookingSystem;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255)
);
CREATE TABLE Drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    license_number VARCHAR(50)
);
CREATE TABLE Cabs (
    cab_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT,
    cab_number VARCHAR(20),
    cab_model VARCHAR(100),
    cab_type VARCHAR(50),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);
CREATE TABLE Routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    source VARCHAR(100),
    destination VARCHAR(100),
    distance_km DECIMAL(5,2)
);
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    cab_id INT,
    route_id INT,
    booking_date DATE,
    fare DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (cab_id) REFERENCES Cabs(cab_id),
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    rating INT, -- Rating out of 5
    comments VARCHAR(500),
    feedback_date DATE,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
CREATE TABLE DriverAvailability (
    driver_id INT,
    available BOOLEAN,
    last_updated TIMESTAMP,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);
INSERT INTO Customers (name, email, phone, address) VALUES
('Rahul Sharma', 'rahul.sharma@gmail.com', '9876543210', '23 MG Road, Bangalore'),
('Anita Verma', 'anita.verma@gmail.com', '8765432109', '56 Residency Road, Mumbai'),
('Vikram Singh', 'vikram.singh@gmail.com', '7654321098', '78 Park Street, Kolkata'),
('Priya Kapoor', 'priya.kapoor@gmail.com', '6543210987', '12 JLN Marg, Jaipur'),
('Arjun Mehta', 'arjun.mehta@gmail.com', '9432109876', '90 Connaught Place, Delhi'),
('Sneha Das', 'sneha.das@gmail.com', '8321098765', '45 Salt Lake, Kolkata'),
('Rohan Patil', 'rohan.patil@gmail.com', '7210987654', '33 Shivaji Park, Pune'),
('Meera Nair', 'meera.nair@gmail.com', '9109876543', '67 MG Road, Chennai'),
('Akash Gupta', 'akash.gupta@gmail.com', '8098765432', '89 Lajpat Nagar, Delhi'),
('Divya Joshi', 'divya.joshi@gmail.com', '9988776655', '12 Carter Road, Mumbai');

INSERT INTO Drivers (name, phone, license_number) VALUES
('Rajesh Kumar', '9988776654', 'DL12345678'),
('Suresh Patel', '8877665543', 'DL87654321'),
('Anil Yadav', '7766554432', 'MH23456789'),
('Ravi Sharma', '9655443321', 'TN34567890'),
('Karan Singh', '9544332210', 'KA45678901'),
('Amit Joshi', '9433221109', 'AP56789012'),
('Sandeep Verma', '8322110098', 'WB67890123'),
('Mohit Raina', '8211009987', 'RJ78901234'),
('Vikas Dubey', '9100998876', 'UP89012345'),
('Naveen Rao', '8099887765', 'HR90123456');

INSERT INTO Cabs (driver_id, cab_number, cab_model, cab_type) VALUES
(1, 'KA01AB1234', 'Maruti Swift', 'Hatchback'),
(2, 'MH02CD5678', 'Hyundai i20', 'Hatchback'),
(3, 'DL03EF9012', 'Toyota Innova', 'SUV'),
(4, 'TN04GH3456', 'Honda City', 'Sedan'),
(5, 'KA05IJ7890', 'Maruti Ertiga', 'MPV'),
(6, 'MH06KL1234', 'Honda Amaze', 'Sedan'),
(7, 'WB07MN5678', 'Ford EcoSport', 'SUV'),
(8, 'RJ08OP9012', 'Tata Tiago', 'Hatchback'),
(9, 'UP09QR3456', 'Mahindra XUV500', 'SUV'),
(10, 'HR10ST7890', 'Hyundai Verna', 'Sedan');

INSERT INTO Routes (source, destination, distance_km) VALUES
('MG Road, Bangalore', 'Airport, Bangalore', 35.5),
('Connaught Place, Delhi', 'Indira Gandhi Airport, Delhi', 18.0),
('Marine Drive, Mumbai', 'Chhatrapati Shivaji Airport, Mumbai', 22.0),
('Salt Lake, Kolkata', 'Howrah Station, Kolkata', 10.5),
('JLN Marg, Jaipur', 'Jaipur Airport', 12.0),
('Shivaji Park, Pune', 'Pune Railway Station', 15.0),
('MG Road, Chennai', 'Chennai Airport', 20.0),
('Lajpat Nagar, Delhi', 'New Delhi Railway Station', 8.0),
('Carter Road, Mumbai', 'Bandra Terminus, Mumbai', 6.5),
('Park Street, Kolkata', 'Sealdah Station, Kolkata', 5.0);

INSERT INTO Bookings (customer_id, cab_id, route_id, booking_date, fare) VALUES
(1, 1, 1, '2023-09-01', 500.00),
(2, 2, 2, '2023-09-02', 350.00),
(3, 3, 3, '2023-09-03', 600.00),
(4, 4, 4, '2023-09-04', 200.00),
(5, 5, 5, '2023-09-05', 250.00),
(6, 6, 6, '2023-09-06', 300.00),
(7, 7, 7, '2023-09-07', 400.00),
(8, 8, 8, '2023-09-08', 150.00),
(9, 9, 9, '2023-09-09', 100.00),
(10, 10, 10, '2023-09-10', 450.00);

INSERT INTO Payments (booking_id, payment_date, amount, payment_method) VALUES
(1, '2023-09-01', 500.00, 'Credit Card'),
(2, '2023-09-02', 350.00, 'UPI'),
(3, '2023-09-03', 600.00, 'Cash'),
(4, '2023-09-04', 200.00, 'Debit Card'),
(5, '2023-09-05', 250.00, 'Net Banking'),
(6, '2023-09-06', 300.00, 'Credit Card'),
(7, '2023-09-07', 400.00, 'UPI'),
(8, '2023-09-08', 150.00, 'Cash'),
(9, '2023-09-09', 100.00, 'Debit Card'),
(10, '2023-09-10', 450.00, 'Credit Card');

INSERT INTO Feedback (booking_id, rating, comments, feedback_date) VALUES
(1, 5, 'The driver was punctual and polite.', '2023-09-01'),
(2, 4, 'Good experience, but the cab was not very clean.', '2023-09-02'),
(3, 2, 'The driver was rude and unprofessional.', '2023-09-03'),
(4, 3, 'Average service.', '2023-09-04'),
(5, 4, 'The ride was smooth, but the route taken was too long.', '2023-09-05'),
(6, 5, 'I will use this service again.', '2023-09-06'),
(7, 1, 'Terrible experience. The cab broke down mid-journey.', '2023-09-07'),
(8, 4, 'The driver was a bit slow.', '2023-09-08'),
(9, 5, 'Excellent! The best cab service I have used.', '2023-09-09'),
(10, 3, 'Decent ride, but the fare was too high.', '2023-09-10');

INSERT INTO DriverAvailability (driver_id, available, last_updated) VALUES
(1, TRUE, '2023-09-01 09:00:00'),
(2, FALSE, '2023-09-02 09:30:00'),
(3, TRUE, '2023-09-07 10:00:00'),
(4, TRUE, '2023-09-07 10:15:00'),
(5, FALSE, '2023-09-07 10:30:00'),
(6, TRUE, '2023-09-08 10:45:00'),
(7, FALSE, '2023-09-09 11:00:00'),
(8, TRUE, '2023-09-09 11:15:00'),
(9, FALSE, '2023-09-10 11:30:00'),
(10, TRUE, '2023-09-10 12:00:00');

#Select All Customers
SELECT * FROM Customers;

#Retrieves booking details along with the customer's name 
SELECT b.booking_id, c.name, b.booking_date, b.fare
FROM Bookings b
INNER JOIN Customers c ON b.customer_id = c.customer_id;

#Calculates the total amount paid by each customer 
SELECT c.name, SUM(p.amount) AS total_paid
FROM Payments p
INNER JOIN Bookings b ON p.booking_id = b.booking_id
INNER JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.name;

#List Drivers with No Bookings
SELECT d.name
FROM Drivers d
WHERE d.driver_id NOT IN (
    SELECT c.driver_id
    FROM Cabs c
    INNER JOIN Bookings b ON c.cab_id = b.cab_id
);

#Count of Bookings per Route
SELECT r.source, r.destination, COUNT(b.booking_id) AS total_bookings
FROM Routes r
LEFT JOIN Bookings b ON r.route_id = b.route_id
GROUP BY r.source, r.destination;

#Maximum Fare on a Specific Route
SELECT MAX(fare) AS max_fare
FROM Bookings
WHERE route_id = 1;

#Find Average Fare per Route
SELECT r.source, r.destination, AVG(b.fare) AS avg_fare
FROM Bookings b
INNER JOIN Routes r ON b.route_id = r.route_id
GROUP BY r.source, r.destination;

#Retrieve all customer information who have given a rating of 5:
SELECT c.name, c.email, f.rating, f.comments
FROM Customers c
JOIN Feedback f ON c.customer_id = f.booking_id
WHERE f.rating = 5;

#Find the availability status of drivers as of the latest update:
SELECT d.name, da.available, da.last_updated
FROM Drivers d
JOIN DriverAvailability da ON d.driver_id = da.driver_id
ORDER BY da.last_updated DESC;

#Find the busiest route based on the number of bookings:
SELECT r.source, r.destination
FROM Routes r
JOIN Bookings b ON r.route_id = b.route_id
GROUP BY r.route_id
ORDER BY COUNT(b.booking_id) DESC
LIMIT 1;

ALTER TABLE Bookings
ADD driver_id INT, ADD FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id);

INSERT INTO Bookings (customer_id, cab_id, route_id, driver_id, booking_date, fare) VALUES
(1, 1, 1,1,'2023-09-01', 500.00),
(2, 2, 2,2, '2023-09-02', 350.00);

#Find the total number of trips each driver has completed:
SELECT d.name AS driver_name, COUNT(b.booking_id) AS total_trips
FROM Drivers d
JOIN Bookings b ON d.driver_id = b.driver_id
GROUP BY d.driver_id;

#Show the top 3 drivers with the highest average feedback rating:
SELECT d.name, AVG(f.rating) AS average_rating
FROM Drivers d
JOIN Bookings b ON d.driver_id = b.driver_id
JOIN Feedback f ON b.booking_id = f.booking_id
GROUP BY d.driver_id, d.name
ORDER BY average_rating DESC
LIMIT 1;





