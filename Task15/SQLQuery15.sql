use student
select * from student
--1. Auto-commit and Auto-rollback transactions.
--Auto commit
BEGIN TRAN
UPDATE student 
SET    student_name = 'Bharath', 
        secured_marks = '476' 
WHERE  student_ID = 1
SELECT @@TRANCOUNT AS auto_commit
COMMIT TRAN 
SELECT @@TRANCOUNT AS auto_commit
--AUTO ROLLBACK
BEGIN TRAN

INSERT INTO student 
VALUES(6, 'Bala','sem 1',444,500)
    
UPDATE student SET student_name='Saron' WHERE student_ID=5
SELECT * FROM student
 
COMMIT TRAN

--2. Implicit transactions
SET IMPLICIT_TRANSACTIONS ON 
UPDATE 
    student 
SET 
    student_name = 'Sam'  
WHERE 
    student_ID = 2 

SELECT 
    IIF(@@OPTIONS & 2 = 2, 
    'Implicit Transaction Mode ON', 
    'Implicit Transaction Mode OFF'
    ) AS 'Transaction Mode' 
SELECT 
    @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT 
    @@TRANCOUNT AS OpenTransactions

SET IMPLICIT_TRANSACTIONS OFF

--3. Explicit transactions
    --a. Only Commit - insert statement
	--WITHOUT COMMIT
BEGIN TRAN
 
UPDATE student
SET    student_name = 'jhon', 
        semester = 'sem 1' 
WHERE  student_ID = 4
 
SELECT @@TRANCOUNT AS OpenTransactions


--WITH COMMIT
BEGIN TRAN
UPDATE student
SET    student_name = 'joe', 
        semester='sem 1' 
WHERE  student_ID = 1
SELECT @@TRANCOUNT AS OpenTransactions 
COMMIT TRAN 
SELECT @@TRANCOUNT AS OpenTransactions

-- b. Only Rollback - update statement
   BEGIN TRAN
UPDATE student 
SET    student_name = 'David', 
       semester='sem 3' WHERE student_ID=2
 
 
SELECT * FROM student WHERE student_ID=2
 
ROLLBACK TRAN 
 
SELECT * FROM student WHERE student_ID=2
 --c. Savepoint - commit update and insert statements, rollback delete statement
 begin tran
	delete from Student where student_id=3
	SAVE tran A
	update Student set secured_marks=499 where student_id=1
    insert into Student values ( 6,'kavin','sem 1',487,500)
	select * from Student
	select @@trancount as no_of_transactoins
	rollback tran a
	commit

	select * from Student
