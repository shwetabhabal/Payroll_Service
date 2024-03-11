create database payroll_service;
show databases;
use payroll_service;
create table employee_payroll (
id int primary key auto_increment,
name varchar(30),
salary int,
start_date int
);