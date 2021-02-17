CREATE TABLE subject (
 code char(4) PRIMARY KEY,
 description char(25)
)ENGINE = Innodb;

CREATE TABLE city (
 postal_code char(5) PRIMARY KEY,
 city varchar(60)
)Engine=InnoDB;

CREATE TABLE student (
 reg int PRIMARY KEY AUTO_INCREMENT,
 dni char(9) UNIQUE,
 name varchar(60) NOT NULL,
 birthdate date NOT NULL,
 street varchar(60),
 number integer UNSIGNED,
 age integer UNSIGNED, 
 postal_code char(5),
 FOREIGN KEY (postal_code) REFERENCES city(postal_code)
)ENGINE = Innodb;

CREATE TABLE studentphone (
 phone char(9) PRIMARY KEY,
 reg int NOT NULL,
 FOREIGN KEY (reg) REFERENCES student(reg)
)ENGINE = Innodb;

CREATE TABLE enroll (
 reg int,
 subject_code char(4),
 mark float(3,1) UNSIGNED,
 PRIMARY KEY (reg, subject_code),
 FOREIGN KEY (reg) REFERENCES student(reg),
 FOREIGN KEY (subject_code) REFERENCES subject(code)
)ENGINE = Innodb;
