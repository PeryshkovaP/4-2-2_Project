-- DDL Generated from https:/databasediagram.com
CREATE DATABASE IF NOT EXISTS `heart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `heart`;

CREATE TABLE patients (
  id integer NOT NULL PRIMARY KEY auto_increment,
  age int NOT NULL,
  sex VARCHAR(100) NOT NULL
);

CREATE TABLE medicalexam (
id INT REFERENCES patients(id),
ChestPainType VARCHAR(100) NOT NULL,
RestingBP INT NOT NULL,
Cholesterol INT NOT NULL,
FastingBS TINYINT,
RestingECG VARCHAR(100) NOT NULL,
MaxHR INT NOT NULL,
ExerciseAngina VARCHAR(100) NOT NULL,
Oldpeak DECIMAL(10,1) NOT NULL
);
