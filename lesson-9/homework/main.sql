------------------------------------------------------------
-- LESSON 9 - FULL DATABASE SETUP SCRIPT (SQL SERVER)
-- Includes all tables, insert statements, and corrections
------------------------------------------------------------

-- Drop tables if they already exist (for a clean rerun)
IF OBJECT_ID('Invoices') IS NOT NULL DROP TABLE Invoices;
IF OBJECT_ID('Orders') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Sales') IS NOT NULL DROP TABLE Sales;
IF OBJECT_ID('Products_Discounted') IS NOT NULL DROP TABLE Products_Discounted;
IF OBJECT_ID('Products') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('City_Population') IS NOT NULL DROP TABLE City_Population;
IF OBJECT_ID('Customers') IS NOT NULL DROP TABLE Customers;

------------------------------------------------------------
-- 1. Products Table
------------------------------------------------------------
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT
);

INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 1200, 50),
(2, 'Phone', 'Electronics', 800, 100),
(3, 'Headphones', 'Electronics', 150, 200),
(4, 'Refrigerator', 'Appliances', 900, 30),
(5, 'Microwave', 'Appliances', 300, 40),
(6, 'Shoes', 'Fashion', 120, 150),
(7, 'T-shirt', 'Fashion', 30, 300),
(8, 'Watch', 'Fashion', 250, 80),
(9, 'Blender', 'Appliances', 100, 60),
(10, 'Tablet', 'Electronics', 600, 90);

------------------------------------------------------------
-- 2. Customers Table
------------------------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    City NVARCHAR(50),
    Country NVARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, City, Country) VALUES
(1, 'John Smith', 'London', 'UK'),
(2, 'Emily Johnson', 'Paris', 'France'),
(3, 'Akmal Karimov', 'Tashkent', 'Uzbekistan'),
(4, 'Aisha Ali', 'Lagos', 'Nigeria'),
(5, 'Liam Brown', 'Los Angeles', 'USA'),
(6, 'Sophia Davis', 'Lisbon', 'Portugal'),
(7, 'Oliver Miller', 'Berlin', 'Germany'),
(8, 'Isabella Wilson', 'Lima', 'Peru'),
(9, 'Murat Ospanov', 'Almaty', 'Kazakhstan'),
(10, 'Layla Khan', 'Lahore', 'Pakistan');

------------------------------------------------------------
-- 3. Orders Table
------------------------------------------------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, TotalAmount) VALUES
(1, 1, 2, '2023-01-10', 2, 1600),
(2, 2, 1, '2023-01-12', 1, 1200),
(3, 3, 3, '2023-02-05', 3, 450),
(4, 4, 6, '2023-02-10', 2, 240),
(5, 5, 10, '2023-03-01', 1, 600),
(6, 6, 4, '2023-03-15', 1, 900),
(7, 7, 5, '2023-03-20', 2, 600),
(8, 8, 8, '2023-04-02', 1, 250),
(9, 9, 9, '2023-04-05', 3, 300),
(10, 10, 7, '2023-04-10', 5, 150);

------------------------------------------------------------
-- 4. Sales Table
------------------------------------------------------------
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10,2),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-10', 1200),
(2, 2, 2, '2023-01-15', 800),
(3, 3, 3, '2023-02-05', 450),
(4, 4, 4, '2023-02-10', 900),
(5, 5, 5, '2023-03-01', 300),
(6, 6, 6, '2023-03-15', 120),
(7, 7, 7, '2023-03-20', 30),
(8, 8, 8, '2023-04-02', 250),
(9, 9, 9, '2023-04-05', 100),
(10, 10, 10, '2023-04-10', 600);

------------------------------------------------------------
-- 5. Invoices Table
------------------------------------------------------------
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalAmount) VALUES
(1, 1, '2023-01-10', 1600),
(2, 2, '2023-01-12', 1200),
(3, 3, '2023-02-05', 450),
(4, 4, '2023-02-10', 240),
(5, 5, '2023-03-01', 600),
(6, 6, '2023-03-15', 900),
(7, 7, '2023-03-20', 600),
(8, 8, '2023-04-02', 250),
(9, 9, '2023-04-05', 300),
(10, 10, '2023-04-10', 150);

------------------------------------------------------------
-- 6. City_Population Table
------------------------------------------------------------
CREATE TABLE City_Population (
    City NVARCHAR(50),
    Year INT,
    Population INT
);

INSERT INTO City_Population (City, Year, Population) VALUES
('Bektemir', 2012, 34000),
('Chilonzor', 2012, 48000),
('Yakkasaroy', 2012, 56000),
('Bektemir', 2013, 36000),
('Chilonzor', 2013, 49000),
('Yakkasaroy', 2013, 58000);

------------------------------------------------------------
-- 7. Products_Discounted Table
------------------------------------------------------------
CREATE TABLE Products_Discounted (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Discounted (ProductID, ProductName, Category, Price) VALUES
(101, 'Laptop', 'Electronics', 1000),
(102, 'Phone', 'Electronics', 700),
(103, 'Shoes', 'Fashion', 100),
(104, 'Watch', 'Fashion', 200),
(105, 'Blender', 'Appliances', 90);

------------------------------------------------------------
-- FINAL CORRECTION
------------------------------------------------------------
ALTER TABLE Products
ADD DiscountPrice DECIMAL(10,2) NULL;

UPDATE Products
SET DiscountPrice = 
    CASE 
        WHEN Price > 500 THEN Price * 0.9
        ELSE Price * 0.95
    END;

------------------------------------------------------------
-- ✅ END OF FULL DATABASE SETUP SCRIPT
------------------------------------------------------------
