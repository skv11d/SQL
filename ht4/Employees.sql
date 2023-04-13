DROP DATABASE IF EXISTS MyJoinsDB;

CREATE DATABASE MyJoinsDB;

USE MyJoinsDB;

CREATE TABLE EmployeesContactsInformation
(
	EmployeeID INT AUTO_INCREMENT NOT NULL,
    FullName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    PRIMARY KEY (EmployeeID)
);

INSERT INTO EmployeesContactsInformation 
(FullName, PhoneNumber) 
VALUES 
("Іванов Владимир Іванович", "+380592574611"),
("Петров Іван Петрович", "+380980829411"),
("Горбачов Петр Олегович", "+380963317566");

CREATE TABLE EmployeesProfessionalInformation 
(	
	EmployeeID INT NOT NULL,
    Salary INT NOT NULL,
    Position VARCHAR(15) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeesContactsInformation (EmployeeID)
);

INSERT INTO EmployeesProfessionalInformation 
(EmployeeID, Salary, Position) 
VALUES 
(1, 57000, "manager"),
(2, 39000, "manager"),
(3, 83000, "director");

CREATE TABLE EmployeesFamilyInformation 
(
	EmployeeID INT NOT NULL,
    ResidencePlace VARCHAR(15) NOT NULL,
    BirthDate VARCHAR(10) NOT NULL,
    FamilyStatus VARCHAR(15) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeesContactsInformation (EmployeeID)
);

INSERT INTO EmployeesFamilyInformation
(EmployeeID, ResidencePlace, BirthDate, FamilyStatus) 
VALUES 
(1, "Nykilaev", "20.12.1998", "not married"),
(2, "Kiev", "05.05.1978", "married"),
(3, "Dnepr", "21.09.1990", "not married");

-- 1) Получите контактные данные сотрудников (номера телефонов, место жительства)
SELECT eci.PhoneNumber, efi.ResidencePlace FROM EmployeesContactsInformation eci
INNER JOIN EmployeesFamilyInformation efi ON eci.EmployeeID = efi.EmployeeID;

-- 2) Получите информацию о дате рождения всех холостых сотрудников и их номера
SELECT efi.BirthDate, eci.PhoneNumber FROM EmployeesContactsInformation eci
INNER JOIN EmployeesFamilyInformation efi ON eci.EmployeeID = efi.EmployeeID
WHERE FamilyStatus = "not married";

-- 3) Получите информацию обо всех менеджерах компании: дату рождения и номер телефона
SELECT efi.BirthDate, eci.PhoneNumber FROM EmployeesContactsInformation eci
INNER JOIN EmployeesFamilyInformation efi ON eci.EmployeeID = efi.EmployeeID
INNER JOIN EmployeesProfessionalInformation epi ON eci.EmployeeID = epi.EmployeeID
WHERE Position = "manager";