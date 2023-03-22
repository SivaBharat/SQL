--Table Trainees create
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
--Value insertion
INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002,'Niharika','Verma', 80000,2023-03-20,'Admin'),
(003,'Vishal','Singhal', 300000,2023-03-20,'HR'),
(004,'Amitabh','Singh', 500000,2023-03-20,'Admin'),
(005,'Vivek','Bhati', 500000,2023-03-20,'Admin'),
(006,'Vipul','Diwan', 200000,2023-03-20,'Account'),
(007,'Satish','Kumar', 75000,2023-03-20,'Account'),
(008,'Geetika','Chauhan', 90000,2023-03-20,'Admin');

--select table
select * from Trainees

--1. Write an SQL query to get the count of employees in each department.
select DEPARTMENT,count(DEPARTMENT) as'num of employees' from Trainees group by department
--2. Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
select JOINING_DATE, dateadd(day,5, JOINING_DATE )as induction_program_day from Trainees
--3. Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
SELECT JOINING_DATE,
CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
'July','August','September','October','November','December') AS JOINING_MONTH
FROM Trainees;
--4. Write an SQL query to perform the total and subtotal of salary in each department.
SELECT coalesce (DEPARTMENT, 'All Departments') AS DEPARTMENT,
  sum(SALARY) as sum_of_salary
  FROM Trainees
  GROUP BY ROLLUP (DEPARTMENT);
--5. Write an SQL query to retrieve first 3 records randomly.
select top 3 * from Trainees order by newid()
--6. Show the working of composite key with any example.
CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL ,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
constraint composite_key primary key(FIRST_NAME,LAST_NAME)
);
select * from Trainees
--7. Show the working of IIF and CASE for the above table.
--CASE
SELECT DEPARTMENT,SALARY,
CASE DEPARTMENT
    WHEN 'AdMIN' THEN 'CGVAK ADMIN DEPARTMENT'  
    WHEN 'Tester' THEN 'CGVAK ACCOUNT DEPARTMENT'  
    WHEN 'Account' THEN 'CGVAK HR DEPARTMENT'  
    ELSE 'CGVAK LEAD DEPARTMENT'  
END AS Department  
FROM Trainees; 
--IIF
SELECT IIF(SALARY<100000, 'JUNIOR DEVELOPER', 'SENIOR DEVELOPER') as CATEGORY FROM Trainees;
--8. Show the working of Sequence.
CREATE SEQUENCE [dbo].[SequenceObject]
AS INT
START WITH 1 
INCREMENT BY 1 

SELECT * FROM sys.sequences WHERE name = 'SequenceObject';
--9. Show the working of creation of Synonym for a table in DB1 from DB2.
CREATE SYNONYM db2
     FOR Tdetails.dbo.Trainees;

	 select * from db2
--10. Show the working of IDENTITY_INSERT.
create table empdetails(
 id int identity(1,1),
 name varchar(20),
 salary money,
 increment money)

  select *from empdetails
 insert into empdetails(name,salary,increment) values ('siva',30000,5000),('Bharath',25000,5000),('karthi',18000,5000)

 set identity_insert empdetails on;
 insert into empdetails(id,name,salary,increment) values(50,'sharon',20000,3000) 
  set identity_insert empdetails off;
   insert into empdetails(name,salary,increment) values('karthick',10000,2000) 
