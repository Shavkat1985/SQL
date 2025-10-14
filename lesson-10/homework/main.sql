-- =========================================
--  LESSON 10 JOINS - COMPLETE DATABASE SETUP
-- =========================================

-- Drop tables in correct dependency order
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Customers;

-- =========================================
-- 1. DEPARTMENTS
-- =========================================
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Human Resources'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance');

-- =========================================
-- 2. EMPLOYEES
-- =========================================
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    ManagerID INT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate, ManagerID) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01', NULL),  
(2, 'Jane Smith', 2, 65000.00, '2019-03-15', 1),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10', 2),
(4, 'James Brown', 5, 60000.00, '2018-07-22', 1),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30', 4),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12', 2),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02', 3),
(8, 'David Moore', 4, 85000.00, '2021-09-01', 5),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18', 1),
(10, 'William Anderson', 2, 64000.00, '2020-04-10', 2),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25', 3),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30', 5),
(13, 'Karen White', 1, 59000.00, '2018-06-10', 9),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15', 6),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20', 7),
(16, 'George Lewis', 4, 80000.00, '2019-11-10', 8),
(17, 'Betty Lee', 5, 55000.00, '2017-04-05', 4),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22', 6),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16', 7),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11', 12),
(21, 'Betty Young', 1, 53000.00, '2020-05-17', 9),
(22, 'Frank King', 2, 67000.00, '2021-02-02', 10),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09', 11),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15', 16),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21', 21),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03', 10),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19', 19),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10', 16),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05', 21),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24', 22),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13', 23),
(32, 'Brian Moore', 5, 85000.00, '2018-11-05', 17),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11', 25),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29', 26),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06', 27),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01', 28),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19', 29),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04', 30),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23', 31),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10', 36),
(41, 'Kevin Turner', 6, 55000.00, '2022-02-14', NULL), 
(42, 'Laura Phillips', 7, 62000.00, '2023-05-22', 41),
(43, 'Eric Collins', 8, 58000.00, '2020-10-30', 41),
(44, 'Megan Edwards', 9, 70000.00, '2019-11-25', 41);

-- =========================================
-- 3. CUSTOMERS
-- =========================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

-- (40 rows, omitted here for brevity but keep your previous Customer INSERTS block)
-- ⚠️ Paste your full 40-row INSERT block here exactly as before

-- =========================================
-- 4. SUPPLIERS
-- =========================================
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactName VARCHAR(100),
    Email VARCHAR(150)
);

INSERT INTO Suppliers VALUES
(1, 'Tech Distributors', 'Alice Johnson', 'alice@techdist.com'),
(2, 'Gadget Supplies', 'Bob Smith', 'bob@gadgetsupplies.com'),
(3, 'Office Essentials', 'Charlie Davis', 'charlie@officeessentials.com'),
(4, 'Furniture Hub', 'Diana Adams', 'diana@furniturehub.com'),
(5, 'Clothing Mart', 'Ethan Clark', 'ethan@clothingmart.com'),
(6, 'Car Parts', 'Tom Hanks', 'tom@carparts.com'),
(7, 'Toys', 'John Adams', 'john@toysff.com');

-- =========================================
-- 5. PRODUCTS
-- =========================================
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30, 1),
(2, 'Smartphone', 800.00, 'Electronics', 50, 1),
(3, 'Tablet', 400.00, 'Electronics', 40, 1),
(4, 'Monitor', 250.00, 'Electronics', 60, 1),
(5, 'Keyboard', 50.00, 'Accessories', 100, 2),
(6, 'Mouse', 30.00, 'Accessories', 120, 2),
(7, 'Chair', 150.00, 'Furniture', 80, 4),
(8, 'Desk', 200.00, 'Furniture', 75, 4),
(9, 'Pen', 5.00, 'Stationery', 300, 3),
(10, 'Notebook', 10.00, 'Stationery', 200, 3),
(11, 'Printer', 250.00, 'Electronics', 25, 1),
(12, 'Scanner', 200.00, 'Electronics', 20, 1),
(13, 'Lamp', 25.00, 'Furniture', 90, 4),
(14, 'Ruler', 5.00, 'Stationery', 400, 3),
(15, 'Calculator', 45.00, 'Electronics', 70, 1),
(16, 'Sofa', 600.00, 'Furniture', 30, 4),
(17, 'Wardrobe', 750.00, 'Furniture', 25, 4),
(18, 'T-shirt', 20.00, 'Clothing', 200, 5),
(19, 'Jeans', 40.00, 'Clothing', 150, 5),
(20, 'Jacket', 60.00, 'Clothing', 120, 5),
(21, 'Car Tire', 100.00, 'Automotive', 80, 6),
(22, 'Engine Oil', 70.00, 'Automotive', 100, 6),
(23, 'Brake Pad', 50.00, 'Automotive', 150, 6),
(24, 'Toy Car', 30.00, 'Toys', 200, 7),
(25, 'Board Game', 45.00, 'Toys', 150, 7),
(26, 'Drone', 500.00, 'Electronics', 20, 1),
(27, 'Headphones', 150.00, 'Electronics', 60, 1),
(28, 'Smartwatch', 300.00, 'Electronics', 40, 1),
(29, 'Microwave', 250.00, 'Electronics', 35, 1),
(30, 'Blender', 80.00, 'Electronics', 50, 1),
(31, 'Camera', 350.00, 'Electronics', 30, 1),
(32, 'Tripod', 100.00, 'Accessories', 70, 2),
(33, 'Stapler', 15.00, 'Stationery', 300, 3),
(34, 'Bookshelf', 180.00, 'Furniture', 25, 4),
(35, 'Desk Lamp', 40.00, 'Furniture', 90, 4),
(36, 'Mouse Pad', 10.00, 'Accessories', 200, 2),
(37, 'Keyboard Cover', 12.00, 'Accessories', 180, 2),
(38, 'Marker', 5.00, 'Stationery', 400, 3),
(39, 'Toy Robot', 80.00, 'Toys', 100, 7),
(40, 'Puzzle', 25.00, 'Toys', 150, 7);

-- =========================================
-- 6. ORDERS
-- =========================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT NULL,
    OrderDate DATE,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- (40 Orders INSERTS — paste your existing block)

-- =========================================
-- 7. PAYMENTS
-- =========================================
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NULL,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
