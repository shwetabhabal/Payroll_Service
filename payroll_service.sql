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
alter table employee_payroll add column department int not null;
alter table employee_payroll add column basic_pay int;
alter table employee_payroll add column deduction int;
alter table employee_payroll add column taxable_pay int;
alter table employee_payroll add column income_tax int;
alter table employee_payroll add column net_pay int;
select * from employee_payroll;
