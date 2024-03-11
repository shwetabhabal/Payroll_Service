create database payroll_service;
show databases;
use payroll_service;
create table employee_payroll (
id int primary key auto_increment,
name varchar(30),
salary int,
startdate DATE
);
insert into employee_payroll values
(1,'ravi',5000,'2020-12-20');
insert into employee_payroll values
(2,"om", 6000,"2024-01-15"),
(3,"jay", 7000,"2024-02-01"),
(4,"prakash",5000,"2023-12-01"),
(5,"diva", 5000,"2023-11-01"),
(6,"raj", 6000, "2023-10-01");
select * from employee_payroll;
select salary from employee_payroll where name = "jay";
select salary from employee_payroll where
startdate between cast("2024-01-15" as date) and date(now());

alter table employee_payroll add column gender char(1);
update employee_payroll set gender = 'M'
where name='ravi' or name = 'om' or name='jay' or name='prakash' or name='raj';
set sql_safe_updates = 0;
update employee_payroll set gender ='F' where name='diva';
select * from employee_payroll;
insert into employee_payroll values
(7,'rita',6000,'2023-05-01','F'),
(8,'ruchi',6000,'2020-06-01','F')
;
select sum(salary) from employee_payroll where gender = 'F' group by gender;
select avg(salary) from employee_payroll where gender = 'M' group by gender;
select min(salary) from employee_payroll where gender = 'M' group by gender;
select max(salary) from employee_payroll where gender ='F';
select count(name) from employee_payroll where gender = 'F' group by gender;
select gender, count(name) from employee_payroll group by gender;

alter table employee_payroll add column phone int ;
alter table employee_payroll add column address varchar(50) default 'Mumbai';
alter table employee_payroll add column department varchar(50) not null;
alter table employee_payroll add column basic_pay int;
alter table employee_payroll add column deduction int;
alter table employee_payroll add column taxable_pay int;
alter table employee_payroll add column income_tax int;
alter table employee_payroll add column net_pay int;
select * from employee_payroll;
alter table employee_payroll drop column salary;
insert into employee_payroll 
(name, startdate, gender, basic_pay,deduction, taxable_pay, income_tax,	net_pay, department)
values
('Teresa', '2019-01-03', 'F', 300000, 100000, 200000, 500000, 1500000, 'Marketting');
update employee_payroll set name='Terisa' where id=10;
create table salary (
id int,
foreign key (id) references employee(id), 
basic_pay int , 
deduction int , 
taxable_pay int, 
income_tax int ,
net_pay int
);
create table employee(
id int primary key,
name varchar(30),
startdate date,
gender char(1),
address varchar(30),
phone int,
department varchar(30)
);
INSERT INTO employee (id, name, startdate, gender, address, phone, department) VALUES
(1, 'John Doe', '2020-01-15', 'M', '123 Main St', 1234567890, 'HR'),
(2, 'Jane Smith', '2019-11-20', 'F', '456 Elm St', 9876543210, 'Finance'),
(3, 'Michael Johnson', '2021-03-10', 'M', '789 Oak St', 1357924680, 'IT'),
(4, 'Emily Davis', '2018-05-25', 'F', '101 Maple St', 2468013579, 'Marketing'),
(5, 'Robert Brown', '2022-09-05', 'M', '222 Pine St', 3698521470, 'Sales');
select * from employee;
 INSERT INTO salary (id, basic_pay, deduction, taxable_pay, income_tax, net_pay) VALUES
(1, 50000, 10000, 40000, 8000, 32000),
(2, 60000, 12000, 48000, 9600, 38400),
(3, 70000, 14000, 56000, 11200, 44800),
(4, 55000, 11000, 44000, 8800, 35200),
(5, 65000, 13000, 52000, 10400, 41600);
select sum(salary.basic_pay) as total_salary_female
from employee 
inner join salary
on employee.id = salary.id
where gender = 'F';

select sum(salary.basic_pay) as total_salary_male
from employee
inner join salary
on employee.id = salary.id
where gender = 'M';

select avg(salary.basic_pay) as avg_salary
from employee
inner join salary
on employee.id = salary.id
where gender = 'F';

select min(salary.basic_pay) 
from employee
inner join salary
on employee.id = salary.id
where gender = 'F';

select max(salary.basic_pay)
from employee
inner join salary
on employee.id = salary.id
where gender = 'F';

select gender, count(name)
from employee
where gender = 'F';

select gender, count(name)
from employee
where gender = 'M';