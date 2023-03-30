use Trainee
--Create table hobbies
create table hobbies
(
hobby_id int Primary key,
hobby_name varchar(25) unique
)
--select table
select * from hobbies
truncate table hobbies
--1. insert records into the table using a stored procedure.
create PROCEDURE InsertRecords @hobby_id int, @hobby_name varchar(25)
AS
BEGIN
	INSERT INTO [dbo].[hobbies](hobby_id, hobby_name)
	VALUES(@hobby_id, @hobby_name)
END

EXEC InsertRecords '101', 'Playing'
--2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.
ALTER PROCEDURE InsertRecords @hobby_id int, @hobby_name varchar(25)
AS
BEGIN
	BEGIN TRY
		INSERT INTO [dbo].[hobbies](hobby_id, hobby_name)
		VALUES(@hobby_id, @hobby_name)
	END TRY

	BEGIN CATCH
		PRINT('The hobby name or hobby id  is already taken. Try another one')
	END CATCH
END
--3. Store the error details in an errorbackup table.

CREATE TABLE Errors_details
         (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)

create PROCEDURE error (@hobbyId int,@HobbyName varchar(25))
AS
  BEGIN TRY
    INSERT INTO hobbies
         SELECT @hobbyId,@HobbyName
  END TRY
  BEGIN CATCH
    INSERT INTO Errors_details
    VALUES
  (SUSER_SNAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
  END CATCH
GO

exec error 7,'playing'

select * from Errors_details

--b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.
create procedure Product_num(@num1 int,@num2 int)
as 
begin 
declare @result int
set @result=@num1*@num2
begin  try
if @num1=@num2
print 'The Product of '+cast(@num1 as varchar)+' and '+ cast(@num2  as varchar)+ ' = ' + cast(@result as varchar)
else
RAISERROR('Number are different',16,1)
end try
 BEGIN CATCH
    PRINT ERROR_NUMBER()
    PRINT ERROR_MESSAGE()
    PRINT ERROR_SEVERITY()
    PRINT ERROR_STATE()
  END CATCH
end

exec Product_num 10,10

exec Product_num 15,10


--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure. Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.
create table  friends(id int identity(1,1), name varchar(25) unique) 

create procedure Sp_friends(@name varchar(25))
as 
begin 
if (@name like '[ADHKPRSTVY]%')
insert into friends values(@name)
else
Print 'The  Name should starts with A,D,H,K,P,R,S,T,V,Y '
end

exec Sp_friends 'siva'

exec Sp_friends 'Karthi'

exec Sp_friends 'bala'

select * from Friends