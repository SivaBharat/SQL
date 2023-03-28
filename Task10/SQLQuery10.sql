create database task10
use task10
--Table create
create table employees
(
EMPLOYEE_ID int primary key,
FIRST_NAME varchar(25)not null,
LAST_NAME varchar(25)not null,
EMAIL varchar(25)not null,
PHONE_NUMBER bigint not null,
HIRE_DATE date,
JOB_ID int unique not null,
SALARY int
);
drop table employees
--values insert
insert into employees values 
(1,'siva','Bharath','siva@gmail.com',9876543210,'2020-01-20',101,50000),
(2,'Karthi','k','karthi@gmail.com',9876543211,'2020-02-21',102,55000),
(3,'Hari','H','Hari@gmail.com',9876543212,'2020-03-20',103,5000),
(4,'harsan','S','harsan@gmail.com',9876543213,'2020-04-20',104,60000),
(5,'Saron','S','Saron@gmail.com',9876543214,'2020-05-20',105,65000),
(6,'Hemanth','B','Hemanth@gmail.com',9876543215,'2020-06-20',106,70000),
(7,'Vikram','V','Vikram@gmail.com',9876543216,'2020-07-20',107,75000),
(8,'vasanth','V','vasanth@gmail.com',9876543217,'2021-01-20',108,80000),
(9,'Rinita','R','Rinita@gmail.com',9876543218,'2021-01-20',109,85000),
(10,'Harismitha','H','Harismitha@gmail.com',9876543290,'2022-01-20',110,90000),
(11,'Harita','H','Harita@gmail.com',9876543110,'2020-01-20',111,95000),
(12,'Yamini','Y','Yamini@gmail.com',9876543310,'2020-04-20',112,97000),
(13,'srikanth','S','srikanth@gmail.com',9876543410,'2020-06-20',113,98000),
(14,'Selva','S','Selva@gmail.com',9876543510,'2020-08-20',114,55000),
(15,'dhana','D','dhana@gmail.com',9876543610,'2020-01-20',115,58000),
(16,'divya','D','divya@gmail.com',9876543710,'2020-09-20',116,57000),
(17,'venkit','V','venkit@gmail.com',9876543810,'2020-12-20',117,53000),
(18,'priya','P','priya@gmail.com',9876543910,'2020-09-20',118,58000),
(19,'arun','A','arun@gmail.com',9876540210,'2020-09-20',119,59000),
(20,'vignesh','V','vignesh@gmail.com',9876541210,'2020-09-20',120,576000)

select * from employees

--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

select EMPLOYEE_ID,First_name,last_name,SALARY from employees where SALARY >(select salary from employees where EMPLOYEE_ID=16)

--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.

select first_name,last_name,job_id,HIRE_DATE from employees where HIRE_DATE in (select HIRE_DATE from employees where EMPLOYEE_ID=11 )

--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME as avg_salary from employees where salary >(select avg(salary) from employees)

--4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.

select FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY from employees where FIRST_NAME in (select FIRST_NAME from employees where FIRST_NAME='Yamini')

--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

select * from employees where SALARY between (select min(salary) from employees) and  (select AVG(SALARY) from employees)