--Table salesman
create table  Salesmans
(Salseman_id int primary key,
name varchar(25) unique not null,
city varchar(25) not null,
commission numeric(4,2) not null)
--Value insert
insert into Salesmans values(5001,'James Hoog','New York', 0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

--Table Customer
create table Customer ( customer_id int primary key,
cust_name varchar(25),
city varchar(25), 
grade int,
salesman_id int references salesmans(salseman_id))
--Value insert
insert into Customer values(  3002 , 'Nick Rimando '  ,' New York  ' ,   100,  5001),
( 3007 , 'Brad Davis '    , 'New York'   ,   200 ,        5001),
(3005 , 'Graham Zusi'    , 'California ',   200 ,        5002),
(3008 ,' Julian Green'  ,' London '    ,   300 ,        5002),
(3004 , 'Fabian Johnson' , 'Paris '     ,   300 ,5006),
(3009 ,' Geoff Cameron'  , 'Berlin '    ,   100 ,        5003),
(3003 , 'Jozy Altidor '  , 'Moscow  '   ,   200 ,        5007),
(3001 , 'Brad Guzan '    ,' London '    ,    100   ,        5005)
--Table orders
create  table Orders 
(ord_no int,
purch_amt numeric(8,3),
ord_date date,
customer_id int references customer(customer_id),
salesman_id int references salesmans(salseman_id));
--Value orders
insert into orders values (70001     ,  150.5    ,   '2012-10-05 ', 3005      ,   5002),
(70009    ,   270.65     , '2012-09-10 ' ,3001        , 5005),
(70002    ,   65.26      , '2012-10-05 ' ,3002        , 5001),
(70004    ,   110.5     , ' 2012-08-17' , 3009       ,  5003),
(70007    ,   948.5     , ' 2012-09-10' , 3005       ,  5002),
(70005    ,   2400.6    , ' 2012-07-27 ' ,3007        , 5001),
(70008    ,   5760      ,  '2012-09-10'  ,3002       ,  5001),
(70010   ,    1983.43   , ' 2012-10-10 ' ,3004        , 5006),
(70003   ,    2480.4    ,  '2012-10-10 ' ,3009       ,  5003),
(70012   ,    250.45   ,  ' 2012-06-27 ' ,3008        , 5002),
(70011   ,    75.29    ,  ' 2012-08-17 ', 3003       ,  5007),
(70013   ,    3045.6   ,  ' 2012-04-25' , 3002         ,5001);
--select table salesman
select * from Salesmans
--select table customer
select * from Customer
--select table order
select *  from orders

--1.From the above tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

select sm.name as SalesMan,c.cust_name,c.city from Salesmans  as sm inner join Customer as c on sm.city=c.city

--2.From the above tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission.

select  c.Cust_name as Customer_name,sm.city,sm.name as Salesman,sm.commission from Salesmans as sm inner join customer as c on sm.salseman_id=c.salesman_id  where sm.commission > 0.12;

--3.From the above tables write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.
select o.ord_no,o.ord_date,o.purch_amt,c.Cust_name as customer_name,c.grade,sm.name as SalesMan,sm.commission from Salesmans as sm inner join Customer as c on sm.Salseman_id=c.salesman_id inner join Orders as o on  c.customer_id=o.customer_id

--4.From the above tables write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
select o.ord_no,o.purch_amt,c.cust_name,c.city from Customer as c inner join Orders as o on c.customer_id=o.customer_id where o.purch_amt between 500 and 2000

--5.From the above tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
select  c.Cust_name as Customer_name,c.city as customer_city,sm.name as Salesman,sm.city as salesman_city from Salesmans as sm inner join customer as c on sm.salseman_id=c.salesman_id  order by c.customer_id asc;