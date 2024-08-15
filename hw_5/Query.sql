-- 1. Вивести кількість викладачів кафедри «Software Development».
SELECT COUNT(DISTINCT Teachers.Id) as TeacherCount FROM GroupsLectures
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE Departments.Name = 'Department of Computer Engineering';

-- 2. Вивести кількість лекцій, які читає викладач “Dave McQueen”.
SELECT COUNT(*) as LecturesCount FROM Lectures
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE CONCAT(Teachers.Name, ' ', Teachers.Surname) = 'Jessica Davis';

-- 3. Вивести кількість занять, які проводяться в аудиторії “D201”.
SELECT COUNT(*) as LecturesCount FROM Lectures WHERE LectureRoom = 'Room 109'

-- 4. Вивести назви аудиторій та кількість лекцій, що проводяться в них.
SELECT LectureRoom, COUNT(*) as LectureCount FROM Lectures
GROUP BY LectureRoom

-- 5. Вивести кількість студентів, які відвідують лекції викладача “Jack Underhill”.
SELECT COUNT(DISTINCT Students.Id) as StudentsCount FROM GroupsLectures
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
JOIN Students ON Students.GroupId = Groups.Id
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE CONCAT(Teachers.Name, ' ', Teachers.Surname) = 'James Taylor'

-- 6. Вивести середню ставку викладачів факультету Computer Science.
SELECT AVG(Teachers.Salary) as AVGSalaryTeacher FROM GroupsLectures
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Faculties ON Faculties.Id = Departments.FacultyId
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE Faculties.Name = 'Faculty of Science';

-- 7. Вивести мінімальну та максимальну кількість студентів серед усіх груп.
SELECT MIN(StCount) as MIN, MAX(StCount) as MAX FROM (
    SELECT COUNT(Students.Id) as StCount FROM Students
    JOIN Groups ON Groups.Id = Students.GroupId
    GROUP BY Groups.Id 
) Groups;

-- 8. Вивести середній фонд фінансування кафедр.
SELECT AVG(Financing) as AVGFinancing FROM Departments

-- 9. Вивести повні імена викладачів та кількість читаних ними дисциплін.
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname) as Teacher, COUNT(Subjects.Id) as SubjectsCount FROM Lectures
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Subjects.Id = Lectures.SubjectId
GROUP BY Teachers.Id, Teachers.Name, Teachers.Surname

-- 10. Вивести кількість лекцій щодня протягом тижня.
SELECT DayOfWeek, COUNT(Lectures.Id) FROM GroupsLectures
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
GROUP BY DayOfWeek

-- 11. Вивести номери аудиторій та кількість кафедр, чиї лекції в них читаються.
SELECT LectureRoom, COUNT(Departments.Id) FROM GroupsLectures
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
GROUP BY LectureRoom

-- 12.Вивести назви факультетів та кількість дисциплін, які на них читаються.
SELECT Faculties.Name, COUNT(Subjects.Id) as SubjectsCount FROM GroupsLectures
JOIN Groups ON GroupsLectures.GroupId = Groups.Id
JOIN Departments ON Departments.Id = Groups.DepartmentId
JOIN Faculties ON Faculties.Id = Departments.FacultyId
JOIN Lectures ON Lectures.Id = GroupsLectures.LecturesId
JOIN Subjects ON Subjects.Id = Lectures.SubjectId
GROUP BY Faculties.Name

-- 13. Вивести кількість лекцій для кожної пари викладач-аудиторія
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname) as Teacher, 
Lectures.LectureRoom, 
COUNT(Lectures.Id) as LecturesCount 
FROM Lectures
RIGHT OUTER JOIN Teachers ON Teachers.Id = Lectures.TeacherId
GROUP BY CONCAT(Teachers.Name, ' ', Teachers.Surname), LectureRoom