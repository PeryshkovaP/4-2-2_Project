USE heart;

CREATE TABLE IF NOT EXISTS dataset (
age int NOT NULL,
sex VARCHAR(100) NOT NULL,
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
LOAD DATA INFILE '\heart.csv'
	INTO TABLE dataset
    FIELDS TERMINATED BY ','
    IGNORE 1 LINES;
    
DROP TABLE IF EXISTS patients;
CREATE TABLE IF NOT EXISTS patients (
  age int NOT NULL,
  sex VARCHAR(100) NOT NULL
);
    
INSERT INTO patients
SELECT age, sex FROM dataset ;

ALTER TABLE patients
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

DROP TABLE IF EXISTS medicalexam;
CREATE TABLE IF NOT EXISTS medicalexam (
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
    
INSERT INTO medicalexam
SELECT ChestPainType,RestingBP,Cholesterol, FastingBS, RestingECG, MaxHR, ExerciseAngina, Oldpeak, ST_Slope, HeartDisease FROM dataset ;

ALTER TABLE medicalexam
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE medicalexam
ADD CONSTRAINT fk_medicalexam_id FOREIGN KEY (id) REFERENCES patients(id);
