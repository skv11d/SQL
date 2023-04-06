DROP DATABASE IF EXISTS carsdatabase;

CREATE DATABASE carsdatabase;

USE carsdatabase;

DROP TABLE IF EXISTS cars;

CREATE TABLE cars
(

	id int AUTO_INCREMENT NOT NULL,
    mark VARCHAR(10) NOT NULL,
    model VARCHAR(10) NOT NULL,
    engine double NOT NULL,
    price int NOT NULL,
    speed int NOT NULL,
    PRIMARY KEY (id)
    
);

INSERT INTO cars (mark, model, engine, price, speed) VALUES ("BMW", "M5", 3.5, 78000, 220);
INSERT INTO cars (mark, model, engine, price, speed) VALUES ("AUDI", "RS6", 3.0, 56000, 210);
