CREATE DATABASE MyAcademy;
GO

use MyAcademy;
GO

CREATE TABLE LectureRooms (
    Id int primary key identity(1,1) not null,
    Building int not null check(Building between 1 and 5),
    Name nvarchar(10) not null check(len(Name) <> 0) unique,
)
GO

CREATE TABLE Subjects (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) <> 0) unique
)
GO

CREATE TABLE Teachers (
    Id int primary key identity(1,1) not null,
    Name nvarchar(max) not null check(len(Name) <> 0),
    Surname nvarchar(max) not null check(len(Surname) <> 0)
)
GO

CREATE TABLE Assistants (
    Id int primary key identity(1,1) not null,
    TeacherId int not null foreign key references Teachers(Id)
)
GO 

CREATE TABLE Lectures (
    Id int primary key identity(1,1) not null,
    SubjectId int not null foreign key references Subjects(Id),
    TeacherId int not null foreign key references Teachers(Id)
)
GO 

CREATE TABLE Schedules (
    Id int primary key identity(1,1) not null,
    Class int not null check(Class between 1 and 8),
    DayOfWeek int not null check(DayOfWeek between 1 and 7),
    Week int not null check(Week between 1 and 7),
    LectureId int not null foreign key references Lectures(Id),
    LectureRoomId int not null foreign key references LectureRooms(Id),
)
GO 

CREATE TABLE Heads (
    Id int primary key identity(1,1) not null,
    TeacherId int not null foreign key references Teachers(Id)
)
GO 

CREATE TABLE Deans (
    Id int primary key identity(1,1) not null,
    TeacherId int not null foreign key references Teachers(Id)
)
GO 

CREATE TABLE Faculties (
    Id int primary key identity(1,1) not null,
    Building int not null check(Building between 1 and 5),
    Name nvarchar(100) not null check(len(Name) <> 0) unique,
    DeanId int not null foreign key references Deans(Id)
)
GO 

CREATE TABLE Departments (
    Id int primary key identity(1,1) not null,
    Building int not null check(Building between 1 and 5),
    Name nvarchar(100) not null check(len(Name) <> 0) unique,
    FacultyId int not null foreign key references Faculties(Id),
    HeadId int not null foreign key references Heads(Id)
)
GO 

CREATE TABLE Groups (
    Id int primary key identity(1,1) not null,
    Name nvarchar(10) not null check(len(Name) <> 0) unique,
    Year int not null check(Year between 1 and 5),
    DepartmentId int not null foreign key references Departments(Id)
)
GO 

CREATE TABLE GroupsLectures (
    Id int primary key identity(1,1) not null,
    GroupId int not null foreign key references Groups(Id),
    LectureId int not null foreign key references Lectures(Id) 
)
GO 

CREATE TABLE Curators (
    Id int primary key identity(1,1) not null,
    TeacherId int not null foreign key references Teachers(Id)
)
GO 

CREATE TABLE GroupsCurators (
    Id int primary key identity(1,1) not null,
    CuratorId int not null foreign key references Curators(Id),
    GroupsId int not null foreign key references Groups(Id)
)
GO 

INSERT INTO LectureRooms (Building, Name) VALUES
(1, 'Room A1'),
(1, 'Room A2'),
(2, 'Room B1'),
(3, 'Room C1'),
(4, 'Room D1'),
(5, 'Room E1'),
(1, 'Room A3'),
(2, 'Room B2'),
(3, 'Room C2'),
(4, 'Room D2'),
(5, 'Room E2');
GO

INSERT INTO Subjects (Name) VALUES
('Mathematics'),
('Physics'),
('Chemistry'),
('Biology'),
('History'),
('Literature'),
('Philosophy'),
('Economics'),
('Law'),
('Sociology'),
('Art'),
('Music');
GO

INSERT INTO Teachers (Name, Surname) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Emily', 'Johnson'),
('Michael', 'Williams'),
('Sarah', 'Brown'),
('David', 'Jones'),
('Laura', 'Davis'),
('James', 'Wilson'),
('Olivia', 'Moore'),
('Liam', 'Taylor'),
('Sophia', 'Anderson'),
('Daniel', 'Thomas');
GO

INSERT INTO Assistants (TeacherId) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(1),
(3);
GO

INSERT INTO Lectures (SubjectId, TeacherId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 3),
(4, 5);
GO

INSERT INTO Schedules (Class, DayOfWeek, Week, LectureId, LectureRoomId) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 4),
(5, 5, 5, 5, 5),
(6, 6, 6, 6, 1),
(7, 7, 7, 7, 2),
(1, 1, 2, 1, 3),
(2, 2, 3, 2, 4),
(3, 3, 4, 3, 5),
(4, 4, 5, 4, 1),
(5, 5, 6, 5, 2);
GO

INSERT INTO Heads (TeacherId) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(1);
GO

INSERT INTO Deans (TeacherId) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(2);
GO

INSERT INTO Faculties (Building, Name, DeanId) VALUES
(1, 'Faculty of Engineering', 1),
(2, 'Faculty of Arts', 2),
(3, 'Faculty of Science', 3),
(4, 'Faculty of Medicine', 4),
(5, 'Faculty of Law', 5),
(1, 'Faculty of Business', 6),
(2, 'Faculty of Philosophy', 7),
(3, 'Faculty of History', 8),
(4, 'Faculty of Sociology', 9),
(5, 'Faculty of Music', 10);
GO

INSERT INTO Departments (Building, Name, FacultyId, HeadId) VALUES
(1, 'Department of Mechanical Engineering', 1, 1),
(1, 'My Engineering', 1, 1),
(2, 'Department of Literature', 2, 2),
(3, 'Department of Physics', 3, 3),
(4, 'Department of Anatomy', 4, 4),
(5, 'Department of Criminal Law', 5, 5),
(1, 'Department of Management', 6, 6),
(2, 'Department of Ethics', 7, 7),
(3, 'Department of Archaeology', 8, 8),
(4, 'Department of Social Work', 9, 9),
(5, 'Department of Composition', 10, 10);
GO

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('Group A', 1, 1),
('Group B', 2, 2),
('Group C', 3, 3),
('Group D', 4, 4),
('Group E', 5, 5),
('Group F', 1, 6),
('Group G', 2, 7),
('Group H', 3, 8),
('Group I', 4, 9),
('Group J', 5, 10),
('Group K', 1, 1),
('Group L', 2, 2);
GO

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(6, 1),
(6, 3);
GO

INSERT INTO Curators (TeacherId) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(1);
GO

INSERT INTO GroupsCurators (CuratorId, GroupsId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3);
GO
