--Table student details
create table Student_details 
(student_id int primary key identity(1,1),
student_name varchar(25),
departmant varchar(25),
score int);
--Values insertion
insert into Student_details values('Siva','ECE',500)
insert into Student_details values('Harshan','Bsc-It',490),('Sharon','Bsc-It',480),('Karthi','Bsc-Ct',495),('Hemanth','BCA',450),('Hari','BCA',460),('Vasanth','BCA',490),('Vikram','BCA',478),('Raju','Bsc-ct',460)
insert into Student_details values('Guna','Bsc-It',480),('Kannan','Bsc-Ct',478),('Gokul','BCA',496),('Srikanth','BCA',454),('Priyadharshan','Bsc-Ct',465),('Selva','BCA',492),('Dhanaprakash','Bsc-it',479),('Arun','BCA',461),('venkit','BCA',478),('Vignesh','BCA',455)
insert into Student_details values('DivyaPrakash','Bsc-It',498),('Raina','Bsc-It',480),('Dhoni','Bsc-Ct',500),('Virat','BCA',550),('Sachin','BCA',465),('R aswin','BCA',490)
--Select table
select * from Student_details
truncate table student_details

--1. Create a non-clustered index for department.

Create nonclustered index non_cluster_department on Student_details ( departmant asc)
exec Sp_helpindex 'Student_details'

--2. Create a filtered index for department='BCA'
CREATE NONCLUSTERED INDEX noncluster_Department ON Student_details (Departmant asc) WHERE Departmant = 'BCA'


--3. Create a view for students in BCA department.

create view Depatment_BCA as Select * from Student_details where Departmant = 'BCA'

select * from Depatment_BCA

--4. Apply Rank() for all the students based on score.

select *  ,Rank() over(order by score desc) as RANK_Order from Student_details

--5. Apply Dense_Rank() for students in each department based on score.
select * ,DENSE_RANK() over(partition by Departmant order by Score desc ) as DEPARTMENT_RANK from Student_details

--b. Create 2 tables Manager(id(pk), name) and Employee(eid(pk),ename,mid(fk), department).
Create table Manager (id int primary key,name varchar(25))
create table Employee(eid int primary key, ename varchar (25),mid int references manager(id)) 

insert into Manager values(101,'Siva'),(102,'Karthi'),(103,'Hari'),(104,'Vikram')

insert into Employee  values (1,'Dharsan',101),(2,'Dhana',104),(3,'vasanth',103),(4,'sharon',104),(5,'vikram',104),(6,'selva',102),(7,'srikanth',101),(8,'Dhana',104)

select * from Manager
select * from Employee
--1. Create a complex view by retrieving the records from Manager and Employee table.

create view view_table
as 
select m.id,m.name,e.eid,e.ename from Manager as m inner join Employee as e on m.id=e.mid

select * from view_table
drop view view_table
--2. Show the working of 'on delete cascade on update set default' for the above tables

alter table Employee drop constraint [FK__Employee__mid__6477ECF3]--removing the foriegn key

alter table employee drop column mid



--performing the on delete cascade on update set default
alter table Employee add  mid int default 101 constraint FK__Employee__mid_del_cas_update_default foreign key (mid) references manager(id)on delete cascade on update set default 

delete from Manager where  id=101
update Manager set  id=101 where id=103
update manager set name='kannan' where id = 103
insert into manager values(103,'siva')





--truncation the table
truncate table employee

--on update set defatul checking
insert into employee (eid,ename) values (9,'david')


select * from Manager
select * from Employee