-- DDL Generated from https:/databasediagram.com
CREATE DATABASE IF NOT EXISTS `heart` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `heart`;

CREATE TABLE IF NOT EXISTS patients (
  id integer NOT NULL PRIMARY KEY auto_increment,
  age int NOT NULL,
  sex VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS medicalexam (
id INT REFERENCES patients(id),
ChestPainType VARCHAR(100) NOT NULL,
RestingBP INT NOT NULL,
Cholesterol INT NOT NULL,
FastingBS TINYINT,
RestingECG VARCHAR(100) NOT NULL,
MaxHR INT NOT NULL,
ExerciseAngina VARCHAR(100) NOT NULL,
Oldpeak DECIMAL(10,1) NOT NULL,
ST_Slope VARCHAR(100) NOT NULL,
HeartDisease TINYINT
);

INSERT INTO patients(id, age, sex) VALUES
(1, 40, M)

INSERT INTO medicalexam(id, ChestPainType, RestingBP, Cholesterol, FastingBS, MaxHR, ExerciseAngina, Oldpeak) VALUES
(1, ATA, 140, 289, 0, Normal, 172, N, 0)

ALTER TABLE patients
    ADD CONSTRAINT patients_pk PRIMARY KEY (id);

ALTER TABLE medicalexam
    ADD CONSTRAINT medicalexam_pk PRIMARY KEY (id);

ALTER TABLE patients
    ADD CONSTRAINT fk_patients_id FOREIGN KEY (id) REFERENCES medicalexam(id);
