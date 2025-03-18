/*
Task : You are given three tables: Students, Friends and Packages. 
		Students contains twocolumns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of theONLY best friend). 
		Packages contains two columns: ID and Salary (offered salary in$ thousands per month). 
		Write a query to output the names of those studentswhose best friends got offered a higher salary than them. 
		Names must be orderedby the salary amount offered to the best friends. 
		It is guaranteed that no twostudents got same salary offer.
		

Result : Samantha
		 Julia
		 Scarlet */


create database assignment1;

use assignment1;

drop schema schema1;

CREATE TABLE students (
    id INT,
    name VARCHAR(255)
);

CREATE TABLE friends (
    id INT,
    friend_id INT
);

CREATE TABLE packages (
    id INT,
    salary FLOAT
);

insert into students values (1,'Ashley'),(2,'Samantha'),(3,'Julia'),(4,'Scarlet');

select * from students;

insert into friends values (1,2),(2,3),(3,4),(4,1);

select * from friends;

insert into packages values (1,15.20),(2,10.06),(3,11.55),(4,12.12);

select * from packages;







