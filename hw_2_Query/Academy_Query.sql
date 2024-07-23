-- Вивести таблицю кафедр, але розташувати її поля у зворотному порядку
SELECT [Name], [Financing], [Id] FROM [Academy].[dbo].[Departments];

-- Вивести назви груп та їх рейтинги, використовуючи, якназви полів, що виводяться, “Group Name” та “Group Rating” відповідно
SELECT Name AS GroupName, Rating AS GroupRating FROM Groups;

-- Вивести для викладачів їхнє прізвище, відсоток ставки по
-- відношенню до надбавки та відсоток ставки по відношенню
-- до зарплати (сума ставки та надбавки).
SELECT 
    Surname,
    (Salary / Premium) * 100 AS SalaryToPremiumPercentage,
    (Salary / (Salary + Premium)) * 100 AS SalaryToSalaryAndPremiumPercentage
FROM Teachers;

-- 4. Вивести таблицю факультетів у вигляді одного поля у такому форматі: 
-- “The dean of faculty [faculty] is [dean].”.
SELECT CONCAT('The dean of faculty ', Name, ' is ', Dean) AS Faculty From Faculties;

-- 5. Вивести прізвища викладачів, які є професорами та ставка яких перевищує 1050.
SELECT Surname FROM Teachers WHERE Salary > 85000; --поставил больше чтобы не всех выводило

-- 6. Вивести назви кафедр, фонд фінансування яких менший за 11000 або більше 25000.
SELECT Name FROM Departments WHERE Financing < 11000 or Financing > 25000;

-- 7. Вивести назви факультетів, окрім факультету “Computer Science”
SELECT Name FROM Faculties WHERE Name != 'Computer Science';

-- 8. Вивести прізвища та посади викладачів, які не є професорами.
SELECT Surname, Position FROM Teachers WHERE Position != 'Professor';

--9. Вивести прізвища, посади, ставки та надбавки асистентів, у яких надбавка у діапазоні від 160 до 550
SELECT Surname, Position, Salary, Premium FROM Teachers WHERE Position LIKE '%Assistant%' and Premium BETWEEN 5500 AND 10000;

-- 10. Вивести прізвища та ставки асистентів.
SELECT Surname, Salary FROM Teachers WHERE Position LIKE '%Assistant%';

-- 11. Вивести прізвища та посади викладачів, які були прийняті на роботу до 01.01.2000.
SELECT Surname, Position FROM Teachers WHERE EmploymentDate < '01.01.2004';

-- 12. Вивести назви кафедр, які в алфавітному порядку розміщуються до кафедри “Software Development”. 
-- Поле, що виводиться повинно мати назву “Name of Department”.
SELECT Name as 'Name of Departmant' FROM Departments WHERE Name < 'Mathematics' ORDER BY Name ASC;

-- 13. Вивести прізвища асистентів, які мають зарплату (сума ставки та надбавки) не більше 1200.
SELECT Surname FROM Teachers 
WHERE Position LIKE '%Assistant%' 
and Salary + Premium < 72000;

-- 14. Вивести назви груп 5-го курсу, які мають рейтинг у діапазоні від 2 до 4.
SELECT Name FROM Groups 
WHERE Year = 5 
and Rating between 2 and 4; 

-- 15. Вивести прізвища асистентів зі ставкою менше 550 або надбавкою менше 200.
SELECT Surname FROM Teachers 
WHERE Position LIKE '%Assistant%' 
and Salary < 65000 or Premium < 4000