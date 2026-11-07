-- ============================================================
-- Kigali International Airport Operations
-- Group: SQL Boyz
-- DBMS: MySQL 8.0+
-- Purpose: Initial schema based on the group's supplied ERD.
-- ============================================================

CREATE DATABASE IF NOT EXISTS kigali_airport_operations
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE kigali_airport_operations;

CREATE TABLE IF NOT EXISTS airlines (
    airline_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    airline_name VARCHAR(150) NOT NULL,
    country VARCHAR(100) NOT NULL,
    contact_email VARCHAR(254),
    CONSTRAINT uq_airlines_name_country UNIQUE (airline_name, country)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS gates (
    gate_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    gate_number VARCHAR(20) NOT NULL,
    terminal VARCHAR(50) NOT NULL,
    gate_status ENUM('AVAILABLE', 'OCCUPIED', 'MAINTENANCE', 'CLOSED')
        NOT NULL DEFAULT 'AVAILABLE',
    CONSTRAINT uq_gates_terminal_number UNIQUE (terminal, gate_number)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS flights (
    flight_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    flight_status ENUM('SCHEDULED', 'BOARDING', 'DEPARTED', 'ARRIVED',
                       'DELAYED', 'CANCELLED')
        NOT NULL DEFAULT 'SCHEDULED',
    airline_id INT UNSIGNED NOT NULL,
    gate_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_flights_airline
        FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_flights_gate
        FOREIGN KEY (gate_id) REFERENCES gates(gate_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_flight_times CHECK (arrival_time > departure_time),
    INDEX idx_flights_departure_time (departure_time),
    INDEX idx_flights_status (flight_status)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS passengers (
    passenger_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    passport_number VARCHAR(50) NOT NULL,
    nationality VARCHAR(100) NOT NULL,
    CONSTRAINT uq_passengers_passport UNIQUE (passport_number)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS tickets (
    ticket_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    booking_reference VARCHAR(30) NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    ticket_status ENUM('BOOKED', 'CONFIRMED', 'CANCELLED', 'USED')
        NOT NULL DEFAULT 'BOOKED',
    flight_id INT UNSIGNED NOT NULL,
    passenger_id INT UNSIGNED NOT NULL,
    CONSTRAINT uq_tickets_booking_reference UNIQUE (booking_reference),
    CONSTRAINT uq_tickets_flight_seat UNIQUE (flight_id, seat_number),
    CONSTRAINT fk_tickets_flight
        FOREIGN KEY (flight_id) REFERENCES flights(flight_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_tickets_passenger
        FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    INDEX idx_tickets_passenger (passenger_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS check_ins (
    checkin_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    checkin_time DATETIME NOT NULL,
    checkin_status ENUM('PENDING', 'COMPLETED', 'REJECTED')
        NOT NULL DEFAULT 'PENDING',
    baggage_count TINYINT UNSIGNED NOT NULL DEFAULT 0,
    ticket_id INT UNSIGNED NOT NULL,
    CONSTRAINT uq_checkins_ticket UNIQUE (ticket_id),
    CONSTRAINT fk_checkins_ticket
        FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Confirm the six tables created by this initial schema.
SHOW TABLES;
