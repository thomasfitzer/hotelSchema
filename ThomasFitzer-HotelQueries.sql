USE HotelDb;

-- QUERY 1
-- Write a query that returns a list of reservations that end in July 2023,
-- including the name of the guest, the room number(s), and the reservation dates.

SELECT
	Guest.FirstName,
    Guest.LastName,
    Room.RoomId,
    Reservation.StartDate,
    Reservation.EndDate
FROM Guest
INNER JOIN ResGuest ON Guest.GuestId = ResGuest.GuestId
INNER JOIN Reservation ON ResGuest.ReservationId = Reservation.ReservationId
INNER JOIN ResRoom ON Reservation.ReservationId = ResRoom.ReservationId
INNER JOIN Room ON ResRoom.RoomId = Room.RoomId
WHERE EndDate BETWEEN '2023-07-01' AND '2023-07-31';

-- 4 Rows
-- 'Thomas', 'Fitzer', '205', '2023-06-28', '2023-07-02'
-- 'Walter', 'Holaway', '204', '2023-07-13', '2023-07-14'
-- 'Wilfred', 'Vise', '401', '2023-07-18', '2023-07-21'
-- 'Bettyann', 'Seery', '303', '2023-07-28', '2023-07-29'

----------------------------------------
-- QUERY 2
-- Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.

SELECT
	Guest.FirstName,
    Guest.LastName,
    Room.RoomId,
    Reservation.StartDate,
    Reservation.EndDate
FROM Room
INNER JOIN ResRoom ON Room.RoomId = ResRoom.RoomId
INNER JOIN Reservation ON ResRoom.ReservationId = Reservation.ReservationId
INNER JOIN ResGuest ON ResGuest.ReservationId = Reservation.ReservationId
INNER JOIN Guest ON ResGuest.GuestId = Guest.GuestId
WHERE HasJacuzzi = 1;

-- 11 Rows
-- Karie Yang	201	2023-03-06	2023-03-07
-- Bettyann Seery	203	2023-02-05	2023-02-10
-- Karie Yang	203	2023-09-13	2023-09-15
-- Thomas Fitzer	205	2023-06-28	2023-07-02
-- Wilfred	Vise	207	2023-04-23	2023-04-24
-- Walter Holaway	301	2023-04-09	2023-04-13
-- Mack Simmer	301	2023-11-22	2023-11-25
-- Bettyann Seery	303	2023-07-28	2023-07-29
-- Duane Cullison	305	2023-02-22	2023-02-24
-- Bettyann Seery	305	2023-08-30	2023-09-01
-- Mack Simmer	307	2023-03-17	2023-03-20

-----------------------------
-- QUERY 3
-- Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT
	Guest.FirstName,
    Guest.LastName,
    Room.RoomId,
    Reservation.StartDate,
    Reservation.Adults + Reservation.Children AS TotalPeople
FROM Guest
INNER JOIN ResGuest ON Guest.GuestId = ResGuest.GuestId
INNER JOIN Reservation ON ResGuest.ReservationId = Reservation.ReservationId
INNER JOIN ResRoom ON Reservation.ReservationId = ResRoom.ReservationId
INNER JOIN Room On ResRoom.RoomId = Room.RoomId
WHERE Guest.GuestId = 3;

-- 3 Rows
-- Bettyann	Seery	203	2023-02-05	3
-- Bettyann	Seery	303	2023-07-28	3
-- Bettyann	Seery	305	2023-08-30	1
------------------------------

-- QUERY 4
-- Write a query that returns a list of rooms, 
-- reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not 
-- there is a reservation associated with the room.

SELECT
	Room.RoomId,
    Reservation.ReservationId,
	CASE
		WHEN (((Room.RoomId BETWEEN '201' and '204') OR (Room.RoomId BETWEEN '301' AND '304')) AND Reservation.Adults <= 2)
			THEN ((Room.BasePrice) * DATEDIFF(Reservation.EndDate, Reservation.StartDate))
		WHEN (((Room.RoomId BETWEEN '201' and '204') OR (Room.RoomId BETWEEN '301' AND '304')) AND Reservation.Adults > 2)
			THEN ((Room.BasePrice + ((Reservation.Adults - Room.StanOcc) * 10) * DATEDIFF(Reservation.EndDate, Reservation.StartDate)))
		WHEN ((Room.RoomId BETWEEN '205' AND '208') OR (Room.RoomId BETWEEN '305' AND '308'))
			THEN ((Room.BasePrice) * DATEDIFF(Reservation.EndDate, Reservation.StartDate))
		WHEN (((Room.RoomId BETWEEN '401' AND '402')) AND Reservation.Adults <= 3)
			THEN ((Room.BasePrice) * DATEDIFF(Reservation.EndDate, Reservation.StartDate))
		WHEN (((Room.RoomId BETWEEN '401' AND '402')) AND Reservation.Adults > 3)
			THEN ((Room.BasePrice + ((Reservation.Adults - Room.StanOcc) * 20) * DATEDIFF(Reservation.EndDate, Reservation.StartDate)))
		END AS Total
FROM Guest
RIGHT OUTER JOIN ResGuest ON Guest.GuestId = ResGuest.GuestId
RIGHT OUTER JOIN Reservation ON ResGuest.ReservationId = Reservation.ReservationId
RIGHT OUTER JOIN ResRoom ON Reservation.ReservationId = ResRoom.ReservationId
RIGHT OUTER JOIN Room ON ResRoom.RoomId = Room.RoomId;

-- 26 Rows
-- 201	4	199.99
-- 202	7	349.98
-- 203	2	999.95
-- 203	21	399.98
-- 204	16	184.99
-- 205	15	699.96
-- 206	12	599.96
-- 206	23	449.97
-- 207	10	149.99
-- 208	13	599.96
-- 208	20	149.99
-- 301	9	799.96
-- 301	24	599.97
-- 302	6	224.99
-- 302	25	699.96
-- 303	18	199.99
-- 304	14	184.99
-- 305	3	349.98
-- 305	19	349.98
-- 306		
-- 307	5	524.97
-- 308	1	299.98
-- 401	11	1199.97
-- 401	17	459.99
-- 401	22	1199.97
-- 402		
--------------------------

-- QUERY 5
-- Write a query that returns all the rooms accommodating at least 
-- three guests and that are reserved on any date in April 2023.

SELECT
	Room.RoomId
FROM Reservation
INNER JOIN ResRoom ON Reservation.ReservationId = ResRoom.ReservationId
INNER JOIN Room ON ResRoom.RoomId = Room.RoomId
WHERE (Reservation.Adults + Reservation.Children) > 2	
	AND ((Reservation.StartDate BETWEEN '2023-04-01' AND '2023-04-30')
    OR (Reservation.EndDate BETWEEN '2023-04-01' AND '2023-04-30'));

-- No rows returned
------------------------------------

-- QUERY 6
-- Write a query that returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the guest's last name.

SELECT
	g.FirstName,
    g.LastName,
    COUNT(rg.GuestId) AS TotalReservations
From Reservation r
INNER JOIN ResGuest rg ON r.ReservationId = rg.ReservationId
INNER JOIN Guest g ON rg.GuestId = g.GuestId
GROUP BY g.FirstName
ORDER BY TotalReservations DESC, g.LastName;

-- 11 rows returned
-- Mack	Simmer	5
-- Bettyann	Seery	3
-- Duane	Cullison	2
-- Walter	Holaway	2
-- Aurore	Lipton	2
-- Maritza	Tilton	2
-- Joleen	Tison	2
-- Wilfred	Vise	2
-- Karie	Yang	2
-- Thomas	Fitzer	1
-- Zachery	Luechtefeld	1
------------------

-- QUERY 7
-- Write a query that displays the name, address, and phone number of a guest 
-- based on their phone number. (Choose a phone number from the existing data.)

SELECT
	g.FirstName,
    g.LastName,
    g.Address,
    g.City,
    g.State,
    g.ZipCode,
    g.Phone
FROM Guest g WHERE g.Phone LIKE '%478-277-9632%';

-- 'Bettyann', 'Seery', '750 Wintergreen Dr', 'Wasilla', 'AK', '99654', '478-277-9632'

    