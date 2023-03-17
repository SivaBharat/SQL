--Department table
create table departments
(
dept_id int primary key,
dept_name varchar(20) unique
)
insert into departments values(100,'Developer'),(101,'UI/UX')
select * from departments

--Address table
create table adress
(
adress_id int primary key,
city varchar(20) unique,
state varchar(20) unique,
pin_code int unique
)
insert into adress values(1,'Mannford','Oklahoma(OK)',74044),(2,'Sidney','Ohio(OH)',45365)
select * from adress

--Employee table
create table employees
(
emp_id int primary key,
emp_name varchar(20) unique,
emp_desgination varchar(20) references departments(dept_name),
dpt_id int references departments(dept_id),
mobile_1 bigint unique,
mobile_2 bigint unique,
street_adress varchar(30) not null,
id_add int references adress(adress_id)
)
insert into employees values (1,'John','Developer',100,9865741236,6325478962,'234 Hinton Rd',1)

insert into employees values (2,'Jamie','Ui/Ux',101,7893245698,null,'214 Doorley Rd',2)

insert into employees values (3,'Jack','Developer',100,5647896523,9856741236,'234 Hilton Rd',1)

select * from employees

--checking the working of normalization

insert into employees values (4,'jonny','Developer',100,4465655655,5675686655,'234 Hinton Rd',3)

select * from employees