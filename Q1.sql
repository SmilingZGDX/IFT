create database Bank
use Bank
create table customer(
customer_ID int primary key,
customer_name varchar(25) not null,
address varchar(100),
phone_no varchar(100),
email varchar(100)) 

insert into customer(customer_ID, customer_name, address, phone_no, email)
values (101,'Alicia Osman','232 Shady Oak','86788653352','aliosman@gmail.com');
insert into customer(customer_ID, customer_name, address, phone_no, email)
values (102,'Stephanie Garber','165 Northumberland St.',9876126573,'stephgarb@gmail.com');

drop table customer

select * from customer

create table credit(
transaction_ID int primary key,
customer_ID int not null,
amount int not null,
transacton_dt datetime default current_timestamp,
foreign key(customer_ID) references customer(customer_ID));

insert into credit(transaction_ID,customer_ID,amount) values(001,101,34000)
insert into credit(transaction_ID,customer_ID,amount) values(002,102,580000)

select * from credit

create table debit(
transacton_ID int primary key,
customer_ID int not null,
amount int not null,
transacton_dt datetime default current_timestamp,
foreign key(customer_ID) references customer(customer_ID))

insert into debit(transacton_ID,customer_ID,amount) values(001,101,680000)
insert into debit(transacton_ID,customer_ID,amount) values(002,102,54680)

select * from debit

