DROP DATABASE IF EXISTS military_unit_database; 

CREATE DATABASE military_unit_database;

USE military_unit_database;

CREATE TABLE Officers 
(
	OfficerID INT AUTO_INCREMENT NOT NULL,
    FullName VARCHAR(75) NOT NULL,
    RankName VARCHAR(15) NOT NULL,
    PRIMARY KEY (OfficerID)
);

INSERT INTO Officers (FullName, RankName) VALUES ("Михайлов Михаил Михайлович", "Майор");

CREATE TABLE Weapons 
(
	WeaponID INT AUTO_INCREMENT NOT NULL,
    WeaponName VARCHAR(15) NOT NULL,
    WeaponType VARCHAR(15) NOT NULL,
    WeaponSerialNumber INT NOT NULL,
    WhoIssuedWeaponID INT NOT NULL,
    PRIMARY KEY (WeaponID),
    FOREIGN KEY (WhoIssuedWeaponID) REFERENCES Officers (OfficerID)
);

INSERT INTO Weapons (WeaponName, WeaponType, WeaponSerialNumber, WhoIssuedWeaponID) VALUES ("Glock-18", "Pistol", 7293082, 1);
INSERT INTO Weapons (WeaponName, WeaponType, WeaponSerialNumber, WhoIssuedWeaponID) VALUES ("AK-47", "Rifle", 4701709, 1);
INSERT INTO Weapons (WeaponName, WeaponType, WeaponSerialNumber, WhoIssuedWeaponID) VALUES ("M4A1-S", "Rifle", 5469220, 1);
INSERT INTO Weapons (WeaponName, WeaponType, WeaponSerialNumber, WhoIssuedWeaponID) VALUES ("AWP", "Rifle", 8290001, 1);

CREATE TABLE Soldiers 
(
	 SoldierID INT AUTO_INCREMENT NOT NULL,
     WeaponID INT NOT NULL,
     FullName VARCHAR(75) NOT NULL,
     RankName VARCHAR(15) NOT NULL,
     Office INT NOT NULL,
     Platoon INT NOT NULL,
     PRIMARY KEY (SoldierID),
     FOREIGN KEY (WeaponID) REFERENCES Weapons (WeaponID)
);

INSERT INTO Soldiers (WeaponID, FullName, RankName, Office, Platoon) VALUES (1, "Петров Владимир Николаевич", "Рядовой", 205, 222);
INSERT INTO Soldiers (WeaponID, FullName, RankName, Office, Platoon) VALUES (2, "Лодарев Виталий Денисович", "Рядовой", 205, 222);
INSERT INTO Soldiers (WeaponID, FullName, RankName, Office, Platoon) VALUES (3, "Духов Роман Олегович", "Праворщик", 201, 200);

SELECT * FROM Weapons;
SELECT * FROM Soldiers;
SELECT * FROM Officers;

