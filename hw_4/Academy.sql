USE Academy;
GO

CREATE TABLE Curators (
    Id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(max) NOT NULL CHECK(LEN(Name) <> 0),
    Surname NVARCHAR(max) NOT NULL CHECK(LEN(Surname) <> 0)
)
GO

CREATE TABLE GroupsCurators (
    Id int primary key identity(1,1) not null,
    CuratorId int not null,
    foreign key (CuratorId) references Curator(Id),
    GroupId int not null,
    foreign key (GroupId) references Groups(Id)
)
GO

CREATE TABLE Faculties (
    Id int primary key identity(1,1) not null,
    Financing money default 0 check(Financing >= 0),
    Name nvarchar(100) not null check(len(Name) <> 0) unique,
)

CREATE TABLE Departments (
    Id int primary key identity(1,1) not null,
    Financing money not null check(Financing >= 0) default 0,
    FacultyId int not null,
    foreign key (FacultyId) references Faculties(Id)
)
GO

CREATE TABLE Groups (
    Id int primary key identity(1,1) not null,
    Name nvarchar(10) not null check(len(Name) <> 0) unique,
    Year int not null check(Year between 1 and 5),
    DepartmentId int not null,
    foreign key (DepartmentId) references Departments(Id)
)

CREATE TABLE Teachers (
    Id int primary key identity(1,1) not null,
    Name nvarchar(max) not null check(len(Name) <> 0),
    Salary money not null check(Salary > 0),
    Surname nvarchar(max) not null check(len(Surname) <> 0)
)
GO

CREATE TABLE Subjects (
    Id int primary key identity(1,1) not null,
    Name nvarchar(100) not null check(len(Name) <> 0)
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
    GroupId int not null,
    foreign key (GroupId) references Groups(Id),
    LecturesId int not null,
    foreign key (LecturesId) references Lectures(Id)
)

INSERT INTO Faculties (Financing, Name) VALUES
(10000.00, 'Faculty of Computer Science'),
(15000.00, 'Faculty of Economics'),
(20000.00, 'Faculty of Engineering'),
(12000.00, 'Faculty of Arts');

INSERT INTO Departments (Financing, FacultyId) VALUES
(5000.00, 1),
(7000.00, 2),
(8000.00, 3),
(6000.00, 4);

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('CS101', 1, 1),
('CS102', 2, 1),
('EC101', 1, 2),
('EN101', 3, 3);

INSERT INTO Curators (Name, Surname) VALUES
('Alice', 'Johnson'),
('Bob', 'Williams'),
('Charlie', 'Brown'),
('Diana', 'Green');

INSERT INTO Teachers (Name, Salary, Surname) VALUES
('John', 50000.00, 'Doe'),
('Jane', 60000.00, 'Smith'),
('Paul', 55000.00, 'Jones'),
('Emily', 58000.00, 'Davis');

INSERT INTO Subjects (Name) VALUES
('Mathematics'),
('Economics'),
('Engineering'),
('Art History');

INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId) VALUES
('Room 101', 1, 1),
('Room 102', 2, 2),
('Room 103', 3, 3),
('Room 104', 4, 4);

INSERT INTO GroupsLectures (GroupId, LecturesId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
