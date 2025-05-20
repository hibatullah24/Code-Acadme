-- Create new database
CREATE DATABASE ClinicDB;
USE ClinicDB;

-- Create Patients table
CREATE TABLE patients (
    patientID INT PRIMARY KEY,
    PName VARCHAR(100),
    Age INT
);

-- Create Devices table with one-to-one relationship
CREATE TABLE Devices (
    DeviceID INT PRIMARY KEY,
    DeviceName VARCHAR(100),
    AssignedTo INT UNIQUE,
    FOREIGN KEY (AssignedTo) REFERENCES patients(patientID)
);

-- Insert sample patients
INSERT INTO patients (patientID, PName, Age) VALUES
(1, 'Alice Smith', 30),
(2, 'Bob Johnson', 45),
(3, 'Carol Davis', 28);

-- Insert devices assigned to each patient
INSERT INTO Devices (DeviceID, DeviceName, AssignedTo) VALUES
(101, 'Heart Monitor', 1),
(102, 'ECG Machine', 2),
(103, 'Infusion Pump', 3);

-- Query to retrieve each patient and their assigned device
SELECT 
    p.patientID,
    p.PName,
    p.Age,
    d.DeviceID,
    d.DeviceName
FROM 
    patients p
JOIN 
    Devices d ON p.patientID = d.AssignedTo;

