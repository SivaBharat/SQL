--Table 
create table players
(
player_name varchar(25) unique,
jersey_number int primary key,
player_age int check(player_age>19),
player_position varchar(20) default 'Subtitute'
)

select * from players

--values insert
insert into players values('Kholi',18,34,'One town'),('Dhoni',07,36,'number five')
--default key
insert into players(player_name,jersey_number,player_age) values('Rohit',45,35)
--check key
insert into players values('Rhahul',01,17,'opener')
--primary key
insert into players(player_name,jersey_number,player_age) values('Dhoni',07,36)
--unique key
insert into  players(player_name,jersey_number,player_position) values('pant',33,'two town')


--rename table
exec sp_rename 'Team list' , 'Team'
select * from Team 

--rename database
exec sp_renamedb 'employee' , 'adminstrative'

--rename schema
create schema s1

create table s1.player
(
player_name varchar(25),
jersey_number int,
player_age int
)
select * from s1.player
 
create schema s2
alter schema s2 transfer s1.player

select * from s2.player

--3rd queston
create table emp
(
emp_id int identity (1,1),
emp_name varchar(25),
emp_salary int,
emp_increment int,

)

select * from emp

insert into emp(emp_name,emp_salary,emp_increment) values('siva',15000,3000)
insert into emp(emp_name,emp_salary,emp_increment) values('karthi',18000,3000)
insert into emp(emp_name,emp_salary,emp_increment) values('hari',25000,3000)

--computed column
alter table emp add revised_salary as (emp_salary + emp_increment)

--select into
--b. Retrieve all the records whose salary is >20000 and move them into a new table using (SELECT INTO)

select * into emp_details from emp where revised_salary >20000

select * FROM EMP_DETAILS
