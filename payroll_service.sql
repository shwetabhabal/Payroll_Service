create database payroll_service;
show databases;
use payroll_service;
create table employee_payroll (
id int primary key auto_increment,
name varchar(30),
salary int,
start_date date
);
insert into employee_payroll values
(1,"ravi",5000,20-1-2024);
insert into employee_payroll values
(2,"om",6000,22-1-2024),
(3,"prakash",7000,24-1-2024);
select * from employee_payroll;