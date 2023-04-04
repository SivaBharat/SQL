use trainees
select * from trainee

--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.

create TRIGGER DML_operations 
ON trainee
FOR INSERT, UPDATE, DELETE
AS
BEGIN
  IF DATEPART(DW,GETDATE())= 7 or DATEPART(DW,GETDATE())= 1
  BEGIN
    PRINT 'DML OPERATIONS ARE RESTRICTED ON SATURDAY AND SUNDAY'
    ROLLBACK TRANSACTION
  END
END
INSERT INTO Trainee values(010, 'siva', 'bharath', 80000, '2023-03-20', 'Admin')


--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.
create trigger restrict_delete_operations
on trainee
for delete 
as 
begin 
if datepart(hh,getdate()) between 11 and 15
print 'DML trigger to restrict delete operations between 11:00AM to 15:00PM'
rollback transaction
end

delete from Trainee where TRAINEE_ID =001


--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.

create trigger DDL_trigger
on database
for create_table,alter_table,drop_table,rename
as 
begin
print 'Notify whenever a CREATE, ALTER, DROP, RENAME operation is performed'
rollback tran
end
--working ddl triggers
--create table 
create table student(reg_num int)
--alter table
alter table trainee drop column last_name
--drop table
drop table trainee
--rename 
EXEC sp_rename 'trainees',' trainees_details'