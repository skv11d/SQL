DROP DATABASE IF EXISTS warehouse;

CREATE DATABASE warehouse;

USE warehouse;

CREATE TABLE Suppliers 
(
	SupplierID INT AUTO_INCREMENT NOT NULL,
    CompanyName VARCHAR(15) NOT NULL,
    ContactName VARCHAR(15) NOT NULL,
    Adress VARCHAR(45) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (SupplierID)
);

CREATE TABLE Products 
(
	ProductID INT AUTO_INCREMENT NOT NULL,
    SupplierID INT NOT NULL,
    ProductName VARCHAR(15) NOT NULL, 
    PurchasePrice DOUBLE NOT NULL,
    SalePrice DOUBLE NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);

CREATE TABLE Staff 
(
	StaffID INT AUTO_INCREMENT NOT NULL,
    FullName VARCHAR(75) NOT NULL,
    Position VARCHAR(15) NOT NULL,
    Adress VARCHAR(45) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (StaffID)
);

CREATE TABLE Customers 
(
	CustomerID INT AUTO_INCREMENT NOT NULL,
    CompanyName VARCHAR(15) NOT NULL,
    ContactName VARCHAR(15) NOT NULL,
    Adress VARCHAR(45) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders 
(
	OrderID INT AUTO_INCREMENT NOT NULL,
    StaffID INT NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate VARCHAR(10) NOT NULL,
    TotalAmount DOUBLE NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
); 

CREATE TABLE OrderDetails 
(
	ProductID INT NOT NULL,
    OrderID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DOUBLE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);
