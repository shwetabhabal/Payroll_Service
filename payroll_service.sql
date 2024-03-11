create database payroll_service;
show databases;
use payroll_service;
create table employee_payroll (
id int primary key auto_increment,
name varchar(30),
salary int,
start_date date
);
insert into employee_payroll values(1,"ravi",5000,"2024-01-01");
insert into employee_payroll values
(2,"om", 6000,"2024-01-15"),
(3,"jay", 7000,"2024-02-01"),
(4,"prakash",5000,"2023-12-01"),
(5,"diva", 5000,"2023-11-01"),
(6,"raj", 6000, "2023-10-01");
select* from employee_payroll;
select salary from employee_payroll where name = "jay";
select salary from employee_payroll where
start_date between cast("2024-01-01" as date) and date(now());