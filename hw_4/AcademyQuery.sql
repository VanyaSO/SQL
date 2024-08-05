-- 1. Вивести всі можливі пари рядків викладачів та груп.
SELECT Teachers.Name, Groups.Name FROM Teachers, Groups;

-- 2. Вивести назви факультетів, фонд фінансування кафедр яких перевищує фонд фінансування факультету.
SELECT Faculties.Name FROM Faculties 
JOIN Departments ON Faculties.id = Departments.FacultyId
WHERE Departments.Financing > Faculties.Financing;

-- 3. Вивести прізвища кураторів груп та назви груп, які вони курирують.
SELECT Curators.Name as Curator, Groups.Name as [Group] FROM GroupsCurators
JOIN Curators ON GroupsCurators.CuratorId = Curators.id
JOIN Groups ON GroupsCurators.CuratorId = Groups.id;

-- 4. Вивести імена та прізвища викладачів, які читають лекції у групі “P107”.
SELECT Teachers.Name, Teachers.Surname FROM Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN GroupsLectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
WHERE Groups.Name = 'EC101';

-- 5. Вивести прізвища викладачів та назви факультетів, на яких вони читають лекції.
SELECT Teachers.Name, Faculties.Name FROM Teachers
JOIN Lectures ON Lectures.TeacherId = Teachers.Id
JOIN GroupsLectures ON GroupsLectures.LecturesId = Lectures.Id
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Faculties ON Faculties.Id = Departments.FacultyId;

-- 6. Вивести назви кафедр та назви груп, які до них належать.
SELECT Departments.Name as [Department], Groups.Name as [Group] FROM Groups
JOIN Departments ON Departments.Id = Groups.DepartmentId;

-- 7. Вивести назви дисциплін, які читає викладач “Samantha Adams”
SELECT Subjects.Name FROM Subjects
JOIN Lectures ON Lectures.SubjectId = Subjects.Id
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE CONCAT(Teachers.Name, ' ', Teachers.Surname) = 'John Doe';

-- 8. Вивести назви кафедр, де читається дисципліна “Database Theory”.
SELECT Departments.Name FROM Departments
JOIN Groups ON Groups.DepartmentId = Departments.Id
JOIN GroupsLectures ON GroupsLectures.GroupId = Groups.Id
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
JOIN Subjects ON Subjects.Id = Lectures.SubjectId
WHERE Subjects.Name = 'Engineering';

-- 9. Вивести назви груп, що належать до факультету Computer Science.
SELECT Groups.Name FROM Groups
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Faculties ON Faculties.Id = Departments.FacultyId
WHERE Faculties.Name = 'Faculty of Computer Science'

-- 10. Вивести назви груп 5-го курсу, а також назву факультетів, до яких вони належать.
SELECT Groups.Name, Faculties.Name FROM Groups
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Faculties ON Faculties.Id = Departments.FacultyId
WHERE Groups.Year = 1

-- 11. Вивести повні імена викладачів та лекції, які вони читають 
-- (назви дисциплін та груп), причому відібрати лише ті
-- лекції, що читаються в аудиторії “B103”.
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname) as [Teacher], 
       Subjects.Name as [Subject],
       Groups.Name as [Group]
FROM GroupsLectures
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
JOIN Subjects ON Subjects.Id = Lectures.SubjectId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE Lectures.LectureRoom = 'Room 102'
