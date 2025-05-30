CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

CREATE TABLE IF NOT EXISTS Stores (
    StoreID INT AUTO_INCREMENT PRIMARY KEY,
    StoreName VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) UNIQUE
);

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID VARCHAR(20) PRIMARY KEY
);
ALTER TABLE Customers MODIFY CustomerID VARCHAR(50);


CREATE TABLE IF NOT EXISTS Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    SaleDate DATE,
    Qty INT,
    Unit_Price FLOAT,
    Total_Price FLOAT,
    ProductID INT,
    CustomerID VARCHAR(20),
    StoreID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

select*from stores;
select * from sales;
