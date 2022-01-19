USE HotelDb;

DROP DATABASE IF EXISTS HotelDb;

CREATE DATABASE HotelDb;

CREATE TABLE Room (
	RoomId INT PRIMARY KEY NOT NULL,
    RoomType INT NOT NULL,
    AdaAcc BOOLEAN NOT NULL,
    StanOcc INT NOT NULL,
    MaxOcc INT NOT NULL,
    BasePrice DECIMAL (5,2) NOT NULL,
    ExPerson DECIMAL (4,2) NOT NULL,
    HasJacuzzi BOOLEAN NOT NULL
    );
    
CREATE TABLE RoomType (
	RoomType INT PRIMARY KEY NOT NULL,
    DESCRIPTION VARCHAR (15)
);



CREATE TABLE Amenity (
	AmenityId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    AmenityType VARCHAR (30) NOT NULL
    );
    

    
CREATE TABLE Reservation (
	ReservationId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Adults INT NOT NULL,
    Children INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Total DECIMAL(8,2)
    );
    
    CREATE TABLE Guest (
		GuestId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        FirstName VARCHAR(50) NOT NULL,
        LastName VARCHAR (50) NOT NULL,
        Address VARCHAR (100) NOT NULL,
        City VARCHAR (50) NOT NULL,
        State CHAR (2) NOT NULL,
        ZipCode CHAR (5) NOT NULL,
        Phone CHAR (14) NOT NULL
		);
	
CREATE TABLE ResGuest (
	GuestId INT NOT NULL,
    ReservationId INT NOT NULL,
    PRIMARY KEY pk_ResGuest (GuestId, ReservationId),
    FOREIGN KEY fk_ResGuest_Guest (GuestId)
			REFERENCES Guest (GuestId),
        FOREIGN KEY fk_ResGuest_Reservation (ReservationId)
			REFERENCES Reservation (ReservationId)
);



CREATE TABLE ResRoom (
	RoomId INT,
    ReservationId INT,
    PRIMARY KEY pk_ResRoom (RoomId, ReservationId),
    FOREIGN KEY fk_ResRoom_Room (RoomId)
			REFERENCES Room (RoomId),
		FOREIGN KEY fk_ResRoom_Reservation (ReservationId)
			REFERENCES Reservation (ReservationId)
);

CREATE TABLE RoomAmenity (
	RoomId INT NOT NULL,
    AmenityId INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomId, AmenityId),
    FOREIGN KEY fk_RoomAmenity_Room (RoomId)
			REFERENCES Room (RoomId),
		FOREIGN KEY fk_RoomAmenity_Amenity (AmenityId)
			REFERENCES Amenity (AmenityId)
);

