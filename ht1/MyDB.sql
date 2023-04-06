DROP DATABASE IF EXISTS MyDB;

CREATE DATABASE MyDB;

USE MyDB;

DROP TABLE IF EXISTS name_tel;

CREATE TABLE name_tel 
(
	
    name VARCHAR(30),
	tel int NOT NULL
    
);

INSERT INTO name_tel (name, tel) VALUES ("Maksym", 438798426920);
INSERT INTO name_tel (name, tel) VALUES ("Alex", 987987948610);

DROP TABLE IF EXISTS salary_position;

CREATE TABLE salary_position 
(

	salary int NOT NULL,
    position VARCHAR(30)
    
);

INSERT INTO salary_position (salary, position) VALUES (35000, "Java Developer");
INSERT INTO salary_position (salary, position) VALUES (9000, "PM");

DROP TABLE IF EXISTS life;

CREATE TABLE life 
(

	id int AUTO_INCREMENT NOT NULL,
    family_satus VARCHAR(10),
    dob VARCHAR(10),
    place VARCHAR(30)
    
);

INSERT INTO life (id, family_status, dob, place) VALUES ("not married", "20.12.2006", "Nikolaev");
INSERT INTO life (id, family_status, dob, place) VALUES ("married", "13.11.1999", "Kiev");


SELECT*FROM mydb.salary_position
WHERE salary > 10000;

UPDATE life
SET famaly_status = "married"
WHERE id = 1;



