
create table student
(
s_id int,
s_name varchar(20),
Department varchar(20),
Year_Of_Completion int
)

insert into student values
(1,'siva','BCA',2023),
(2,'karthi','MCA',2024),
(3,'Hari','BCOM',2022),
(4,'Hemanth','BSC',2021),
(5,'Harshan','BCA',2023),
(6,'Arun','MCA',2024),
(7,'Selva','BCOM',2022),
(8,'Dhanaprakash','BSC',2021),
(9,'Sridhar','BCA',2021),
(10,'Dharshan','MCA',2024),
(11,'Vijay','BCOM',2024),
(12,'Ajith','BSC',2021),
(13,'Kavin','BCA',2023),
(14,'Ajay','MCA',2024),
(15,'Virat','BCOM',2022),
(16,'Harish','BSC',2021),
(17,'Vishal','BCA',2023),
(18,'Kannan','MCA',2021),
(19,'Naveen','BCOM',2022),
(20,'Sameer','BSC',2023)



--1. Show the working of PIVOT and UNPIVOT by creating a table students(sid,sname,department,yearofcompletion) with 20 records.
--Note: Simplify the table to show the number of students in each department and categorize them based on yearofcompletion.

select  department,year_of_completion,number_of_students from
(select department,[2021],[2022],[2023],[2024] from
(select department,year_of_completion from  Student)as table1
pivot
(count(year_of_completion) for year_of_completion in ([2021],[2022],[2023],[2024])) as Pivot_batches) as pivot_table
unpivot
(number_of_students for year_of_completion in  ([2021],[2022],[2023])) as table2

select * from student


--2. Create a database for Library Management. Analyse the required columns, perform a normalization and link the tables using 
--primary and foreign key (using on update set default)

CREATE DATABASE Librarymanagement
use librarymanagement
--Table creation
create table Authors(author_code int primary key,author_name varchar(20) unique not null)
create table Books(Book_code int Primary key,Book_name varchar(50)  not null , Published_year int not null,Author_code int references Authors(Author_code))
create table Customers(Customer_id int primary key ,Customer_name varchar(20)not null ,Mobile_number bigint not null unique,Book_code int  references Books(Book_code))

--values insertion
insert into Authors values (1,'skakesphere'),
(2,'kc wood'),
(3,'james'),
(4,'jhon')

insert into Books values(1,'romeo',1997,1),
(2,'juliet',2021,1),
(3,'The spiderman',2019,1),
(4,'The batman ',2020,1),
(5,'the captain ',20011,1),
(6,'The hary parter',2016,1),
(7,'Guardian',2005,2),
(8,'The punjab king',2007,2),
(9,'The lone king',2000,3),
(10,'Game of Thornes',2022,3),
(11,'War and love',2010,4),
(12,'No way home',1992,4)


insert into Customers values
(101,'siva',9876543210,4),
(102,'karthi',9876543120,6),
(103,'hemanth',9786543210,11),
(104,'harsan',9768542120,8),
(105,'hari',9856743210,9)


select * from Authors;
select * from Books;
select * from Customers;


--on update cascade

alter table customers drop constraint [FK__Customers__Book___3D5E1FD2]

alter table Customers drop column book_code

alter table Customers add Book_code int default 1 constraint Fk_On_update_key
foreign key (Book_code) references Books(book_code) on update set default

truncate table Customers 

insert into Customers(Customer_id,Customer_name,Mobile_number)values(106,'venkat',8970558210)

--select tables
select * from Authors;
select * from Books;
select * from Customers;

