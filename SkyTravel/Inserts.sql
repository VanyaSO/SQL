INSERT INTO Languages (Title) VALUES 
('UA'),
('RU'),
('EN'),
('FR'),
('DE'),
('ES'),
('IT'),
('CN'),
('JP'),
('KR'),
('PL'),
('CZ'),
('PT'),
('NL'),
('SE');

INSERT INTO Currencies (Title, Code, Rate) VALUES 
('Ukrainian Hryvnia', 'UAH', 0.037),
('US Dollar', 'USD', 1.00),
('Euro', 'EUR', 1.10),
('British Pound', 'GBP', 1.25),
('Canadian Dollar', 'CAD', 0.74),
('Australian Dollar', 'AUD', 0.67),
('Swiss Franc', 'CHF', 1.09),
('Japanese Yen', 'JPY', 0.007),
('Chinese Yuan', 'CNY', 0.14),
('Indian Rupee', 'INR', 0.012);

INSERT INTO Passegers (Name, LastName, DateOfBirth, Nationality, Gender, PassportNumber) VALUES 
('Ivan', 'Ivanov', '1990-01-01', 'Ukraine', 'Male', 'AA1234567'),
('John', 'Doe', '1985-05-15', 'USA', 'Male', 'BB7654321'),
('Maria', 'Petrova', '1992-09-10', 'Russia', 'Female', 'CC9876543'),
('Alice', 'Smith', '1988-12-22', 'UK', 'Female', 'DD1234567'),
('Hiroshi', 'Tanaka', '1980-07-19', 'Japan', 'Male', 'EE7654321'),
('Chen', 'Li', '1989-11-11', 'China', 'Male', 'FF9876543'),
('Olga', 'Sokolova', '1993-03-30', 'Russia', 'Female', 'GG1234567'),
('Emily', 'Johnson', '1991-06-06', 'USA', 'Female', 'HH7654321'),
('Nina', 'Kovalenko', '1994-01-15', 'Ukraine', 'Female', 'II9876543'),
('Lucas', 'Miller', '1987-09-28', 'Canada', 'Male', 'JJ1234567'),
('Sophia', 'Williams', '1986-08-20', 'UK', 'Female', 'KK7654321'),
('David', 'Brown', '1995-10-10', 'USA', 'Male', 'LL9876543'),
('Elena', 'Davis', '1992-04-25', 'UK', 'Female', 'MM1234567'),
('Michael', 'Wilson', '1990-12-12', 'Canada', 'Male', 'NN7654321'),
('Anna', 'Miller', '1991-05-30', 'USA', 'Female', 'OO9876543'),
('Satoshi', 'Yamamoto', '1988-11-11', 'Japan', 'Male', 'PP1234567'),
('Yulia', 'Popova', '1994-06-12', 'Russia', 'Female', 'QQ7654321'),
('Alex', 'Brown', '1987-03-23', 'UK', 'Male', 'RR9876543'),
('Jin', 'Huang', '1989-02-17', 'China', 'Male', 'SS1234567'),
('Kate', 'Anderson', '1995-07-01', 'USA', 'Female', 'TT7654321'),
('Robert', 'Clark', '1993-09-09', 'Canada', 'Male', 'UU9876543'),
('Nadia', 'Kuznetsova', '1992-05-22', 'Russia', 'Female', 'VV1234567'),
('Liam', 'Martinez', '1989-08-18', 'USA', 'Male', 'WW7654321'),
('Maya', 'Taylor', '1990-10-12', 'UK', 'Female', 'XX9876543'),
('Kevin', 'Jackson', '1994-01-25', 'Canada', 'Male', 'YY1234567'),
('Laura', 'White', '1993-07-30', 'USA', 'Female', 'ZZ7654321');

INSERT INTO Сountries (Title) VALUES 
('Ukraine'),
('USA'),
('Russia'),
('UK'),
('Japan'),
('China'),
('Canada'),
('Germany'),
('France'),
('Italy'),
('Brazil'),
('India'),
('South Africa'),
('Australia'),
('Mexico');

INSERT INTO Cities (Title, CountryId) VALUES 
('Kyiv', 1),
('New York', 2),
('Moscow', 3),
('London', 4),
('Tokyo', 5),
('Beijing', 6),
('Toronto', 7),
('Berlin', 8),
('Paris', 9),
('Rome', 10),
('São Paulo', 11),
('Mumbai', 12),
('Johannesburg', 13),
('Sydney', 14),
('Mexico City', 15);

INSERT INTO Airlines (Title) VALUES 
('Air Ukraine'),
('American Airlines'),
('Aeroflot'),
('British Airways'),
('Japan Airlines'),
('China Southern'),
('Air Canada'),
('Lufthansa'),
('Air France'),
('Alitalia'),
('Latam'),
('Emirates'),
('Qatar Airways'),
('Singapore Airlines'),
('Turkish Airlines');

INSERT INTO Airports (Title, Code) VALUES 
('Boryspil International Airport', 'KBP'),
('John F. Kennedy International Airport', 'JFK'),
('Sheremetyevo International Airport', 'SVO'),
('Heathrow Airport', 'LHR'),
('Narita International Airport', 'NRT'),
('Beijing Capital International Airport', 'PEK'),
('Toronto Pearson International Airport', 'YYZ'),
('Frankfurt Airport', 'FRA'),
('Charles de Gaulle Airport', 'CDG'),
('Leonardo da Vinci International Airport', 'FCO'),
('São Paulo/Guarulhos–Governador André Franco Montoro International Airport', 'GRU'),
('Chhatrapati Shivaji Maharaj International Airport', 'BOM'),
('O. R. Tambo International Airport', 'JNB'),
('Sydney Kingsford Smith Airport', 'SYD'),
('Benito Juárez International Airport', 'MEX');

INSERT INTO Classes (Title) VALUES 
('Economy'),
('Business'),
('First Class'),
('Premium Economy');

INSERT INTO Planes (Title, Model, SerialNumber) VALUES 
('Boeing 737', '737-800', 'SN123456'),
('Boeing 747', '747-8', 'SN654321'),
('Airbus A320', 'A320neo', 'SN112233'),
('Airbus A350', 'A350-900', 'SN445566'),
('Boeing 777', '777-300', 'SN778899'),
('Embraer E190', 'E190-E2', 'SN998877'),
('Boeing 787', '787-9', 'SN123123'),
('Airbus A321', 'A321neo', 'SN321321'),
('Boeing 787', '787-10', 'SN456456'),
('Airbus A330', 'A330-900', 'SN789789'),
('Boeing 737', '737-900', 'SN112211'),
('Boeing 767', '767-300', 'SN223322'),
('Airbus A319', 'A319neo', 'SN334433'),
('Boeing 757', '757-200', 'SN445544'),
('Airbus A318', 'A318', 'SN556655');

INSERT INTO FlightCategories (Title) VALUES 
('Direct'),
('One Stop'),
('Two Stops'),
('Multiple Stops');

INSERT INTO Flights (Gate, DateTimeOut, DateTimeIn, FlightCategoryId, CityFromId, CityToId, AirportFromId, AirportToId, PlaneId) VALUES 
('A1', '2024-08-01 10:00:00', '2024-08-01 14:00:00', 1, 1, 2, 1, 2, 1),
('B2', '2024-08-02 12:00:00', '2024-08-02 16:00:00', 2, 2, 3, 2, 3, 2),
('C3', '2024-08-03 15:00:00', '2024-08-03 19:00:00', 1, 3, 4, 3, 4, 3),
('D4', '2024-08-04 18:00:00', '2024-08-04 22:00:00', 3, 4, 5, 4, 5, 4),
('E5', '2024-08-05 09:00:00', '2024-08-05 13:00:00', 1, 5, 6, 5, 6, 5),
('F6', '2024-08-06 11:00:00', '2024-08-06 15:00:00', 2, 6, 7, 6, 7, 6),
('G7', '2024-08-07 13:00:00', '2024-08-07 17:00:00', 1, 7, 8, 7, 8, 7),
('H8', '2024-08-08 16:00:00', '2024-08-08 20:00:00', 3, 8, 9, 8, 9, 8),
('I9', '2024-08-09 08:00:00', '2024-08-09 12:00:00', 1, 9, 10, 9, 10, 9),
('J10', '2024-08-10 10:00:00', '2024-08-10 14:00:00', 2, 10, 11, 10, 11, 10),
('K11', '2024-08-11 12:00:00', '2024-08-11 16:00:00', 1, 11, 12, 11, 12, 11),
('L12', '2024-08-12 14:00:00', '2024-08-12 18:00:00', 3, 12, 13, 12, 13, 12),
('M13', '2024-08-13 16:00:00', '2024-08-13 20:00:00', 2, 13, 14, 13, 14, 13),
('N14', '2024-08-14 18:00:00', '2024-08-14 22:00:00', 1, 14, 15, 14, 15, 14),
('O15', '2024-08-15 20:00:00', '2024-08-15 00:00:00', 3, 15, 1, 15, 1, 15),
('P16', '2024-08-16 09:00:00', '2024-08-16 13:00:00', 2, 1, 2, 1, 2, 1),
('Q17', '2024-08-17 11:00:00', '2024-08-17 15:00:00', 1, 2, 3, 2, 3, 2),
('R18', '2024-08-18 13:00:00', '2024-08-18 17:00:00', 2, 3, 4, 3, 4, 3),
('S19', '2024-08-19 15:00:00', '2024-08-19 19:00:00', 1, 4, 5, 4, 5, 4),
('T20', '2024-08-20 17:00:00', '2024-08-20 21:00:00', 3, 5, 6, 5, 6, 5),
('U21', '2024-08-21 09:00:00', '2024-08-21 13:00:00', 2, 6, 7, 6, 7, 6),
('V22', '2024-08-22 11:00:00', '2024-08-22 15:00:00', 1, 7, 8, 7, 8, 7),
('W23', '2024-08-23 13:00:00', '2024-08-23 17:00:00', 2, 8, 9, 8, 9, 8),
('X24', '2024-08-24 15:00:00', '2024-08-24 19:00:00', 1, 9, 10, 9, 10, 9),
('Y25', '2024-08-25 17:00:00', '2024-08-25 21:00:00', 3, 10, 11, 10, 11, 10),
('Z26', '2024-08-26 09:00:00', '2024-08-26 13:00:00', 2, 11, 12, 11, 12, 11),
('AA27', '2024-08-27 11:00:00', '2024-08-27 15:00:00', 1, 12, 13, 12, 13, 12),
('BB28', '2024-08-28 13:00:00', '2024-08-28 17:00:00', 2, 13, 14, 13, 14, 13),
('CC29', '2024-08-29 15:00:00', '2024-08-29 19:00:00', 1, 14, 15, 14, 15, 14),
('DD30', '2024-08-30 17:00:00', '2024-08-30 21:00:00', 3, 15, 1, 15, 1, 15);

INSERT INTO SeatCategories (Title) VALUES 
('Standard'),
('Extra Legroom'),
('Window'),
('Aisle'),
('Near Exit'),
('Front Row'),
('Back Row'),
('Bulkhead');

INSERT INTO Seats (Row, Place, SeatCategoryId, ClassId, FlightId, IsAvailable) VALUES 
(1, 'A', 1, 1, 1, 1),
(1, 'B', 1, 1, 1, 1),
(1, 'C', 1, 1, 1, 1),
(2, 'A', 1, 1, 1, 1),
(2, 'B', 1, 1, 1, 1),
(2, 'C', 1, 1, 1, 1),
(3, 'A', 2, 2, 2, 1),
(3, 'B', 2, 2, 2, 1),
(3, 'C', 2, 2, 2, 1),
(4, 'A', 3, 3, 3, 1),
(4, 'B', 3, 3, 3, 1),
(4, 'C', 3, 3, 3, 1),
(5, 'A', 4, 4, 4, 1),
(5, 'B', 4, 4, 4, 1),
(5, 'C', 4, 4, 4, 1),
(6, 'A', 5, 1, 5, 1),
(6, 'B', 5, 1, 5, 1),
(6, 'C', 5, 1, 5, 1),
(7, 'A', 6, 2, 6, 1),
(7, 'B', 6, 2, 6, 1),
(7, 'C', 6, 2, 6, 1),
(8, 'A', 7, 3, 7, 1),
(8, 'B', 7, 3, 7, 1),
(8, 'C', 7, 3, 7, 1),
(9, 'A', 8, 4, 8, 1),
(9, 'B', 8, 4, 8, 1),
(9, 'C', 8, 4, 8, 1),
(10, 'A', 1, 1, 9, 1),
(10, 'B', 1, 1, 9, 1),
(10, 'C', 1, 1, 9, 1),
(11, 'A', 2, 2, 10, 1),
(11, 'B', 2, 2, 10, 1),
(11, 'C', 2, 2, 10, 1),
(12, 'A', 3, 3, 11, 1),
(12, 'B', 3, 3, 11, 1),
(12, 'C', 3, 3, 11, 1),
(13, 'A', 4, 4, 12, 1),
(13, 'B', 4, 4, 12, 1),
(13, 'C', 4, 4, 12, 1),
(14, 'A', 5, 1, 13, 1),
(14, 'B', 5, 1, 13, 1),
(14, 'C', 5, 1, 13, 1),
(15, 'A', 6, 2, 14, 1),
(15, 'B', 6, 2, 14, 1),
(15, 'C', 6, 2, 14, 1),
(16, 'A', 7, 3, 15, 1),
(16, 'B', 7, 3, 15, 1),
(16, 'C', 7, 3, 15, 1);

INSERT INTO BaggageCategories (Title) VALUES 
('Hand luggage'),
('Checked baggage'),
('Personal item'),
('Overweight baggage'),
('Special baggage'),
('Fragile items'),
('Sports equipment'),
('Musical instruments');

INSERT INTO Baggages (Title, Description, MaxDimensions, Price, BaggageCategoryId) VALUES
('Cabin Bag', 'Small bag for personal items.', '55x40x20 cm', 20.00, 1),
('Carry-on Bag', 'Medium bag for carry-on.', '56x45x25 cm', 30.00, 1),
('Checked Suitcase', 'Large suitcase for checked baggage.', '70x50x30 cm', 50.00, 2),
('Overweight Bag', 'Bag exceeding weight limit.', '70x50x30 cm', 100.00, 4),
('Sports Equipment', 'Equipment for sports activities.', '120x60x40 cm', 80.00, 7),
('Musical Instrument Case', 'Case for musical instruments.', '90x30x30 cm', 60.00, 8),
('Fragile Items', 'Items requiring special handling.', '60x40x30 cm', 40.00, 6),
('Special Baggage', 'Items requiring special care.', '100x50x50 cm', 70.00, 5);

INSERT INTO TicketStatuses (Title) VALUES
('Booked'),
('Purchased'),
('Cancelled'),
('Checked-in'),
('Boarded'),
('Expired'),
('Refunded'),
('No Show');

INSERT INTO Tickets (Price, PassegerId, SeatId, TicketStatusId, BaggageId) VALUES
(150.00, 1, 1, 1, 1),
(200.00, 2, 2, 2, 2),
(175.00, 3, 3, 3, 3),
(220.00, 4, 4, 4, 4),
(190.00, 5, 5, 5, 5),
(210.00, 6, 6, 6, 6),
(160.00, 7, 7, 7, 7),
(180.00, 8, 8, 8, 8),
(195.00, 9, 9, 1, 1),
(205.00, 10, 10, 2, 2),
(185.00, 11, 11, 3, 3),
(215.00, 12, 12, 4, 4),
(225.00, 13, 13, 5, 5),
(230.00, 14, 14, 6, 6),
(240.00, 15, 15, 7, 7),
(250.00, 16, 16, 8, 8),
(260.00, 17, 1, 1, 1),
(270.00, 18, 2, 2, 2),
(280.00, 19, 3, 3, 3),
(290.00, 20, 4, 4, 4),
(300.00, 21, 5, 5, 5);

INSERT INTO OrderStatuses (Title) VALUES
('Pending'),
('Confirmed'),
('Cancelled'),
('Completed'),
('Refunded'),
('On Hold'),
('Processing'),
('Shipped');

INSERT INTO Orders (TicketId, OrderStatusId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 1),
(10, 2),
(11, 3),
(12, 4),
(13, 5),
(14, 6),
(15, 7),
(16, 8),
(17, 1),
(18, 2),
(19, 3),
(20, 4);
