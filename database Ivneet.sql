CREATE DATABASE TRAVEL_SOFTWARE_SYSTEM;
USE TRAVEL_SOFTWARE_SYSTEM;
CREATE TABLE BUS(
bus_id INT PRIMARY KEY,
bus_number INT NOT NULL UNIQUE,
bus_numberplate VARCHAR(50),
bus_type VARCHAR(50),
bus_capacity  BIGINT,
user_id INT UNIQUE
);
CREATE TABLE driver(
driver_id INT PRIMARY KEY,
driver_name VARCHAR(100),
driver_contact BIGINT(10),
user_id INT UNIQUE
);
CREATE TABLE user(
user_id INT PRIMARY KEY,
full_name VARCHAR(100),
contact_number BIGINT(10),
user_name VARCHAR(50),
user_password VARCHAR(50) NOT NULL,
account_category VARCHAR(50),
account_status VARCHAR(50)
);
CREATE TABLE payment(
booking_id INT PRIMARY KEY,
payment_id INT,
amount_paid INT,
payment_date DATE,
user_id INT,
 FOREIGN KEY(user_id) REFERENCES user(user_id)
 );
 CREATE TABLE customer(
 customer_id INT PRIMARY KEY,
 customer_contact BIGINT(10),
 customer_email VARCHAR(50),
 user_name VARCHAR(50),
 FOREIGN KEY(user_name) REFERENCES user(user_name),
 user_password VARCHAR(50) NOT NULL,
 FOREIGN KEY(user_password) REFERENCES user(user_password),
 account_status VARCHAR(50),
 FOREIGN KEY(account_status) REFERENCES user(account_status),
 user_01_id INT,
 FOREIGN KEY(user_01_id) REFERENCES user(user_id)
 );
 CREATE TABLE travel_schedule(
 schedule_id INT PRIMARY KEY,
 bus_id INT,
 FOREIGN KEY(bus_id) REFERENCES bus(bus_id),
 driver_id INT,
 FOREIGN KEY(driver_id) REFERENCES driver(driver_id),
 pickup_point VARCHAR(100),
 drop_point VARCHAR(100),
 schedule_date DATE,
 departure_time TIMESTAMP,
 estimated_arrival_time TIME,
 fare_amount INT,
 remarks VARCHAR(1000),
 user_id INT,
 FOREIGN KEY(user_id) REFERENCES user(user_id)
 );
 CREATE TABLE booking(
 booking_id INT PRIMARY KEY,
 schedule_id INT,
 FOREIGN KEY (schedule_id) REFERENCES travel_schedule(schedule_id),
 customwer_id INT,
 seat_no INT NOT NULL UNIQUE,
 fare_amount INT,
 FOREIGN KEY (fare_amount) REFERENCES travel_schedule(fare_amount),
 total_amount BIGINT,
 date_of_booking DATE,
 booking_status VARCHAR(50),
 user_id INT,
 FOREIGN KEY (user_id) REFERENCES user(user_id)
 );
CREATE TABLE seats(
seat_id INT PRIMARY KEY,
bus_id INT,
 FOREIGN KEY (bus_id) REFERENCES BUS(bus_id),
 seat_no VARCHAR(100) NOT NULL,
 is_available BOOLEAN NOT NULL,
 booked_by VARCHAR(100),
 booked_at TIMESTAMP
 );
 ALTER TABLE seats
 ADD COLUMN seat_type VARCHAR(50),
 ADD COLUMN seat_amount FLOAT;
 
 CREATE TABLE operator (
    operator_id INT PRIMARY KEY,
    operator_name VARCHAR(100) NOT NULL,
    contact_number BIGINT(10),
    email VARCHAR(50),
    user_id INT UNIQUE,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
CREATE TABLE dynamic_pricing (
    pricing_id INT PRIMARY KEY,
    operator_id INT,
    FOREIGN KEY (operator_id) REFERENCES operator(operator_id),
    bus_id INT,
    FOREIGN KEY (bus_id) REFERENCES BUS(bus_id),
    season_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    dynamic_price FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE BookingSeats (
    BookingSeatID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    BookingID INT NOT NULL,
    SeatID INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (seat_id) REFERENCES seats(seat_id)
);

 

