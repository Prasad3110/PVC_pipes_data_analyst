-- Create the database
CREATE DATABASE Raksha_pipes;

-- Use the database
USE Raksha_pipes;

-- Create the Customers table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    FirstName VARCHAR(150),
    LastName VARCHAR(150),
    City VARCHAR(150),
    State VARCHAR(25),
    Country VARCHAR(25)
);

-- Create the Categories table
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Category VARCHAR(150)
);

-- Create the Shippers table
CREATE TABLE Shippers (
    Shipper_ID INT PRIMARY KEY,
    Shipper VARCHAR(150)
);

-- Create the Suppliers table
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY,
    CompanyName VARCHAR(150),
    SupplierName VARCHAR(255)  
);

-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentMethod VARCHAR(150)
);

-- Create the Products table
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product VARCHAR(150),
    Brand VARCHAR(150),
    Sale_Price INT,
    Category_ID INT,
    Supplier_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
);

-- Create the Orders table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Payment_ID INT,
    Order_Date DATE,
    Shipper_ID INT,
    Delivery_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payments(PaymentID), 
    FOREIGN KEY (Shipper_ID) REFERENCES Shippers(Shipper_ID)
);

-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Supplier_ID INT,
    UnitPrice INT,
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);


