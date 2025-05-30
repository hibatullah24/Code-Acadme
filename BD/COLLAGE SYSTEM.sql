CREATE database TMS;
USE TMS;
CREATE TABLE STUDENT(
St_ID NUMERIC(6) NOT NULL PRIMARY KEY,
St_Major VARCHAR(30),
St_Cohort NUMERIC(4) NOT NULL);

CREATE TABLE EMPLOYEE(
Em_ID INT UNSIGNED NOT NULL PRIMARY KEY,
Em_Office VARCHAR(4) NOT NULL,
Em_Ext SMALLINT UNSIGNED NOT NULL CHECK (Em_Ext > 1000)
);

CREATE TABLE COLLAGE(
Em_ID VARCHAR(3) PRIMARY KEY,
CI_Name VARCHAR(40) NOT NULL,
CI_Dean VARCHAR(30)
);

CREATE TABLE DEPARTMENT(
Dp_Code VARCHAR(4) PRIMARY KEY,
Dp_Name VARCHAR(40) NOT NULL,
Dp_HoD VARCHAR(30),
Dp_Col VARCHAR (3)NOT NULL,
foreign key (Dp_Col) references COLLAGE(Em_ID)
);

CREATE TABLE BORROWER(
Br_ID NUMERIC(6) UNSIGNED NOT NULL PRIMARY KEY,
Br_Name VARCHAR(30) NOT NULL,
Br_Dept VARCHAR(4),
Br_Mobile VARCHAR(8),
Br_City VARCHAR(20),
Br_House VARCHAR(4),
Br_Type VARCHAR(1) NOT NULL CHECK(Br_Type IN ('S', 'E')),
foreign key (Br_Dept) references DEPARTMENT (Dp_Code)
);


CREATE TABLE BOOK(
BK_ID NUMERIC (6) unsigned primary KEY,
BK_Title VARCHAR(50) NOT NULL,
BK_Edition NUMERIC(2),
Bk_NumPages SMALLINT UNSIGNED NOT NULL CHECK (Bk_NumPages > 0),
BK_TotleCopies NUMERIC(5),
BK_RemCopies NUMERIC(5)
);

CREATE TABLE BOOKTOPIC (
    Tp_BKID DECIMAL(6,0) UNSIGNED NOT NULL,
    Tp_Desc VARCHAR(30) NOT NULL,
    FOREIGN KEY (Tp_BKID) REFERENCES BOOK(BK_ID)
);

CREATE TABLE COURSE(
Cr_Code VARCHAR(8) NOT NULL PRIMARY KEY,
Cr_Title VARCHAR(40) NOT NULL,
Cr_CH TINYINT unsigned NOT NULL CHECK (Cr_CH >0),
Cr_NSec TINYINT unsigned NOT NULL CHECK (Cr_NSec>0),
Cr_Dept VARCHAR(4) NOT NULL,
FOREIGN KEY (Cr_Dept) REFERENCES DEPARTMENT(Dp_Code)
);
CREATE TABLE LINK(
Li_CrCode VARCHAR(8) NOT NULL,
Li_BKID numeric(6) NOT NULL,
Li_usage CHAR(1) NOT NULL CHECK (Li_usage IN ('T', 'R')),
FOREIGN KEY (Li_CrCode) REFERENCES Course(Cr_Code),
FOREIGN KEY (Li_BkID) REFERENCES Book(BK_ID)
);

CREATE TABLE REGISTRATION(
Re_BrID numeric(6, 0) unsigned NOT NULL,
Re_CrCode VARCHAR(8) NOT NULL,
Re_Semester VARCHAR(6) NOT NULL,
FOREIGN KEY (Re_BrID) REFERENCES BORROWER(Br_ID),
FOREIGN KEY (Re_CrCode) REFERENCES COURSE(Cr_Code )
);

CREATE TABLE ISSUING(
is_BrID numeric(6) NOT NULL,
is_BKID numeric(6) NOT NULL,
is_DateTaken DATE NOT NULL,
is_DateReturn DATE,
FOREIGN KEY (is_BrID) REFERENCES Borrower(Br_ID),
FOREIGN KEY (is_BkID) REFERENCES Book(BK_ID),
CHECK (is_DateReturn > is_DateTaken)
);

insert INTO STUDENT(St_ID , St_Major, St_Cohort) VALUES 
(100001, 'Computer Science', 2023),
(100002, 'Business Administration', 2022),
(100003, 'Mechanical Engineering', 2024),
(100004, 'Psychology', 2023),
(100005, 'Information Technology', 2022);

UPDATE STUDENT
SET St_Major = 'Finance'
WHERE St_ID = 100002;

UPDATE STUDENT
SET St_Cohort = 2023
WHERE St_ID = 100005;


INSERT INTO COLLAGE (Em_ID, CI_Name, CI_Dean) VALUES
('COM', 'Economy', 'Prof. Fahim'),
('SCI', 'Science', 'Prof. Salma'),
('EDU', 'Education', 'Dr. Hamad'),
('ART', 'Arts', 'Dr. Abdullah');


INSERT INTO DEPARTMENT (Dp_Code, Dp_Name, Dp_Col, Dp_HoD) VALUES
('INFS', 'Information Systems', 'COM', 'Dr. Kamla'),
('FINA', 'Finance', 'COM', 'Dr. Salim'),
('COMP', 'Computer Science', 'SCI', 'Dr. Zuhoor'),
('BIOL', 'Biology', 'SCI', 'Dr. Othman'),
('HIST', 'History', 'EDU', 'Dr. Said');

ALTER TABLE EMPLOYEE
ADD COLUMN Salary DECIMAL(8,2) CHECK (Salary > 0);
INSERT INTO EMPLOYEE (Em_ID, Em_Office, Em_Ext, Salary) VALUES
(101, 'A101', 1500, 2500.00),
(102, 'A102', 1600, 3200.00),
(103, 'B201', 1700, 2800.00),
(104, 'C305', 1800, 3500.00),
(105, 'D410', 1900, 4000.00);

SELECT *FROM EMPLOYEE;
UPDATE EMPLOYEE SET SALARY = SALARY -1000 WHERE Em_ID = 105;
SELECT * FROM EMPLOYEE;


INSERT INTO BOOK (Bk_ID, Bk_Title, Bk_Edition, Bk_NumPages, BK_TotleCopies, BK_RemCopies) VALUES
(1001, 'Database1', 2, 450, 150, 65),
(1002, 'Database2', 3, 300, 100, 100),
(2001, 'Intro. to Finanace', 1, 600, 75, 40),
(3001, 'Basic Op Mgmt', 1, 320, 100, 77),
(3002, 'Chemistry Book', 2, 500, 100, 80),
(4001, 'Biology', 1, 345, 100, 100),
(3003, 'Management I', 2, 560, 44, 34),
(1003, 'Java Prog.', 3, 555, 50, 50);

SELECT * FROM BOOK;

UPDATE BOOK JOIN ( SELECT BK_TotleCopies FROM BOOK WHERE BK_ID = 1001) AS TEMP 
SET BOOK.BK_TotleCopies = TEMP.BK_TotleCopies WHERE BOOK.BK_ID = 3002; 
SELECT * FROM STUDENT;
INSERT INTO STUDENT (St_ID, St_Major, St_Cohort) VALUES
(100006, 'Data Science', 2024),
(100007, 'Business Administration', 2023),
(100008, 'Civil Engineering', 2025),
(100009, 'Economics', 2024),
(100010, 'Software Engineering', 2023),
(100011, 'Artificial Intelligence', 2025),
(100012, 'Cyber Security', 2024),
(100013, 'Design', 2025),
(100014, 'Physics', 2024),
(100015, 'AI and Robotics', 2025);

SELECT * FROM STUDENT;
DELETE FROM STUDENT
WHERE St_ID = 100010;

SELECT * FROM STUDENT;

SELECT St_Major FROM STUDENT;
SELECT * FROM BOOK;
SELECT BK_Title AS 'BOOK TITLE', BK_ID FROM BOOK;


 SELECT * FROM EMPLOYEE;
 SELECT Em_ID, Salary*3+1 AS 'Salary' FROM EMPLOYEE;
 
 SELECT distinct St_Cohort FROM STUDENT;
 
 SELECT *FROM BOOK ;
 SELECT * FROM BOOK LIMIT 3;
SELECT * FROM STUDENT
WHERE St_ID > ANY (SELECT St_ID FROM STUDENT WHERE St_ID BETWEEN 100011 AND 100014);

SELECT * FROM STUDENT
WHERE St_ID < ALL (SELECT St_ID FROM STUDENT WHERE St_ID BETWEEN 100008 AND 100012);

SELECT * FROM BOOK
WHERE BK_Title LIKE'_a%';


SELECT * FROM BOOK
WHERE BK_Title NOT LIKE'_a%';

SELECT *FROM STUDENT
WHERE St_ID IN(100011, 100015, 100001, 100005);

SELECT *FROM STUDENT
WHERE St_ID NOT IN(100011, 100015, 100001, 100005);

SELECT *FROM STUDENT
WHERE St_ID BETWEEN 100007 AND 100014;

SELECT * FROM DEPARTMENT
ORDER BY Dp_Code ASC, Dp_Name DESC;

USE tms;

INSERT INTO BOOKTOPIC (Tp_BKID, Tp_Desc) VALUES
(1001, 'Database Systems'),
(1002, 'Advanced Databases'),
(2001, 'Finance Basics'),
(3001, 'Operations Management'),
(3002, 'Organic Chemistry'),
(1001, 'Basic DB Skills'),
(1001, 'ERD'),
(1001, 'EERD'),
(1002, 'SQL'),
(1002, 'Pl/SQL'),
(3001, 'Management Skills');


SELECT * FROM BOOKTOPIC;
SELECT * FROM BOOK;

USE BORROWER;


/*ORDEAR */
SELECT B.BK_Title, BT.Tp_Desc
FROM BOOK B, BOOKTOPIC BT
WHERE B.BK_ID = BT.Tp_BKID
ORDER BY B.BK_Title;





SET @TP_ID =1;
select  @TP_ID;




