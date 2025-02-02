create database college;

use college;

create table student(
  rollno int primary key,
  name varchar(50),
  marks int not null,
  grade varchar(1),
  city varchar(20)
);

create table dept(
  id int primary key,
  name varchar(50)
);

insert into dept 
values
(101,"english"),
(102,"IT");

update dept
set id = 103
where name in ("IT");

create table teacher(
  id int primary key,
  name varchar(50),
  dept_id int,
  foreign key(dept_id) references dept(id)
  on update cascade
  on delete cascade
);

insert into teacher
values
(101,"Adam",101),
(102,"Eve",102);

insert into student values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

select * from student;
 
select name,marks,city from student;
select distinct city from student;
select * from student where marks > 80 and city = "mumbai";
select * from student where city in ("mumbai","delhi");
select * from student where marks>75 limit 3;
select * from student order by city asc limit 3;
select max(marks) from student;  -- min,avg,sum,count

select city,avg(marks)
from student
group by city;

select city,name, count(rollno)
from student
group by city,name;        -- jo bhi ham columns select krte he woh sab columns group by mein likhna padta hein warna error ata hein 

select city, avg(marks)
from student
group by city order by city asc;

-- Query to find average marks in each city in ascending order

select city, avg(marks)
from student
group by city
order by avg(marks) asc;


-- count the number of students in each city where max marks cross 90

select city, count(name)
from student
group by city
having max(marks) > 90;

-- having and aggregate functions are mostly used by group by clause

-- general flow of the query with having clause
-- select
-- from
-- where
-- group by
-- having
-- order by

SET SQL_SAFE_UPDATES = 0;

--  update operation
update student
set grade = "O"
where grade = "A"; 

 update student
 set marks = marks + 1;
 
--  delete 
delete from student
where marks < 30;

-- emanuel deleted

-- table design queries

alter table student
add column age int not null default 19;

select * from student;

alter table student
drop column age; 

alter table student
modify column age varchar(20);

alter table student 
change column  age stu_age int; 

alter table student
drop column stu_age;

alter table student
rename to stu;

alter table stu
rename to student;

truncate table student;

-- practice

alter table student
change column name fullname varchar(20); 

delete from student
where marks < 80;

alter table student
drop column grade;

-- joins

create table stu(
id int primary key,
name varchar(50)
);

insert into stu values
(101,"adam"),
(102,"bob"),
(103,"casey");

create table course(
 student_id int primary key,
 course varchar(50)
);

insert into course values
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science");

select * from course;
-- inner join
select * from course
inner join stu
on course.student_id = stu.id;

-- using alias
select * from course as c
inner join stu as s
on c.student_id = s.id;

-- outer joins
-- 1) left outer join

select * from stu as s
left join course as c
on s.id = c.student_id;

-- 2)right outer join

select * 
from stu
right join course
on stu.id = course.student_id;

-- 3)fulljoin

select * from stu
left join course
on stu.id = course.student_id
union
select * from stu
right join course
on stu.id = course.student_id;


-- left exclusive join
select * from stu
left join course
on stu.id = course.student_id
where course.student_id is null;

-- right exclusive join

select * from stu
right join course
on stu.id = course.student_id
where stu.id is null;

-- when we need to all the portion without overlapping part
-- then do union of left-exclusive and right-exclusive join

select * from stu
left join course
on stu.id = course.student_id
where course.student_id is null
union
select * from stu
right join course
on stu.id = course.student_id
where stu.id is null;


create table employee(
 id int primary key,
 name varchar(20),
 manager_id int
);

insert into employee values
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"donald",103);

select * from employee;

-- self join

select a.name as manager,b.name from employee as a
join employee as b
on a.id = b.manager_id;

-- union
-- union removes duplicate values and return unique, also the union of columns we are taking must be in same order and should have same datatype

select name from employee
union
select name from employee;

-- union all gives duplicates as well

select name from employee
union all
select name from employee;

-- subqueries
-- used where we need to perform something dynamically when new data gets added

select name,marks
from student
where marks > (select avg(marks) from student);

select name from student
where rollno % 2 = 0;

-- with subquery
select name from student
where rollno in (select rollno 
                 from student
				 where rollno % 2 = 0);
                 
-- without subqueries  
select name from student
where city = "delhi";
-- with subquery
-- when we write subqueries in from alias are necessary 
select max(marks) from (select * from student where city = "delhi") as temp;


-- subquery with select statement

-- views
create view student1 as select name, grade,city from student;

select * from student1;

-- now you can run queries on the view

drop view student1; 

-- views are virtual table and not the real ones 
 