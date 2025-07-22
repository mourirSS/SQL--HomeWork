create database Mydatabase;

use MyDatabase;



create table Teachers (
	Id int identity primary key,
	Name nvarchar(max) not null,
	Surname nvarchar(max) not null
);

create table Assistants (
	Id int identity primary key,
	TeacherId int not null,
	foreign key (TeacherId) references Teachers(Id)
);

create table Curators (
	Id int identity primary key,
	TeacherId int not null,
	foreign key (TeacherId) references Teachers(Id)
);

create table Deans (
	Id int identity primary key,
	TeacherId int not null,
	foreign key (TeacherId) references Teachers(Id)
);

create table Heads (
	Id int identity primary key,
	TeacherId int not null,
	foreign key (TeacherId) references Teachers(Id)
);

create table Faculties (
	Id int identity primary key,
	Building int not null check (Building between 1 and 5),
	Name nvarchar(100) not null unique,
	DeanId int not null,
	foreign key (DeanId) references Deans(Id)
);

create table Departments (
	Id int identity primary key,
	Building int not null check (Building between 1 and 5),
	Name nvarchar(100) not null unique,
	FacultyId int not null,
	foreign key (FacultyId) references Faculties(Id),
	HeadId int not null,
	foreign key (HeadId) references Heads(Id)
);

create table Groups (
	Id int identity primary key,
	Name nvarchar(10) not null unique,
	Year int not null check (Year between 1 and 5),
	DepartmentId int not null,
	foreign key (DepartmentId) references Departments(Id)
);

create table Subjects (
	Id int identity primary key,
	Name nvarchar(100) not null unique
);

create table LectureRooms (
	Id int identity primary key,
	Building int not null check (Building between 1 and 5),
	Name nvarchar(10) not null unique
);

create table Lectures (
	Id int identity primary key,
	SubjectId int not null,
	foreign key (SubjectId) references Subjects(Id),
	TeacherId int not null,
	foreign key (TeacherId) references Teachers(Id)
);

create table GroupsLectures (
	Id int identity primary key,
	GroupId int not null,
	foreign key (GroupId) references Groups(Id),
	LectureId int not null,
	foreign key (LectureId) references Lectures(Id)
);

create table GroupsCurators (
	Id int identity primary key,
	CuratorId int not null,
	foreign key (CuratorId) references Curators(Id),
	GroupId int not null,
	foreign key (GroupId) references Groups(Id)
);

create table Schedules (
	Id int identity primary key,
	Class int not null check (Class between 1 and 8),
	DayOfWeek int not null check (DayOfWeek between 1 and 7),
	Week int not null check (Week between 1 and 52),
	LectureId int not null,
	foreign key (LectureId) references Lectures(Id),
	LectureRoomId int not null,
	foreign key (LectureRoomId) references LectureRooms(Id)
);


INSERT INTO Teachers (Name, Surname) VALUES
(N'Edward', N'Hopper'),       -- Id = 1
(N'Alex', N'Carmack'),        -- Id = 2
(N'Sarah', N'Connor'),        -- Id = 3
(N'John', N'Doe'),            -- Id = 4
(N'Emily', N'Stone'),         -- Id = 5
(N'Michael', N'Black'),       -- Id = 6
(N'Anna', N'White');          -- Id = 7

INSERT INTO Assistants (TeacherId) VALUES
(3),  -- Sarah Connor
(5),  -- Emily Stone
(4),  -- John Doe
(6),  -- Michael Blackпере
(7);  -- Anna White

INSERT INTO Curators (TeacherId) VALUES
(6),  -- Michael Black
(7),  -- Anna White
(2),  -- Alex Carmack
(5);  -- Emily Stone

INSERT INTO Deans (TeacherId) VALUES
(1),  -- Edward Hopper
(2),  -- Alex Carmack
(3);  -- Sarah Connor

INSERT INTO Heads (TeacherId) VALUES
(2),  -- Alex Carmack
(4),  -- John Doe
(5);  -- Emily Stone

INSERT INTO Faculties (Building, Name, DeanId) VALUES
(3, 'Computer Science', 1),   -- Edward Hopper
(2, 'Physics', 2),            -- Alex Carmack
(1, 'Mathematics', 3),        -- Sarah Connor
(4, 'Biology', 2);            -- Alex Carmack

INSERT INTO Departments (Building, Name, FacultyId, HeadId) VALUES
(3, 'Software Development', 1, 1),
(2, 'Quantum Mechanics', 2, 2),
(1, 'Algebra', 3, 3),
(4, 'Botany', 4, 2),
(5, 'Machine Learning', 1, 2);

INSERT INTO Groups (Name, Year, DepartmentId) VALUES
('F505', 5, 1),   -- Software Dev
('P301', 3, 2),   -- Quantum
('F101', 1, 1),   -- Software Dev
('F202', 2, 1),
('F303', 3, 1),
('M101', 1, 3),   -- Algebra
('B102', 2, 4),   -- Botany
('ML401', 4, 5),  -- Machine Learning
('ML501', 5, 5),
('Q201', 2, 2);

INSERT INTO Subjects (Name) VALUES
('Databases'),            -- Id = 1
('Physics I'),            -- Id = 2
('Algorithms'),           -- Id = 3
('Botany Basics'),        -- Id = 4
('Linear Algebra'),       -- Id = 5
('AI in Practice'),       -- Id = 6
('Quantum Mechanics');    -- Id = 7

INSERT INTO LectureRooms (Building, Name) VALUES
(3, 'A317'),    -- Id = 1
(3, 'A105'),    -- Id = 2
(4, 'B205'),    -- Id = 3
(5, 'C102'),    -- Id = 4
(2, 'A311'),    -- Id = 5
(2, 'A145');    -- Id = 6

INSERT INTO Lectures (SubjectId, TeacherId) VALUES
(1, 1),  -- Edward Hopper, Databases
(2, 2),  -- Alex Carmack, Physics I
(3, 3),  -- Sarah Connor, Algorithms
(4, 4),  -- John Doe, Botany Basics
(5, 5),  -- Emily Stone, Linear Algebra
(6, 2),  -- Alex Carmack, AI in Practice
(7, 2);  -- Alex Carmack, Quantum Mechanics

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES
(1, 1),  -- F505 → Edward Hopper
(1, 6),  -- F505 → Alex Carmack (AI)
(2, 2),  -- P301 → Alex Carmack
(9, 6),  -- ML501 → Alex Carmack
(3, 3),  -- F101 → Sarah Connor
(4, 4),  -- F202 → John Doe
(5, 5),  -- F303 → Emily Stone
(6, 5),  -- M101 → Emily Stone
(7, 4);  -- B102 → John Doe

INSERT INTO GroupsCurators (CuratorId, GroupId) VALUES
(1, 1),  -- F505 ← Michael Black
(2, 9),  -- ML501 ← Anna White
(3, 4),  -- F202 ← Alex Carmack
(4, 6);  -- M101 ← Emily Stone

INSERT INTO Schedules (Class, DayOfWeek, Week, LectureId, LectureRoomId) VALUES
(2, 2, 1, 1, 1),    -- вторник, первая неделя
(3, 3, 2, 1, 1),    -- среда, вторая неделя (будет исключение в задании №5)
(4, 1, 3, 2, 2),    -- понедельник — для проверки запроса №4
(3, 3, 2, 6, 5),    -- Alex Carmack в A311 корпуса 6, среда
(5, 5, 2, 6, 6),    -- AI, пятница — в A104 корпуса 6
(3, 3, 2, 3, 3);    -- среда 2 неделя, аудитория B205

--1
select lr.Name
from Schedules s
join Lectures l on s.LectureId = l.Id
join Teachers t on l.TeacherId = t.Id
join LectureRooms lr on s.LectureRoomId = lr.Id
where t.Name = 'Edward' and t.Surname = 'Hopper';

--2
select t.Surname
from Teachers t
join Assistants a on a.TeacherId = t.Id
join Lectures l on l.TeacherId = t.Id
join GroupsLectures gl on gl.LectureId = l.Id
join Groups g on g.Id = gl.GroupId
where g.Name = 'F505';

--3
select s.Name
from Subjects s
join Lectures l on l.SubjectId = s.Id
join Teachers t on t.Id = l.TeacherId
join GroupsLectures gl on gl.LectureId = l.Id
join Groups g on g.Id = gl.GroupId
where t.Name = 'Alex' 
and t.Surname = 'Carmack'
and g.Year = 5;

--4
select t.Surname
from Teachers t
where Id not in (
	select l.TeacherId
	from Lectures l 
	join Schedules s on s.LectureId = l.Id
	where s.DayOfWeek = 1
);


--5
select lr.Name, lr.Building
from LectureRooms lr
where Id not in (
	select s.LectureRoomId
	from Schedules s 
	where DayOfWeek = 3
	and Week = 2
	and Class = 3
);

--7
select Building from Faculties
union
select Building from Departments
union
select Building from Lecturerooms;

--8
select t.Name, t.Surname
from Teachers t
join Deans d on d.TeacherId = t.Id

union all

select t.Name, t.Surname
from Teachers t
join Heads h on h.TeacherId = t.Id

union all

select t.Name, t.Surname
from Teachers t
where t.ID not in (select TeacherId from Deans)
and t.ID not in (select TeacherId from Heads)
and t.ID not in (select TeacherId from Curators)
and t.ID not in (select TeacherId from Assistants)

union all

select t.Name, t.Surname
from Teachers t
join Curators c on c.TeacherId = t.Id

union all

select t.Name, t.Surname
from Teachers t
join Assistants a on a.TeacherId = t.Id;

--9
select s.DayOfWeek
from Schedules s
join LectureRooms lr on lr.Id = s.LectureRoomId
where lr.Name in ('A311', 'A104')
and lr.Building = 6
group by s.DayOfWeek

--10
select Year, count(Id) as GroupCount
from Groups
group by Year

--11
select t.Name, t.Surname, count(a.Id) as CountAssistants
from Teachers t
join Assistants a on a.TeacherId = t.Id
group by t.Name, t.Surname

--12
select g.Name, count(gl.LectureId) as CountLecture
from Groups g
join GroupsLectures gl on gl.GroupId = g.Id
group by g.Name
order by count(gl.LectureId) 
