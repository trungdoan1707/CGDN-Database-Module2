create database design_database_codegym;
use design_database_codegym;
create table offices(
officeCode int(50) not null auto_increment,
city varchar(50) not null,
phone int(12) not null,
addressLine1 varchar(255) not null,
addressLine2 varchar(255) null,
state varchar(255) not null,
country varchar(20),
postalCode int (30) not null,
territory varchar(50),
primary key (officeCode)
);
use design_database_codegym;
create table employees(
employeeNumber int (10) not null auto_increment,
lastName varchar (30) not null,
firstName varchar(50) not null,
extension varchar(255) not null,
email varchar(255) not null,
officeCode int(50) not null,
reportsTo int(10) null,
jobTitle varchar(255) null,
customerNumber int(15) not null,
primary key (employeeNumber),
foreign key(officeCode) references offices(officeCode)
);
use design_database_codegym;
alter table design_database_codegym.employees add foreign key employees(reportsTo) references employees(employeeNumber);
use design_database_codegym;
select * from employees;
use design_database_codegym;
CREATE TABLE customers(
customerNumber int (10) NOT NULL auto_increment,
customerName varchar(50) NOT NULL,
contactLastName varchar(50) NOT NULL,
contactFirstName varchar(50) NOT NULL,
phone int (12) NOT NULL,
addressLine1 varchar(255) NOT NULL,
addressLine2 varchar(255) NULL,
city varchar(255)NOT NULL,
sate varchar(255) NOT NULL,
postalCode int (10) NOT NULL,
country varchar(10) NOT NULL,
salesRepEmployeeNumber int (12) NOT NULL,
creditLimit int (255) NOT NULL,
primary key (customerNumber),
foreign key(salesRepEmployeeNumber) references employees(employeeNumber)
);
use design_database_codegym;
select * from customers;
use design_database_codegym;
create table orders(
orderNumber int(12) NOT NULL auto_increment,
orderDate date NOT NULL,
requiredDate date NOT NULL,
shippedDate date,
status varchar(10),
comments varchar(255),
customerNumber int(15),
primary key(orderNumber),
foreign key (customerNumber) references customers(customerNumber)
);

select * from orders;
use design_database_codegym;
create table payments(
customerNumber int not null auto_increment,
checkNumber int not null,
paymentsDate date,
amount int,
primary key(customerNumber,checkNumber),
foreign key(customerNumber) references customers(customerNumber)
);
use design_database_codegym;
create table productlines(
productline int not null auto_increment,
textDescription varchar(255),
htmlDescription varchar(255),
image varchar(255),
primary key (productline)
);

use design_database_codegym;
create table products(
productCode int not null auto_increment,
productName varchar(255) not null,
productLine int not null,
productScale varchar(255) not null,
productVendor varchar(255) not null,
productDescription varchar(255) not null,
quantitylnStock varchar(255) not null,
buyPrice int not null,
MSRP varchar(255),
primary key(productCode),
foreign key(productLine) references productlines(productLine)
);

use design_database_codegym;
create table orderdetails(
orderNumber int not null ,
productCode int not null,
quantityOrdered int not null,
priceEach int not null,
orderLineNumber int not null,
primary key(orderNumber , productCode),
foreign key(productCode) references products(productCode),
foreign key(orderNumber) references orders(orderNumber)
);
