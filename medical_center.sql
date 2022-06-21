DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center


CREATE TABLE doctors 
(
    id SERIAL,
    name TEXT PRIMARY KEY,
    on_call BOOLEAN

);
CREATE TABLE diseases
(
    id SERIAL,
    name TEXT PRIMARY KEY,
    treatable BOOLEAN
);


CREATE TABLE diagnosis 
(
    id INTEGER PRIMARY KEY,
    disease_one TEXT REFERENCES diseases (name),
    disease_two TEXT REFERENCES diseases (name),
    disease_three TEXT REFERENCES diseases (name)
    
);

CREATE TABLE patients 
(
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    birth_date DATE CHECK( birth_date BETWEEN DATE '1900-01-01' AND DATE '2004-01-01')
    



);
CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_name TEXT REFERENCES doctors (name),
    patientid INTEGER REFERENCES patients (id),
    diagnosisid INTEGER REFERENCES diagnosis (id)


);

 INSERT INTO diseases (name,treatable) VALUES ('Heart Disease',false),('Cancer', true),('Obesity',true),
('Alzheimer’s Disease',false),('Diabetes',false);
INSERT INTO diseases (name) VALUES ('Healthy');

INSERT INTO doctors (id,name,on_call) VALUES (1001,'Dr. Drake Ramoray',true),(1002,'Dr. Emelia Airheart',false),
(1003,'Dr. John Carter',true);

INSERT INTO patients (id,first_name,last_name,GENDER,birth_date) VALUES (2001,'John','Smith','Male','01-03-1990'),
(2002,'Chandler', 'Bing', 'Male','1985-05-01'),(2003,'Monica', 'Gheller', 'Female','1986-01-03'),(2004,'Ross', 'Gheller','Male', '1986-01-04'),(2005,'Rachel', 'Green', 'Female','1987-11-11');



INSERT INTO diagnosis (id,disease_one) VALUES (1,'Healthy');
INSERT INTO diagnosis (id,disease_one) VALUES (3000,'Heart Disease');
INSERT INTO diagnosis (id,disease_one,disease_two) VALUES (3001,'Obesity','Cancer');
INSERT INTO diagnosis (id,disease_one,disease_two,disease_three) VALUES (3002,'Diabetes','Obesity','Alzheimer’s Disease');

INSERT INTO relation (doctor_name,patientid,diagnosisid) VALUES ('Dr. Drake Ramoray',2001,3000);
INSERT INTO relation (doctor_name,patientid,diagnosisid) VALUES ('Dr. Drake Ramoray',2002,3002);
INSERT INTO relation (doctor_name,patientid,diagnosisid) VALUES ('Dr. John Carter',2002,3002);
INSERT INTO relation (doctor_name,patientid,diagnosisid) VALUES ('Dr. Emelia Airheart',2004, 1);
INSERT INTO relation (doctor_name,patientid,diagnosisid) VALUES ('Dr. Emelia Airheart',2005,3001);
INSERT INTO relation (doctor_name,patientid,diagnosisid) VALUES ('Dr. John Carter',2003, 1);

select disease_one,treatable 
from diagnosis 
join diseases on disease_one=name 
GROUP BY disease_one,treatable;
