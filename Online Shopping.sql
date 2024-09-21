Create database Online_Shopping
use Online_Shopping

--create table for Users--
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),  
    First_Name VARCHAR(100) NOT NULL,        
    Last_Name VARCHAR(100) NOT NULL,         
    Address TEXT NOT NULL,                 
    Email VARCHAR(255) NOT NULL UNIQUE,     
    Username VARCHAR(100) NOT NULL UNIQUE,  
    Password VARCHAR(255) NOT NULL,        
    Confirm_Password VARCHAR(255) NOT NULL,  
    Phone_Number VARCHAR(15),               
    Gender CHAR(1),                        
    Pin_Code VARCHAR(10),                    
    IsAdmin BIT NOT NULL,                  
    CreatedAt DATETIME DEFAULT GETDATE()    
);

--alter query for users---
alter table users drop column Gender
alter table users drop column isadmin
alter table users add  IsAdmin int  not null Default 0
update users set isadmin=1 where userid=5

select * from users

--insert records for user--
INSERT INTO Users (Username, Password, IsAdmin, Email)
VALUES ('ajikumar', 'welcome@123', 1, 'ajikumar123@gmail.com'),('gopi', 'welcome@12345', 0, 'gopi123@gmail.com')



--create table for products--
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1), 
    ProductName VARCHAR(100) NOT NULL,  
    Category VARCHAR(50) NOT NULL,        
    Price DECIMAL(10, 2) NOT NULL,          
    Description TEXT,                       
    Quantity INT NOT NULL)


--alter query for products--
alter table products add Imgpath varchar(100)  not null 
alter table products add Model varchar(100)  not null 

select * from Products


--create table for cart--
CREATE TABLE Cart (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,                  
    ProductID INT NOT NULL,               
    Quantity INT NOT NULL,                
    FOREIGN KEY (UserID) REFERENCES Users(UserID),   
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--alter query for cart--
alter table Cart add ProductName varchar(100)  not null 
alter table Cart alter column Price decimal(18,2) not null 
alter table cart drop column userid

delete cart

select * from cart


--create table for order details--

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),   
	UserID INT NOT NULL,
    ProductID INT NOT NULL,                    
    Quantity INT NOT NULL,                       
    UnitPrice DECIMAL(10, 2) NOT NULL,           
    TotalPrice AS (Quantity * UnitPrice),
	ShippingAddress varchar(200) NOT NULL,
	OrderDate DATETIME NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID), 
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) 
);

select * from OrderDetails
