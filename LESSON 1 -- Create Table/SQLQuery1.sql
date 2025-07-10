CREATE DATABASE MyDatabase;

USE MyDatabase;

CREATE TABLE Hotel (
	guest_name nvarchar(40) not null,
	room_type nvarchar(40) not null,
	check_in_date datetime not null,
	check_out_date datetime not null,
	payment_status bit not null,
	special_requests nvarchar(60) null
);

INSERT INTO Hotel (guest_name, room_type, check_in_date, check_out_date, payment_status, special_requests)
VALUES 
('John Smith', 'Single', '2025-07-01 14:00:00', '2025-07-05 12:00:00', 1, 'Near elevator'),
('Emily Davis', 'Double', '2025-07-03 15:30:00', '2025-07-10 11:00:00', 1, 'High floor'),
('Michael Johnson', 'Suite', '2025-07-02 16:00:00', '2025-07-08 10:00:00', 0, 'Late check-in'),
('Sarah Brown', 'Single', '2025-07-04 13:45:00', '2025-07-06 12:15:00', 1, NULL),
('David Wilson', 'Double', '2025-07-05 14:15:00', '2025-07-12 11:30:00', 0, 'Extra pillows'),
('Laura Garcia', 'Single', '2025-07-06 12:00:00', '2025-07-09 10:45:00', 1, NULL),
('James Miller', 'Suite', '2025-07-07 15:00:00', '2025-07-14 12:00:00', 1, 'Sea view'),
('Emma Martinez', 'Double', '2025-07-01 14:20:00', '2025-07-03 11:15:00', 1, NULL),
('Robert Lee', 'Single', '2025-07-08 13:00:00', '2025-07-11 12:00:00', 0, 'Allergic to feathers'),
('Olivia Harris', 'Suite', '2025-07-02 16:45:00', '2025-07-09 11:00:00', 1, 'Vegan breakfast'),
('William Clark', 'Double', '2025-07-10 15:15:00', '2025-07-15 12:00:00', 1, NULL),
('Sophia Lewis', 'Single', '2025-07-11 13:30:00', '2025-07-13 11:45:00', 0, NULL),
('Daniel Walker', 'Suite', '2025-07-12 14:00:00', '2025-07-19 12:30:00', 1, 'No cleaning service'),
('Grace Hall', 'Double', '2025-07-13 14:30:00', '2025-07-17 10:00:00', 1, 'Gluten-free meals'),
('Matthew Allen', 'Single', '2025-07-14 12:45:00', '2025-07-16 11:15:00', 0, NULL),
('Chloe Young', 'Suite', '2025-07-15 13:00:00', '2025-07-22 12:00:00', 1, 'Bathtub'),
('Joseph King', 'Double', '2025-07-16 14:45:00', '2025-07-20 12:15:00', 1, NULL),
('Ella Wright', 'Single', '2025-07-17 13:20:00', '2025-07-18 11:45:00', 1, 'Quiet room'),
('Samuel Scott', 'Suite', '2025-07-18 15:00:00', '2025-07-25 11:30:00', 0, NULL),
('Lily Green', 'Double', '2025-07-19 12:30:00', '2025-07-23 10:45:00', 1, 'Balcony'),
('Henry Baker', 'Single', '2025-07-20 13:50:00', '2025-07-24 11:15:00', 1, NULL),
('Ava Adams', 'Suite', '2025-07-21 14:10:00', '2025-07-27 12:00:00', 0, 'Extra towels'),
('Logan Nelson', 'Double', '2025-07-22 15:30:00', '2025-07-26 11:30:00', 1, 'Late checkout'),
('Mia Carter', 'Single', '2025-07-23 13:40:00', '2025-07-25 12:00:00', 1, NULL),
('Anthony Mitchell', 'Suite', '2025-07-24 16:00:00', '2025-07-30 11:00:00', 1, NULL),
('Aria Perez', 'Double', '2025-07-25 14:00:00', '2025-07-29 10:30:00', 0, 'Room near stairs'),
('Benjamin Roberts', 'Single', '2025-07-26 13:10:00', '2025-07-28 11:20:00', 1, NULL),
('Zoe Turner', 'Suite', '2025-07-27 15:00:00', '2025-08-01 12:00:00', 1, 'Early check-in'),
('Nathan Phillips', 'Double', '2025-07-28 12:30:00', '2025-08-02 11:45:00', 0, 'Baby crib'),
('Victoria Campbell', 'Single', '2025-07-29 14:15:00', '2025-07-31 10:00:00', 1, NULL);



SELECT * FROM Hotel;