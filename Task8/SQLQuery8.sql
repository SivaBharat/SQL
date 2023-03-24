create database student
use student
create table student
(
student_id int not null,
student_name varchar(25) not null,
semester varchar(20),
secured_marks int,
total_marks int
);
drop table student
insert into student values(1,'siva','sem 1',450,500),
(2,'karthi','sem 1',490,500),(3,'hari','sem 1',491,500),(4,'hemanth','sem 1',480,500),
(5,'harsan','sem 1',494,500),(1,'siva','sem 2',490,500),(2,'karthi','sem 2',480,500),(3,'hari','sem 2',495,500),
(4,'hemanth','sem 2',470,500),(5,'harsan','sem 2',497,500),(1,'siva','sem 3',476,500),(2,'karthi','sem 3',486,500),
(3,'hari','sem 3',466,500),(4,'hemanth','sem 3',496,500),(5,'harsan','sem 3',477,500);

select * from student

--1. Create User-define Scalar function to calculate percentage of all students after creating the following table.
create function dbo.student_percentage(@secured_marks decimal(7,3))
returns decimal(5,2)
As
Begin
declare @percentage decimal(5,2)
set @percentage=(@secured_marks/5)
Return @percentage
End

select * ,dbo.student_percentage(secured_marks) as percentage from student

--2. Create user-defined function to generate a table that contains result of Sem 3 students.
alter function dbo.Sem3_result(@semester varchar(20))
returns @result  table(student_id int,student_name varchar(25),semester varchar(20),secured_marks int,total_marks int)
as
begin 
insert into @result 
select * from Student where semester=@semester
return
end

select *  from dbo.Sem3_result('sem 3') as SEM3_result

--3. Write SQL stored procedure to retrieve all students details. (No parameters)

create procedure sp_Display_details2
as
select * from Student
go

exec sp_Display_details2

--4. Write SQL store procedure to display Sem 1 students details. (One parameter)

create procedure sp_Display_details_sem1 @semester varchar(25)
as 
select * from Student where semester =@semester
go

exec sp_Display_details_sem1 @semester ='Sem 1'

--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)
create Procedure sp_Display_output_parameter @student_count int output
as
begin
select @student_count = count(Student_id) from  Student
end;

declare @student_count int

exec sp_Display_output_parameter @student_count output
print @student_count 

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
create table Student_details2(Student_id int,Student_name varchar(30),semester varchar(25),securedmarks int,totalmark int)
insert into Student_details2 values(1,'Hari','Sem 1',499,500),(2,'Harshan','Sem 1',490,500),(3,'Karthi','Sem 1',480,500),(4,'Siva','Sem 1',485,500)


select * into student_details_backup from Student_details2;

select * from Student_details2 
 select * from student_details_backup

 update Student_details2 set Student_name='Venkit' where Student_id=1
 delete from student_details_backup where Student_id=4


 merge Student_details_backup sdb using student_details2 sd
on (sdb.student_id=sd.student_id)
when matched then update set
sdb.student_name=sd.student_name,
sdb.semester=sd.semester,
sdb.securedmarks=sd.securedmarks,
sdb.totalmark=sd.totalmark 
when not matched
then insert (student_id,student_name,semester,securedmarks,totalmark )
values(sd.student_id,sd.student_name,sd.semester,sd.securedmarks,sd.totalmark)
when not matched by source
then delete;
