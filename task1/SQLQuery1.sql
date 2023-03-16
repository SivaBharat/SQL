create database Trainees
use Trainees

CREATE TABLE Trainee (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
)
insert into Trainee values (1,'siva','bharath',30000,23-01-2023,'software')
select * from Trainee
insert into Trainee values(2,'karthikeyan','R',20000,16-09-2022,'software'),
(3,'Hemanth','S',40000,26-08-2022,'development'),
(4,'Harshan','k',50000,06-09-2022,'designer'),
(5,'Hari','karthick',60000,15-11-2018,'designer'),
(6,'sharon','david',65000,10-10-2021,'HR'),
(7,'vikram','k',55000,1-11-2022,'HR'),
(8,'vasanth','k',45000,15-11-2020,'admin'),
(9,'vishal','sj',70000,29-11-2021,'developer'),
(10,'dinesh','kumar',75000,15-11-2018,'designer'),
(11,'krishna','kumar',80000,05-06-2018,'admin'),
(12,'arun','joseph',85000,04-02-2017,'HR'),
(13,'selvin','j',20000,02-01-2020,'admin'),
(14,'divya','prakesh',35000,31-01-2023,'HR'),
(15,'selva','ganapathy',47000,29-11-2021,'developer'),
(16,'dhana','prakesh',46000,15-11-2018,'designer'),
(17,'saran','r',57000,02-06-2018,'admin'),
(18,'srikanth','r',67000,06-02-2017,'HR'),
(19,'kannan','s',15000,12-01-2020,'admin'),
(20,'arun','k',35000,22-09-2023,'HR')

--Names brtween J-T

select * from Trainee where FIRST_NAME like '[j-t]%'

--salary between 20000-50000
select * from Trainee where SALARY between 20000 and 50000

--All salary without duplications
select distinct SALARY from Trainee

--First name ending with i
select * from Trainee where FIRST_NAME like '%i'

--Whose department is developer and designer
select * from Trainee where DEPARTMENT='designer' or DEPARTMENT='developer'

--All trainee id less than 5
select * from Trainee where Trainee_ID<5

-- Limit the records by retrieving the 6 to 15 records
select * from Trainee order by trainee_id Offset 5 rows fetch next 10 rows only

--The top 5 records with Ties
select top 5 SALARY from Trainee order by SALARY

--The records in descending order based on department column
select * from Trainee order by DEPARTMENT desc

--All  last_name with 3rd character as 'a.'
select * from Trainee where LAST_NAME like '__a%'