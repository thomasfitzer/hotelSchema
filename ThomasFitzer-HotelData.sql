USE HotelDb;

-- Assigning the correct ID to the corresponding amenity.
INSERT INTO Amenity (AmenityType) VALUES
	('Microwave'),
    ('Refrigerator'),
    ('Oven');

-- Assigning the type of room to the corresponding number.
INSERT INTO RoomType (RoomType, Description) VALUES
	(1, 'Single'),
    (2, 'Double'),
    (3, 'Suite');

-- This was a test to make sure the info entered in correctly.    
INSERT INTO Room (RoomId, RoomType, AdaAcc, StanOcc, MaxOcc, BasePrice, ExPerson, HasJacuzzi) VALUES
	(201, 2, 0, 2, 4, 199.99, 10.00, 1),
    (202, 2, 1, 2, 4, 174.99, 10.00, 0);

-- Inserting the rest of the room information.
INSERT INTO Room (RoomId, RoomType, AdaAcc, StanOcc, MaxOcc, BasePrice, ExPerson, HasJacuzzi) VALUES
	(203, 2, 0, 2, 4, 199.99, 10.00, 1),
    (204, 2, 1, 2, 4, 174.99, 10.00, 0),
    (205, 1, 0, 2, 2, 174.99, 0.00, 1),
    (206, 1, 1, 2, 2, 149.99, 0.00, 0),
    (207, 1, 0, 2, 2, 149.99, 0.00, 1),
    (208, 1, 1, 2, 2, 149.99, 0.00, 0), 
    (301, 2, 0, 2, 4, 199.99, 10.00, 1),
    (302, 2, 1, 2, 4, 174.99, 10.00, 0),
    (303, 2, 0, 2, 4, 199.99, 10.00, 1),
    (304, 2, 1, 2, 4, 174.99, 10.00, 0),
    (305, 1, 0, 2, 2, 174.99, 0.00, 1),
    (306, 1, 1, 2, 2, 149.99, 0.00, 0),
    (307, 1, 0, 2, 2, 174.99, 0.00, 1),
    (308, 1, 1, 2, 2, 149.99, 0.00, 0),
    (401, 3, 1, 3, 8, 399.99, 20.00, 0),
    (402, 3, 1, 3, 8, 399.99, 20.00, 0);

-- Entering in which room has which amenity.    
INSERT INTO RoomAmenity (RoomId, AmenityId) VALUES
	(201, 1),
    (202, 2),
    (203, 1),
    (204, 2),
    (205, 1),
    (205, 2),
    (206, 1),
    (206, 2),
    (207, 1),
    (207, 2),
    (208, 1),
    (208, 2),
    (301, 1),
    (302, 2),
    (303, 1),
    (304, 2),
    (305, 1),
    (305, 2),
    (306, 1),
    (306, 2),
    (307, 1),
    (307, 2),
    (308, 1),
    (308, 2),
    (401, 1),
    (401, 2),
    (401, 3),
    (402, 1),
    (402, 2),
    (402, 3);

-- First one was a test to make sure    
INSERT INTO Reservation (Adults, Children, StartDate, EndDate, Total) VALUES
	(1, 0, '2023-02-02 00:00:00', '2023-02-04 00:00:00', 299.98);

-- Just the reservation data.    
INSERT INTO Reservation (Adults, Children, StartDate, EndDate, Total) VALUES
	(2, 1, '2023-02-05 00:00:00', '2023-02-10 00:00:00', 999.95),
    (2, 0, '2023-02-22 00:00:00', '2023-02-24 00:00:00', 349.98),
    (2, 2, '2023-03-06 00:00:00', '2023-03-07 00:00:00', 199.99),
    (2, 2, '2023-03-17 00:00:00', '2023-03-20 00:00:00', 524.97),
    (3, 0, '2023-03-18 00:00:00', '2023-03-23 00:00:00', 924.95),
    (2, 2, '2023-03-29 00:00:00', '2023-03-31 00:00:00', 349.98),
    (2, 0, '2023-03-31 00:00:00', '2023-04-05 00:00:00', 874.95),
    (1, 0, '2023-04-09 00:00:00', '2023-04-13 00:00:00', 799.96),
    (1, 1, '2023-04-23 00:00:00', '2023-04-24 00:00:00', 174.99),
    (2, 4, '2023-05-30 00:00:00', '2023-06-02 00:00:00', 1199.97),
    (2, 0, '2023-06-10 00:00:00', '2023-06-14 00:00:00', 599.96),
    (1, 0, '2023-06-10 00:00:00', '2023-06-14 00:00:00', 599.96),
    (3, 0, '2023-06-17 00:00:00', '2023-06-18 00:00:00', 184.99),
    (2, 0, '2023-06-28 00:00:00', '2023-07-02 00:00:00', 699.96),
    (3, 1, '2023-07-13 00:00:00', '2023-07-14 00:00:00', 184.99),
    (4, 2, '2023-07-18 00:00:00', '2023-07-21 00:00:00', 1259.97),
    (2, 1, '2023-07-28 00:00:00', '2023-07-29 00:00:00', 199.99),
    (1, 0, '2023-08-30 00:00:00', '2023-09-01 00:00:00', 349.98),
    (2, 0, '2023-09-16 00:00:00', '2023-09-17 00:00:00', 149.99),
    (2, 2, '2023-09-13 00:00:00', '2023-09-15 00:00:00', 399.98),
    (2, 2, '2023-11-22 00:00:00', '2023-11-25 00:00:00', 1199.97),
    (2, 0, '2023-11-22 00:00:00', '2023-11-25 00:00:00', 449.97),
    (2, 2, '2023-11-22 00:00:00', '2023-11-25 00:00:00', 599.97),
    (2, 0, '2023-12-24 00:00:00', '2023-12-28 00:00:00', 699.96);
    
INSERT INTO Guest (FirstName, LastName, Address, City, State, ZipCode, Phone) VALUES
	('Thomas', 'Fitzer', '742 Evergreen Ter', 'Springfield', 'OR', '97403', '555-555-5555'),
    ('Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '291-553-0508'),
    ('Bettyann', 'Seery', '750 Wintergreen Dr', 'Wasilla', 'AK', '99654', '478-277-9632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '308-494-0198'),
    ('Karie', 'Yang', '9378 W Augusta Ave', 'West Deptford', 'NJ', '08096', '214-730-0298'),
    ('Aurore', 'Lipton', '762 Wild Rose St', 'Saginaw', 'MI', '48601', '377-507-0974'),
    ('Zachery', 'Luechtefeld', '7 Poplar Dr', 'Arvada', 'CO', '80003', '814-485-2615'),
    ('Jeremiah', 'Pendergrass', '70 Oakwood St', 'Zion', 'IL', '60099', '279-491-0960'),
    ('Walter', 'Holaway', '7556 Arrowhead St', 'Cumberland', 'RI', '02864', '446-396-6785'),
	('Wilfred', 'Vise', '77 West Surrey St', 'Oswego', 'NY', '13126', '834-727-1001'),
    ('Maritza', 'Tilton', '939 Linda Rd', 'Burke', 'VA', '22015', '446-351-2755'),
    ('Joleen', 'Tison', '87 Queen St', 'Drexel Hill', 'PA', '19026', '231-893-2755');
    

    
INSERT INTO ResGuest (GuestId, ReservationId) VALUES
	(2, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (2, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (12, 13),
    (6, 14),
    (1, 15),
    (9, 16),
    (10, 17),
    (3, 18),
    (3, 19),
    (2, 20),
    (5, 21),
    (4, 22),
    (2, 23),
    (2, 24),
    (11, 25);
    
INSERT INTO ResRoom (RoomId, ReservationId) VALUES
	(308, 1),
    (203, 2),
    (305, 3),
    (201, 4),
    (307, 5),
    (302, 6),
    (202, 7),
    (304, 8),
    (301, 9),
    (207, 10),
    (401, 11),
    (206, 12),
    (208, 13),
    (304, 14),
    (205, 15),
    (204, 16),
    (401, 17),
    (303, 18),
    (305, 19),
    (208, 20),
    (203, 21),
    (401, 22),
    (206, 23),
    (301, 24),
    (302, 25);

-- Better way to do this?  
-- Use the one right below for the rest of them.  
-- TRANSACTION STUFF APPLIES HERE
-- Paypal example
-- (SELECT GuestId FROM Guest WHERE FirstName = 'Jeremiah' AND LastName = 'Pendergrass');
-- Use this in the future ^
DELETE FROM ResGuest WHERE GuestId = 8; 
DELETE FROM ResRoom WHERE ReservationId = 8;
DELETE FROM Reservation WHERE ReservationId = 8;
DELETE FROM Guest WHERE GuestId = 8;




    

    

