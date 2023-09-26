--create procedure
--SYNTAX--
--create proc SP_Emp_select
--as begin

--return
--end

create proc SP_Emp_select
as begin
select * from Employee
return
end

-- call the SP

exec SP_Emp_select

-- with parameters

create proc SP_Emp_City(@city varchar(10))
as begin
select * from Employee where city=@city
return 
end

exec SP_Emp_City
@city='Pune'

-- DML
create proc SP_Insert_Emp
(
@id int,
@name varchar(20),
@email varchar(20),
@age int,
@sal numeric(12,2),
@city varchar(10),
@did int,
@mid int
)
as begin
insert into Employee values(@id,@name,@email,@age,@sal,@city,@did,@mid)
return
end

exec SP_Insert_Emp
@id=12,
@name='Test',
@email='test@gmail.com',
@age=22,
@sal=34567.45,
@city='Delhi',
@did=103,
@mid=4


create proc SP_Update_Emp
(
@id int,
@name varchar(20),
@email varchar(20),
@age int,
@sal numeric(12,2),
@city varchar(10),
@did int,
@mid int
)
as begin
update Employee set name=@name,email=@email,age=@age,salary=@sal,city=@city,
did=@did,managerid=@mid where id=@id
return
end


exec SP_Update_Emp
@id=12,
@name='Test2',
@email='test@gmail.com',
@age=23,
@sal=34567.45,
@city='Pune',
@did=103,
@mid=4


create proc SP_Update_City
(@city varchar(20), @id int)
as begin
update Employee set city=@city where id=@id
return 
end

exec SP_Update_City
@id=12,
@city='Mumbai'


create proc Sp_Delete_Emp
(@id int)
as begin
delete from Employee where id=@id
return 
end

exec Sp_Delete_Emp
@id=12

