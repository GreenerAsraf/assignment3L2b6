-- CREATE TABLE users (
--     id serial primary key,
--     username varchar(50) not null unique,
--     email varchar(100) not null unique,
--     password_hash varchar(255) not null,
--     created_at timestamp default current_timestamp
-- );

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(50) CHECK (role IN ('Customer', 'Admin'))
);

CREATE TABLE Vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) CHECK (type IN ('car', 'bike', 'truck')) NOT NULL,
    model VARCHAR(100),
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    price_per_day DECIMAL(10, 2) NOT NULL,
    availability_status VARCHAR(20) CHECK (availability_status IN ('available', 'booked', 'maintenance')) NOT NULL
);

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(user_id),
    vehicle_id INT REFERENCES Vehicles(vehicle_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'cancelled', 'completed')) NOT NULL
);

-- QUERY 1: Retrieve all bookings with customer and vehicle details

SELECT 
    bookings.booking_id,
    users.name AS customer_name,
    vehicles.name AS vehicle_name,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM 
    Bookings AS bookings
INNER JOIN 
    Users AS users ON bookings.user_id = users.user_id
INNER JOIN 
    Vehicles AS vehicles ON bookings.vehicle_id = vehicles.vehicle_id;

    --QUERY 2: Retrieve all available vehicles not currently booked
FROM Vehicles AS vehicles
vehicles.vehicle_id,
vehicles.name AS vehicle_name,
vehicles.type,
vehicles.model,
vehicles.registration_number,
vehicles.price_per_day,
vehicles.availability_status

WHERE NOT EXISTS (
    SELECT 1
    FROM Bookings AS bookings
    WHERE bookings.vehicle_id = vehicles.vehicle_id
);



-- QUERY 3: Retrieve all available vehicles of a specific type (e.g. cars).
SELECT 
    vehicle_id,
    name AS vehicle_name,
    type,
    model,
    registration_number,
    price_per_day,
    availability_status
FROM Vehicles
WHERE type = 'car'
  AND availability_status = 'available';

-- QUERY 4: GROUP BY and HAVING
-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings

SELECT 
    v.vehicle_id,
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles AS v
LEFT JOIN Bookings AS b 
    ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2;