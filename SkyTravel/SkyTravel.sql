USE master;
GO

ALTER DATABASE SkyTravel
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

IF DB_ID('SkyTravel') IS NOT NULL
BEGIN
    DROP DATABASE SkyTravel;
END
GO

CREATE DATABASE SkyTravel;
GO

USE SkyTravel;
GO

CREATE TABLE Users (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) > 0),
    LastName nvarchar(100) not null check(len(LastName) > 0),
    Email nvarchar(255) not null check(len(Email) > 5),
    Password nvarchar(255) not null check(len(Password) > 8)
)

CREATE TABLE Languages (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0),
)

CREATE TABLE Currencies (
    Id int primary key identity(1,1) not null,
    Title nvarchar(50) not null unique check(len(Title) > 0),
    Code char(3) not null unique,
    Rate decimal(10,6) not null check(Rate > 0)
)

CREATE TABLE Passegers (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) > 0),
    LastName nvarchar(100) not null check(len(LastName) > 0),
    DateOfBirth date not null,
    Nationality nvarchar(100) not null check(len(Nationality) > 0),
    Gender nvarchar(30) not null check(len(Gender) > 0),
    PassportNumber nvarchar(100) not null check(len(PassportNumber) > 0),
)
GO

CREATE TABLE Сountries (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Cities (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0),
    CountryId int not null foreign key references Сountries(Id)
);
GO

CREATE TABLE Airlines (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Airports (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null check(len(Title) > 0), -- «Аль Мактум»
    Code nvarchar(4) not null unique check(len(Code) > 0) -- DWC
)
GO

-- Економ, бизнес ...
CREATE TABLE Classes (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Planes (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null check(len(Title) > 0),
    Model nvarchar(100) not null check(len(Model) > 0),
    SerialNumber nvarchar(100) not null check(len(SerialNumber) > 0),
)
GO

-- Прямой, c пересадкой
CREATE TABLE FlightCategories (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Flights (
    Id int primary key identity(1,1) not null,
    Gate nvarchar(5) not null check(len(Gate) > 0),
    DateTimeOut datetime not null,
    DateTimeIn datetime not null,
    FlightCategoryId int not null foreign key references FlightCategories(Id),
    CityFromId int not null foreign key references Cities(Id),
    CityToId int not null foreign key references Cities(Id),
    AirportFromId int not null foreign key references Airports(Id),
    AirportToId int not null foreign key references Airports(Id),
    PlaneId int not null foreign key references Planes(Id)
)
GO

-- Стандартное, свободное место для ног, у прохода ...
CREATE TABLE SeatCategories (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Seats (
    Id int primary key identity(1,1) not null,
    Row int not null check(Row > 0),
    Place char(1) not null check(len(Place) > 0),
    SeatCategoryId int not null foreign key references SeatCategories(Id),
    ClassId int not null foreign key references Classes(Id),
    FlightId int not null foreign key references Flights(Id),
    IsAvailable bit default 1 not null
)
GO

-- Ручная кладь, Зарегистрированный багаж ...
CREATE TABLE BaggageCategories (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0),
)
GO

-- 1 личная вещь, 1 ед. зарегистрированного багажа ... 
CREATE TABLE Baggages (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0),
    Description nvarchar(max) not null check(len(Description) > 0),
    MaxDimensions nvarchar(100) not null check(len(MaxDimensions) > 0),
    Price decimal(7, 2) not null check(Price > 0),
    BaggageCategoryId int not null foreign key references BaggageCategories(Id)
)
GO

-- Забронирован, Куплен ...
CREATE TABLE TicketStatuses (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Tickets (
    Id int primary key identity(1,1) not null,
    Price decimal(7, 2) not null check(Price > 0),
    PassegerId int not null foreign key references Passegers(Id),
    SeatId int not null foreign key references Seats(Id),
    TicketStatusId int not null foreign key references TicketStatuses(Id),
    BaggageId int not null foreign key references Baggages(Id)
)
GO

CREATE TABLE OrderStatuses (
    Id int primary key identity(1,1) not null,
    Title nvarchar(100) not null unique check(len(Title) > 0)
)
GO

CREATE TABLE Orders (
    Id int primary key identity(1,1) not null,
    OrderStatusId int foreign key references OrderStatuses(Id),
    QuantityTickets int not null check(QuantityTickets > 0),
    TotalCost decimal(10, 2) not null,
    CreateAt datetime default GETDATE()
)
GO

CREATE TABLE OrdersHistory (
    Id int primary key identity(1,1) not null,
    TicketId int not null foreign key references Tickets(Id),
    OrderId int foreign key references Orders(Id)
)