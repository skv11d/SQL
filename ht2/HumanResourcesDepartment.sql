DROP DATABASE IF EXISTS humanresourcesdepartment;

CREATE DATABASE humanresourcesdepartment;

USE humanresourcesdepartment;

-- Таблица "Сотрудники"
CREATE TABLE Employees
(
	EmployeeID INT AUTO_INCREMENT NOT NULL,
    LastName VARCHAR(15) NOT NULL,
    FirstName VARCHAR(15) NOT NULL,
    MiddleName VARCHAR(15) NOT NULL,
    DateOfBirth VARCHAR(10) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Adress VARCHAR(45) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Position VARCHAR(15) NOT NULL,
    HireDate VARCHAR(10) NOT NULL,
    Salary INT NOT NULL,
    PRIMARY KEY (EmployeeID)
);

-- Таблица "Отделы"
CREATE TABLE Departments 
(
	DepartmentID INT AUTO_INCREMENT NOT NULL,
    DepartmentName VARCHAR(35) NOT NULL,
    PRIMARY KEY (DepartmentID)
);

-- Таблица "Подразделения"
CREATE TABLE Divisions
(
	DivisionID INT AUTO_INCREMENT NOT NULL,
    DivisionName VARCHAR(35) NOT NULL,
    PRIMARY KEY (DivisionID)
);

-- Таблица "Должности"
CREATE TABLE Positions 
(
	PositionID INT AUTO_INCREMENT NOT NULL,
    PositionName VARCHAR(35) NOT NULL,
    PRIMARY KEY (PositionID)
);

-- Таблица "Сотрудники в отделах"
CREATE TABLE EmployeesDepartments 
(
	EmployeeID INT NOT NULL,
    DepartmentID INT NOT NULL,
    StartDate VARCHAR(10) NOT NULL,
    EndDate VARCHAR(10) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID)
);

-- Таблица "Сотрудники в подразделениях"
CREATE TABLE EmployeesDivisions 
(
		EmployeeID INT NOT NULL,
        DivisionID INT NOT NULL,
        StartDate VARCHAR(10) NOT NULL,
		EndDate VARCHAR(10) NOT NULL,
        FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
        FOREIGN KEY (DivisionID) REFERENCES Divisions (DivisionID)
);

-- Таблица "История изменения должностей сотрудников"
CREATE TABLE EmployeePositionsHistory
(
	EmployeeID INT NOT NULL,
    PositionID INT NOT NULL,
	StartDate VARCHAR(10) NOT NULL,
	EndDate VARCHAR(10) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Positions (PositionID)
);
