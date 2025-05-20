-- Create the database
CREATE DATABASE UniversityDB;
USE UniversityDB;

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Create Enrollments table (join table to model many-to-many relationship)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample students
INSERT INTO Students (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Insert sample courses
INSERT INTO Courses (CourseID, CourseName) VALUES
(101, 'Mathematics'),
(102, 'Physics'),
(103, 'Computer Science');

-- Insert sample enrollments
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 101),
(1, 102),
(2, 103),
(3, 101),
(3, 103);

-- Query: Retrieve all courses that a student (e.g., Alice) is enrolled in
SELECT 
    s.StudentName,
    c.CourseName
FROM 
    Students s
JOIN 
    Enrollments e ON s.StudentID = e.StudentID
JOIN 
    Courses c ON e.CourseID = c.CourseID
WHERE 
    s.StudentName = 'Alice';
