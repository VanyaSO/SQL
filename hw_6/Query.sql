-- 1. Вивести назви аудиторій, де читає лекції викладач “Edward Hopper”.
SELECT LectureRooms.Name as NameLectureRoom FROM Schedules
JOIN LectureRooms ON LectureRooms.Id = Schedules.LectureRoomId
JOIN Lectures ON Lectures.Id = Schedules.LectureId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE CONCAT(Teachers.Name, ' ', Teachers.Surname) = 'John Doe'

-- 2. Вивести прізвища асистентів, які читають лекції у групі “F505”.
SELECT Assistants.Id, Teachers.Name FROM GroupsLectures
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
JOIN Lectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
JOIN Assistants ON Assistants.TeacherId = Teachers.Id
WHERE Groups.Name = 'Group C'

-- 3. Вивести дисципліни, які читає викладач “Alex Carmack” для груп 5 курсу.
SELECT Subjects.Name as SubjectName FROM GroupsLectures
JOIN Groups ON Groups.Id = GroupsLectures.GroupId
JOIN Lectures ON Lectures.Id = GroupsLectures.LectureId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
JOIN Subjects ON Subjects.Id = Lectures.SubjectId
WHERE CONCAT(Teachers.Name, ' ', Teachers.Surname) = 'Olivia Moore' and Groups.Year = 5

-- 4. Вивести прізвища викладачів, які не читають лекції у понеділок.
SELECT Teachers.Name as TeacherName FROM Schedules
JOIN LectureRooms ON LectureRooms.Id = Schedules.LectureRoomId
JOIN Lectures ON Lectures.Id = Schedules.LectureId
JOIN Teachers ON Teachers.Id = Lectures.TeacherId
WHERE DayOfWeek <> 1

-- 5. Вивести назви аудиторій, із зазначенням їх корпусів, у яких немає лекцій у середу другого тижня на третій парі.
SELECT LectureRooms.Name, LectureRooms.Building FROM LectureRooms
JOIN Schedules ON LectureRooms.Id = Schedules.LectureRoomId
WHERE DayOfWeek <> 3 and Week <> 2 and Class <> 3

-- 6. Вивести повні імена викладачів факультету “Computer Science”, які не курирують групи кафедри “Software Development”.
SELECT DISTINCT CONCAT(Teachers.Name, ' ', Teachers.Surname) FROM Deans
JOIN Teachers ON Teachers.Id = Deans.TeacherId
JOIN Faculties ON Faculties.DeanId = Deans.Id
JOIN Departments ON Departments.FacultyId = Faculties.Id
JOIN Curators ON Curators.TeacherId = Curators.Id
JOIN GroupsCurators ON GroupsCurators.CuratorId = Curators.Id
JOIN Groups ON GroupsCurators.GroupsId = Groups.Id
WHERE Faculties.Name = 'Faculty of Engineering' and Departments.Name <> 'Department of Mechanical Engineering'

-- 7. Вивести список номерів усіх корпусів, які є у таблицях факультетів, кафедр та аудиторій.
SELECT Faculties.Building FROM Faculties
UNION
SELECT Departments.Building FROM Departments
UNION
SELECT LectureRooms.Building FROM LectureRooms

-- 8. Вивести повні імена викладачів у такому порядку: декани факультетів, завідувачі кафедр, викладачі, куратори, асистенти.
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname, ' ', 'Dean') FROM Deans
JOIN Teachers ON Teachers.Id =  Deans.TeacherId
UNION ALL
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname, ' ', 'Head') FROM Heads
JOIN Teachers ON Teachers.Id =  Heads.TeacherId
UNION ALL
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname, ' ', 'Teacher') FROM Teachers
UNION ALL
SELECT CONCAT(Teachers.Name, ' ', Teachers.Surname, ' ', 'Assistants') FROM Assistants
JOIN Teachers ON Teachers.Id =  Assistants.TeacherId

-- 9. Вивести дні тижня (без повторень), в які є заняття в аудиторіях «A311» та «A104» корпусу.
SELECT DISTINCT DayOfWeek FROM Schedules
JOIN LectureRooms ON Schedules.LectureRoomId = LectureRooms.Id
WHERE LectureRooms.Name = 'Room A1' and LectureRooms.Building = 1;
