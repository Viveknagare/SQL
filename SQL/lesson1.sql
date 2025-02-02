create database college;
-- create database if not exists college;   -- checks firstly if any database names college is available if not available then it creates
-- create database temp1;
-- drop database temp1;
-- drop database if exists college;  -- first checks whether database is present or not if present then deletes


use college;
-- create table student(
-- id int primary key,
-- name varchar(50),
-- age int not null
-- );

-- insert into student values(1,"vivek",22);
-- insert into student values(2,"sakshi",23);
-- insert into student values(3,"vighnesh",24);

--  select * from student;
--  
--  show databases;
--  use college;
--  show tables;
--  
--  drop table student;
create table student(
rollno int primary key,
name varchar(50)
);

select * from student;

-- here we are directly inserting into the student table which then by default takes data in all columns 
insert into student values
(1,"vivek"),
(2,"sakshi");


-- here we are inserting data by selecting columns, sequence of selected columns and data added is important
insert into student
(rollno,name)
values
(3,"chinmay"), 
(4,"Jitendra");

-- now to insert a single row

insert into student
(rollno,name)
values
(5,"devesh");

-- or
-- insert into student values (5,"devesh");  when we know the number of columns and need to add data to all the columns

-- excercise 1
-- create db xyz

create database xyz;
create table employeeinfo(
id int primary key,
name varchar(50),
salary int default 25000
);


insert into employeeinfo values
(1,"adam",25000),
(2,"Bob",30000),
(3,"casey",40000);

use xyz;
select * from employeeinfo;

create table emp(
 id int primary key,
 salary int default 25000    -- sets 25000 as default value
);

insert into emp(id) values (1),(2),(3),(4);
 
select * from emp;



