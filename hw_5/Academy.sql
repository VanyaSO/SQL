CREATE DATABASE Academy;
USE master;
ALTER DATABASE Academy SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE Academy;

GO 

USE Academy
GO

CREATE TABLE Curators (
    Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(max) NOT NULL CHECK(LEN(Name) <> 0),
    Surname NVARCHAR(max) NOT NULL CHECK(LEN(Surname) <> 0)
)
GO

CREATE TABLE Faculties (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) <> 0) unique,
)
GO

CREATE TABLE Departments (
    Id int primary key identity(1,1) not null,
    Financing money not null check(Financing >= 0) default 0,
    Name NVARCHAR(100) not null check(len(Name) <> 0) unique,
    FacultyId int not null,
    foreign key (FacultyId) references Faculties(Id)
)

CREATE TABLE Groups (
    Id int primary key identity(1,1) not null,
    Name nvarchar(10) not null check(len(Name) <> 0) unique,
    Year int not null check(Year between 1 and 5),
    DepartmentId int not null,
    foreign key (DepartmentId) references Departments(Id)
)
GO

CREATE TABLE Students (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) <> 0) unique,
    Surname NVARCHAR(max) NOT NULL CHECK(LEN(Surname) <> 0),
    GroupId int not null FOREIGN key references Groups(Id)
)

CREATE TABLE Subjects (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) <> 0)
)
GO

CREATE TABLE Teachers (
    Id int primary key identity(1,1) not null,
    Name nvarchar(max) not null check(len(Name) <> 0),
    Salary money not null check(Salary > 0),
    Surname nvarchar(max) not null check(len(Surname) <> 0)
)
GO

CREATE TABLE Lectures (
    Id int primary key identity(1,1) not null,
    LectureRoom nvarchar(max) not null check(len(LectureRoom) <> 0),
    SubjectId int not null,
    foreign key (SubjectId) references Subjects(Id),
    TeacherId int not null,
    foreign key (TeacherId) references Teachers(Id)
)
GO

CREATE TABLE GroupsLectures (
    Id int primary key identity(1,1) not null,
    DayOfWeek int not null check(DayOfWeek between 1 and 7),
    GroupId int not null,
    foreign key (GroupId) references Groups(Id),
    LecturesId int not null,
    foreign key (LecturesId) references Lectures(Id)
)






INSERT INTO Curators (Name, Surname)
VALUES 
('John', 'Doe'),
('Jane', 'Smith'),
('Emily', 'Johnson'),
('Michael', 'Brown'),
('Sarah', 'Davis'),
('David', 'Williams'),
('Laura', 'Miller'),
('Kevin', 'Martinez'),
('Anna', 'Taylor'),
('Olivia', 'Garcia');

INSERT INTO Faculties (Name)
VALUES 
('Faculty of Science'),
('Faculty of Arts'),
('Faculty of Engineering'),
('Faculty of Business'),
('Faculty of Medicine'),
('Faculty of Law'),
('Faculty of Education'),
('Faculty of Agriculture'),
('Faculty of Health Sciences'),
('Faculty of Social Sciences');

INSERT INTO Departments (Financing, Name, FacultyId)
VALUES 
(50000, 'Department of Physics', 1),
(30000, 'Department of Literature', 2),
(70000, 'Department of Computer Engineering', 3),
(60000, 'Department of Marketing', 4),
(80000, 'Department of Surgery', 5),
(45000, 'Department of Chemistry', 1),
(40000, 'Department of Sociology', 10),
(35000, 'Department of Agriculture', 8),
(55000, 'Department of Electrical Engineering', 3),
(60000, 'Department of Law', 6),
(70000, 'Software Development', 3);


INSERT INTO Groups (Name, Year, DepartmentId)
VALUES 
('G1', 1, 1),
('G2', 2, 2),
('G3', 3, 3),
('G4', 4, 4),
('G5', 5, 5),
('G6', 1, 6),
('G7', 2, 7),
('G8', 3, 8),
('G9', 4, 9),
('G10', 5, 10);

INSERT INTO Students (Name, Surname, GroupId)
VALUES 
('Alice', 'Taylor', 1),
('Bob', 'Anderson', 1),
('Charlie', 'Thomas', 2),
('Diana', 'Jackson', 2),
('Eva', 'White', 3),
('Frank', 'Harris', 6),
('Grace', 'Clark', 7),
('Hannah', 'Lewis', 8),
('Jack', 'Robinson', 9),
('Liam', 'Walker', 10),
('Mia', 'Hall', 5),
('Noah', 'Young', 4),
('Olivia', 'King', 3),
('Sophia', 'Scott', 2);

INSERT INTO Subjects (Name)
VALUES 
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology'),
('Literature'),
('History'),
('Computer Science'),
('Sociology'),
('Economics'),
('Political Science');

INSERT INTO Teachers (Name, Salary, Surname)
VALUES 
('Michael', 50000, 'Johnson'),
('Jessica', 60000, 'Davis'),
('Robert', 55000, 'Brown'),
('Emily', 58000, 'Wilson'),
('James', 62000, 'Taylor'),
('Sarah', 61000, 'Moore'),
('David', 57000, 'Anderson'),
('Emma', 63000, 'Thomas'),
('Olivia', 59000, 'Martin'),
('Liam', 68000, 'Lee');

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
VALUES 
('Room 101', 1, 1),
('Room 102', 2, 2),
('Room 103', 3, 3),
('Room 104', 4, 4),
('Room 105', 5, 5),
('Room 106', 6, 6),
('Room 107', 7, 7),
('Room 108', 8, 8),
('Room 109', 9, 9),
('Room 110', 10, 10),
('Room 107', 5, 3),
('Room 107', 5, 3);

INSERT INTO GroupsLectures (GroupId, LecturesId, DayOfWeek)
VALUES 
(1, 1, 1),
(1, 2, 5),
(2, 3, 7),
(2, 4, 4),
(3, 5, 3),
(3, 6, 1),
(4, 7, 2),
(4, 1, 3),
(5, 2, 4),
(6, 3, 5),
(7, 4, 6),
(8, 5, 7),
(9, 6, 7),
(10, 7, 7),
(10, 7, 7),
(1, 4, 7);
