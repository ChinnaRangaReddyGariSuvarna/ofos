create database OnlineFoodOrderingSystem;

create table RestuarantAddMenus(
restId int primary key,
AddFoodItem varchar(100),
categories varchar(100),
itemPrice int,
quantity int);                                                      

select * from RestuarantAddMenus;

create table ResturantItemInfo(
itemId int primary key,
restId int foreign key references RestuarantAddMenus(restId),
custId int foreign key references CustomePlaceOrder(custId),
ItemName varchar(100),
price int,
quantity int);                                                   

select * from ResturantItemInfo;


create table RestuarantCustomerInfo(
custId int foreign key references CustomePlaceOrder(custId),
viewId int foreign key references CustomerViewOrder(viewId),
custName varchar(50),
custPhone varchar(10),
custEmail varchar(30),
foodName varchar(100),
price int,
quantity int);  

alter table RestuarantCustomerInfo add CustRestInfo int primary key identity;                                                      

select * from RestuarantCustomerInfo;


create table RestCustomerPayInfo(
payId int foreign key references makePaymentCustomer(payId),
custId int foreign key references CustomePlaceOrder(custId),
paymentStatus varchar(100),
modeOfPayment varchar(100));  

alter table RestCustomerPayInfo add CustRestPayInfo int primary key Identity;                                          

select * from RestCustomerPayInfo;


create table CustomerDisplayMenu(
itemId int foreign key references ResturantItemInfo(itemId),
foodName varchar(100),
foodPrice int,
categories varchar(150),
ResturantName varchar(200));                                                

alter table CustomerDisplayMenu add CustDispMenu int primary key Identity;
select * from CustomerDisplayMenu;


create table CustomePlaceOrder(
custId int primary key,
custName varchar(100),
custPhone varchar(10),
custAddress varchar(200),
custEmail varchar(50),
foodName varchar(100),
price int,
quantity int);                                                            
select * from CustomePlaceOrder;




create table CustomerViewOrder(
viewId int primary key,
custId int foreign key references CustomePlaceOrder(custId),
foodName varchar(200),
price int,
quantity int);                                                           


select * from CustomerViewOrder;

create table makePaymentCustomer(
payId int primary key,
custId int foreign key references CustomePlaceOrder(custId),
foodName varchar(100),
price int,
paymentMode varchar(200),
TrackOrder varchar(200));                                                
 
 select * from makePaymentCustomer;