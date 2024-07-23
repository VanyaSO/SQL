CREATE DATABASE Academy;
GO
USE Academy;
GO

DROP TABLE Departments;
DROP TABLE Groups;
DROP TABLE Faculties;
DROP TABLE Teachers;

CREATE TABLE Groups(
    Id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Name NVARCHAR(10) NOT NULL,
    CHECK (Name <> ''),
    Rating INT NOT NULL,
    CHECK (Rating BETWEEN 0 AND 5),
    Year INT NOT NULL
    CHECK (Year BETWEEN 1 AND 5),
)
GO

CREATE TABLE Departments(
    Id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Financing money NOT NULL DEFAULT 0,
    CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE,
    CHECK (Name <> ''),
)
GO

CREATE TABLE Faculties(
    Id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    Name NVARCHAR(100) NOT NULL UNIQUE,CHECK (Name <> ''),
    Dean NVARCHAR(max) NOT NULL CHECK (Dean <> ''),
)
GO

CREATE TABLE Teachers(
    Id int PRIMARY KEY IDENTITY(1, 1) NOT NULL,
    EmploymentDate DATE NOT NULL,
    CHECK (EmploymentDate > '1990-01-01'),
    Name NVARCHAR(max) NOT NULL,
    CHECK (Name <> ''),
    Surname NVARCHAR(max) NOT NULL,
    CHECK (Surname <> ''),
    Salary money NOT NULL,
    CHECK (Salary > 0),
    Premium money NOT NULL DEFAULT 0,
    CHECK (Premium >= 0),
    IsAssistant bit not null default 0,
    IsProfessor bit not null default 0,
    Position nvarchar(max) not null,
    CHECK(Position <> '')
)
GO


-- Данные для таблицы Groups
INSERT INTO Groups (Name, Rating, Year) VALUES 
('Alpha', 3, 1),
('Beta', 4, 2),
('Gamma', 5, 3),
('Delta', 2, 4),
('Epsilon', 1, 5);
GO

-- Данные для таблицы Departments
INSERT INTO Departments (Financing, Name) VALUES 
(10000.00, 'Computer Science'),
(20000.00, 'Mathematics'),
(30000.00, 'Physics'),
(40000.00, 'Chemistry'),
(50000.00, 'Biology');
GO

-- Данные для таблицы Faculties
INSERT INTO Faculties (Name, Dean) VALUES 
('Engineering', 'Dr. Smith'),
('Science', 'Dr. Johnson'),
('Arts', 'Dr. Brown'),
('Business', 'Dr. Williams'),
('Computer Science', 'Dr. Jones');
GO

INSERT INTO Teachers (EmploymentDate, Name, Surname, Salary, Premium, IsAssistant, IsProfessor, Position) VALUES 
('2001-09-01', 'Alice', 'Walker', 60000.00, 5000.00, 1, 0, 'Assistant Professor'),
('2002-07-15', 'Bob', 'Smith', 70000.00, 6000.00, 0, 1, 'Professor'),
('2003-08-23', 'Charlie', 'Brown', 80000.00, 7000.00, 0, 1, 'Professor'),
('2004-06-30', 'Diana', 'Ross', 90000.00, 8000.00, 1, 0, 'Assistant Professor'),
('2005-11-11', 'Edward', 'Johnson', 100000.00, 9000.00, 0, 1, 'Professor'),
('2006-10-25', 'Fiona', 'Clark', 75000.00, 5500.00, 1, 0, 'Assistant Professor'),
('2007-03-12', 'George', 'Miller', 95000.00, 8500.00, 0, 1, 'Professor'),
('2008-01-19', 'Helen', 'Davis', 85000.00, 7500.00, 0, 1, 'Professor'),
('2009-05-22', 'Ian', 'Wilson', 65000.00, 4500.00, 1, 0, 'Assistant Professor'),
('2010-09-14', 'Jane', 'Taylor', 105000.00, 9500.00, 0, 1, 'Professor');
GO


