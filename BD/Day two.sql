CREATE DATABASE Hospital;
USE Hospital;
CREATE TABLE patients(
patientID INT PRIMARY KEY,
PName varchar(100),
Age int);

CREATE TABLE Devices (
DeviceID INT PRIMARY KEY,
DeviceName VARCHAR(100),
AssignedTo INT unique,
foreign key (AssignedTo) references patients(patientID)
);

CREATE TABLE P_details (
P_ID INT,
S_FN VARCHAR(30),
P_LN VARCHAR(30),
P_Email VARCHAR(50),
P_Mobile CHAR(10),
P_Gender CHAR(1),
P_Fees numeric(8,2),
D_ID INT
);
ALTER TABLE P_details MODIFY column P_ID INT NOT NULL;
ALTER TABLE P_details ADD constraint P_Detail_c primary key (P_ID);

/* INSERET DATA IN TABLES*/
INSERT INTO patients (patientID, PName, Age) VALUES
(1, 'Alice Smith', 30),
(2, 'Bob Johnson', 45),
(3, 'Charlie Lee', 60); 

INSERT INTO Devices (DeviceID, DeviceName, AssignedTo) VALUES 
(101, 'Heart Monitor', 1),
(102, 'Glucose Meter', 2),
(103, 'Oximeter', 3);

INSERT INTO P_details (P_ID, S_FN, P_LN, P_Email, P_Mobile, P_Gender, P_Fees, D_ID) VALUES 
(1, 'Alice', 'Smith', 'alice@example@com', '90906270', 'F', 500.00, 101),
(2, 'Bob', 'Johnson', 'bob@example.com', '9876543211', 'M', 650.50, 102),
(3, 'Charlie', 'Lee', 'charlie@example.com', '9876543212', 'M', 400.00, 103);
 

/* CASCADE */

/*ON DELETE CASCADE*/
ALTER TABLE P_details ADD constraint fk_device_cos foreign key( D_ID) 
references Devices(DeviceID) ON DELETE CASCADE;

/* ON DELETE SET NULL*/
ALTER TABLE P_details MODIFY COLUMN D_ID INT NULL;
ALTER TABLE P_details ADD constraint FK_D_NULL FOREIGN KEY (D_ID)
 references Devices(DeviceID) ON DELETE SET NULL;
 /* 3. ON UPDATE CASCADE*/
 ALTER TABLE P_details ADD constraint fk_d_up foreign KEY(D_ID) 
 references Devices(DeviceID) ON UPDATE cascade;
 
 CREATE TABLE Patient_List (
 PatientID INT primary KEY,
 Email varchar(100)unique,
 Age INT NOT NULL,
 Gender CHAR(1),
 Fees decimal (8,2),
 CHECK (Gender IN ('M', 'F'))
 );
 
 INSERT INTO Patients VALUES (1, 'alice@example.com', 30, 'F', 200.00);
DESCRIBE Patients;
SHOW CREATE TABLE Patients;

SET FOREIGN_KEY_CHECKS = 0;

SET FOREIGN_KEY_CHECKS = 1;


SELECT * FROM information_schema.check_constraints
WHERE constraint_schema = 'Hospital';

 
 
 
 

