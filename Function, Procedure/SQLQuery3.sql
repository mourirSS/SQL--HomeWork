use Mydatabase;


create table Employees (
	Id int primary key identity,
	Name nvarchar(25) not null,
	Position nvarchar(25) not null,
	Salary money not null,
	HireDate date not null
);


INSERT INTO Employees (Name, Position, Salary, HireDate)
VALUES
('John Smith', 'Manager', 55000, '2022-03-15'),
('Emily Johnson', 'Accountant', 48000, '2021-11-10'),
('Michael Brown', 'Developer', 75000, '2023-05-20'),
('Sophia Davis', 'HR', 50000, '2022-09-01'),
('Daniel Wilson', 'Director', 120000, '2020-01-05');

--Function
--1
create function dbo.GetEmployeesCount()
returns int 
as
begin
	return (select count(*) from Employees)
end;


SELECT dbo.GetEmployeesCount();


--2 
create function dbo.GetMaxSalary()
returns money 
as
begin
	return (select max(Salary) from Employees)
end;

select dbo.GetMaxSalary();

--3
create function dbo.GetMinHireDate()
returns date 
as
begin
	return (select min(HireDate) from Employees)
end;

select dbo.GetMinHireDate();


--Procedure
--1
create procedure dbo.CreateEmployee
	@name nvarchar(25),
	@position nvarchar(25),
	@salary money,
	@hireDate date 
as
begin
	insert into Employees (Name, Position, Salary, HireDate)
	values (@name, @position, @salary, @hireDate)
end;

exec dbo.CreateEmployee
	@name = 'Yan Bitner',
    @position = 'Developer',
    @salary = 75000,
    @hireDate = '2023-05-20';

select * from Employees;

--2
create procedure dbo.ReadAllEmployees
as
begin
	select * from Employees
end;

exec dbo.ReadAllEmployees

--3
create procedure dbo.ReadEmployeeById
	@id int
as
begin
	select * from Employees 
	where Id = @id
end;

exec dbo.ReadEmployeeById 4

--5
create procedure dbo.UpdateEmployee
	@id int,
	@name nvarchar(25),
	@position nvarchar(25),
	@salary money,
	@hireDate date 
as
begin
	update Employees
	set Name = @name,
        Position = @position,
        Salary = @salary,
        HireDate = @hireDate
		where Id = @id
end;

EXEC dbo.UpdateEmployee 
    @id = 3,
    @name = 'Eldaniz Mammadov',
    @position = 'Senior Developer',
    @salary = 90000,
    @hireDate = '2023-05-20';

select * from Employees;


--6
create procedure dbo.DeleteAllEmployees
as
begin
	delete from Employees
end;

exec dbo.DeleteAllEmployees;


--7
create procedure dbo.DeleteEmployeeById
	@id int
as
begin
	delete from Employees 
	where Id = @id
end;

exec  dbo.DeleteEmployeeById 1
