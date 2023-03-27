create database task9
use task9
create table student
(
student_id int not null,
student_name varchar(25) not null,
semester varchar(20),
secured_marks int,
total_marks int
);
insert into student values(1,'siva','sem 1',450,500),
(2,'karthi','sem 1',490,500),(3,'hari','sem 1',491,500),(4,'hemanth','sem 1',480,500),
(5,'harsan','sem 1',494,500)

select * from student
truncate table student

--1. Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.

alter PROCEDURE sp_Name_Finder (@name varchar(25))
as
begin
select * from student where student_name=@name 
end
--execution
exec sp_name_finder 'siva'

--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
alter procedure Sp_remarks
as
begin
select * ,
case  
   when (secured_marks >= 495 and secured_marks<= 500) then 'Execellent'
   when (secured_marks >= 490 and secured_marks< 497) then 'Very good'
   when (secured_marks >= 480 and secured_marks< 490) then 'Good'
   when (secured_marks >= 450 and secured_marks< 480)  then 'Average'
   end as 'Remarks'
   from student
   end
   
--execution
 exec Sp_remarks

 --3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)
 --Local variable
 declare @local table(id int,name varchar(20),department varchar(10))
 insert @local values(101,'siva','ECE')
 select * from @local

 --Temporary varialbe
 declare @@global table(id int,name varchar(25),department varchar(10))
 insert into @@global values(102,'siva','ECE')
 select * from @@global

 --Local temporary table
CREATE TABLE #local (
    student_id int primary key,
	student_name varchar(25),
	semester varchar(25)
	);

	INSERT INTO #local
	select student_id,student_name,semester from student where total_marks='500';

	select * from #local

	--Global temporary table
	create table ##global(
	student_id int primary key,
	student_name varchar(25),
	semester varchar(25)
	);
	insert into ##global
	select student_id,student_name,semester from student where secured_marks='450';

	select * from ##global 

--Local stored procedure
alter procedure #local_pro
as
begin
select student_name,secured_marks from student
end
--execution of local procedure
exec #local_pro

--global Stored procedure
alter procedure ##global_pro
as
begin
select * from student
end

--execution of Global procedure
exec ##global_pro