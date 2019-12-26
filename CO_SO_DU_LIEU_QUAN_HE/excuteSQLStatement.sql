create database bank;
create table bank.customers(
id int primary key,
name varchar(50) not null,
email varchar(50) not null unique,
sdt varchar(15) not null unique
);

insert into bank.customers(id,name,email,sdt) values(1,"Vy","vy@gmail.com",0978881234);
insert into bank.customers(id,name,email,sdt) values(2,"Quoc","quoc@gmail.com",0978884322);
insert into bank.customers(id,name,email,sdt) values(3,"Minh","minh@gmail.com",0978887684);
insert into bank.customers(id,name,email,sdt) values(4,"Nam","ban@gmail.com",0978881512);

create table bank.accounts(
stk int primary key,
since varchar(10),
balance double,
customers_number int,
foreign key(customers_number) references customers(id)
);

insert into bank.accounts(stk,since,balance,customers_number) values(1001,'15/8/2000',0.0,1);
insert into bank.accounts(stk,since,balance,customers_number) values(1002,'11/5/2000',0.0,2);
insert into bank.accounts(stk,since,balance,customers_number) values(1003,'17/1/2000',0.0,3);
insert into bank.accounts(stk,since,balance,customers_number) values(1004,'14/2/2000',0.0,4);

create table bank.transactions(
IdGD int primary key,
balanceAfter double,
time varchar(10),
account_number int,
foreign key(account_number) references accounts(stk)
);

insert into bank.transactions(IdGD,balanceAfter,time,account_number) values(001,0.0,'15/8/2000',1001);
insert into bank.transactions(IdGD,balanceAfter,time,account_number) values(002,0.0,'15/8/2000',1002);
insert into bank.transactions(IdGD,balanceAfter,time,account_number) values(003,0.0,'15/8/2000',1003);
insert into bank.transactions(IdGD,balanceAfter,time,account_number) values(004,0.0,'15/8/2000',1004);

