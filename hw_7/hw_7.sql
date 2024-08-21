CREATE DATABASE Functions;
GO

use Functions;
GO

CREATE TABLE Data (
    Id int primary key identity(1,1) not null,
    Number int not null,
    String nvarchar(max) not null,
)
GO

INSERT INTO Data (Number, String)
VALUES 
(542, 'Hello'),
(222, 'World'),
(7, 'How'),
(13, 'aRe'),
(89, 'YoU');
GO

CREATE TABLE Users (
    Id int primary key identity(1,1) not null,
    FullName nvarchar(255) not null CHECK(len(FullName) <> 0),
    DateOfBirth date not null
)
GO

INSERT INTO Users (FullName, DateOfBirth)
VALUES 
    ('John Doe', '1985-05-15'),
    ('Jane Smith', '1990-07-23'),
    ('Michael Johnson', '1978-09-12'),
    ('Emily Davis', '2002-11-03'),
    ('Christopher Brown', '1982-01-25'),
    ('Amanda Wilson', '1995-06-17'),
    ('Matthew Moore', '1988-12-11'),
    ('Olivia Taylor', '2000-03-29'),
    ('Daniel Anderson', '1975-08-19'),
    ('Sophia Thompson', '1993-10-06');
GO

-- 1. Обчислення суми двох чисел
DECLARE @number int = 125, @number1 int = 112;
print @number+@number1;

-- 2. Переведення тексту в верхній регістр
SELECT UPPER(String) FROM Data

-- 3. Розрахунок добутку числа на певну константу
DECLARE @const int = 3;
SELECT Number, Number*@const as NumberMul3 FROM Data

-- 4. Перевірка, чи є число парним
SELECT Number,
    CASE 
        WHEN Number % 2 = 0 THEN 'True'
            ELSE 'False'
        END AS Even
FROM Data

-- 5. Розрахунок віку на основі дати народження
SELECT FullName, DateOfBirth, DATEDIFF(year, DateOfBirth, GETDATE()) as Age FROM Users
