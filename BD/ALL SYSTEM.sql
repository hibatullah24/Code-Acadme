
CREATE database ttm;
USE TTM;
-- COLLEGE
CREATE TABLE COLLEGE (
  Cl_Code CHAR(3) PRIMARY KEY,
  Cl_Name VARCHAR(40) NOT NULL,
  Cl_Dean VARCHAR(30)
);

-- DEPARTMENT
CREATE TABLE DEPARTMENT (
  Dp_Code CHAR(4) PRIMARY KEY,
  Dp_Name VARCHAR(40) NOT NULL,
  Dp_Col CHAR(3),
  Dp_HoD VARCHAR(30),
  FOREIGN KEY (Dp_Col) REFERENCES COLLEGE(Cl_Code)
);

-- COURSE
CREATE TABLE COURSE (
  Cr_Code CHAR(8) PRIMARY KEY,
  Cr_Title VARCHAR(40) NOT NULL,
  Cr_CH TINYINT UNSIGNED NOT NULL CHECK (Cr_CH > 0),
  Cr_NSec TINYINT UNSIGNED NOT NULL CHECK (Cr_NSec > 0),
  Cr_Dept CHAR(4),
  FOREIGN KEY (Cr_Dept) REFERENCES DEPARTMENT(Dp_Code)
);

-- BOOK
CREATE TABLE BOOK (
  Bk_ID INT PRIMARY KEY CHECK (Bk_ID > 0),
  Bk_Title VARCHAR(50) NOT NULL,
  Bk_Edition TINYINT,
  Bk_ofPages INT CHECK (Bk_ofPages > 0),
  Bk_TotalCopies INT,
  Bk_RemCopies INT
);

-- BOOKTOPIC
CREATE TABLE BOOKTOPIC (
  Tp_BkID INT,
  Tp_Desc VARCHAR(30) NOT NULL,
  FOREIGN KEY (Tp_BkID) REFERENCES BOOK(Bk_ID)
);

-- BORROWER
CREATE TABLE BORROWER (
  Br_ID INT PRIMARY KEY CHECK (Br_ID > 0),
  Br_Name VARCHAR(30) NOT NULL,
  Br_Dept CHAR(4),
  Br_Mobile CHAR(8) CHECK (Br_Mobile >= '90000000'),
  Br_City VARCHAR(20),
  Br_House CHAR(4),
  Br_Type CHAR(1) CHECK (Br_Type IN ('S', 'E')),
  FOREIGN KEY (Br_Dept) REFERENCES DEPARTMENT(Dp_Code)
);

-- STUDENT
CREATE TABLE STUDENT (
  St_ID INT PRIMARY KEY,
  St_Major VARCHAR(30),
  St_Cohort INT NOT NULL
);

-- EMPLOYEE
CREATE TABLE EMPLOYEE (
  Em_ID INT PRIMARY KEY,
  Em_Office CHAR(4) NOT NULL,
  Em_Ext INT CHECK (Em_Ext > 1000)
);

-- REGISTRATION
CREATE TABLE REGISTRATION (
  Re_BrID INT,
  Re_CrCode CHAR(8),
  Re_Semester CHAR(6) NOT NULL,
  FOREIGN KEY (Re_BrID) REFERENCES BORROWER(Br_ID),
  FOREIGN KEY (Re_CrCode) REFERENCES COURSE(Cr_Code)
);

-- LINK
CREATE TABLE LINK (
  Li_CrCode CHAR(8),
  Li_BkID INT,
  Li_usage CHAR(1) CHECK (Li_usage IN ('T', 'R')),
  FOREIGN KEY (Li_CrCode) REFERENCES COURSE(Cr_Code),
  FOREIGN KEY (Li_BkID) REFERENCES BOOK(Bk_ID)
);

-- ISSUING
CREATE TABLE ISSUING (
  Is_BrID INT,
  Is_BkID INT,
  Is_DateTaken DATE NOT NULL,
  Is_DateReturn DATE,
  FOREIGN KEY (Is_BrID) REFERENCES BORROWER(Br_ID),
  FOREIGN KEY (Is_BkID) REFERENCES BOOK(Bk_ID),
  CHECK (Is_DateReturn IS NULL OR Is_DateReturn > Is_DateTaken)
);
INSERT INTO COLLEGE VALUES 
('COM', 'Economy', 'Prof. Fahim'),
('SCI', 'Science', 'Prof. Salma'),
('EDU', 'Education', 'Dr. Hamad'),
('ART', 'Arts', 'Dr. Abdullah');

-- Insert departments only if they don't exist (using INSERT IGNORE)
INSERT IGNORE INTO DEPARTMENT (Dp_Code, Dp_Name) VALUES
  ('COMP', 'Computer Science'),
  ('BIOL', 'Biology'),
  ('CHEM', 'Chemistry');
  

-- Now insert courses (assuming departments are present)
INSERT INTO COURSE (Cr_Code, Cr_Title, Cr_CH, Cr_NSec, Cr_Dept) VALUES
  ('COMP4201', 'Database1', 3, 1, 'COMP'),
  ('COMP4202', 'Database2', 3, 2, 'COMP'),
  ('BIOL1000', 'Intro. To Biology', 4, 5, 'BIOL'),
  ('CHEM2000', 'Advanced Chemistry', 2, 2, 'CHEM');



INSERT INTO COURSE VALUES
('COMP4201', 'Database1', 3, 1, 'COMP'),
('COMP4202', 'Database2', 3, 2, 'COMP'),
('BIOL1000', 'Intro. To Biology', 4, 5, 'BIOL'),
('CHEM2000', 'Advanced Chemistry', 2, 2, 'CHEM');

select * FROM course;

INSERT INTO BOOK VALUES
(1001, 'Database1', 2, 450, 150, 65),
(1002, 'Database2', 3, 300, 100, 100),
(2001, 'Intro. to Finanace', 1, 600, 75, 40),
(3001, 'Basic Op Mgmt', 1, 320, 100, 77),
(3002, 'Chemistry Book', 2, 500, 100, 80),
(4001, 'Biology', 1, 345, 100, 100),
(3003, 'Management I', 2, 560, 44, 34),
(1003, 'Java Prog.', 3, 555, 50, 50);
select * FROM BOOK;


INSERT INTO BOOKTOPIC VALUES
(1001, 'Basic DB Skills'),
(1001, 'ERD'),
(1001, 'EERD'),
(1002, 'SQL'),
(1002, 'Pl/SQL'),
(3001, 'Management Skills');
select * FROM BOOKTOPIC;


INSERT INTO BORROWER VALUES
(92120, 'Ali', 'INFS', '99221133', 'Seeb', '231', 'S'),
(10021, 'Said', 'INFS', '91212129', 'Seeb', '100', 'S'),
(10023, 'Muna', 'FINA', NULL, 'Barka', '12', 'S'),
(3000, 'Mohammed', 'COMP', '90000009', 'Seeb', '777', 'E'),
(4000, 'Nasser', 'INFS', '99100199', 'Sur', '11', 'E');

select * FROM BORROWER;


INSERT INTO STUDENT VALUES
(92120, 'INFS', 2012),
(10021, 'INFS', 2015),
(10023, 'FINA', 2015);
select * FROM STUDENT;

INSERT INTO EMPLOYEE VALUES
(3000, '12', 2221),
(4000, '15', 1401);
select * FROM EMPLOYEE;

INSERT INTO REGISTRATION VALUES
(92120, 'COMP4201', 'FL2015'),
(10021, 'COMP4202', 'FL2015'),
(92120, 'BIOL1000', 'FL2015'),
(92120, 'COMP4202', 'FL2016'),
(10021, 'CHEM2000', 'FL2016');
select * FROM REGISTRATION;
INSERT INTO LINK VALUES
('COMP4201', 1001, 'T'),
('COMP4201', 1002, 'R'),
('COMP4202', 1002, 'T'),
('BIOL1000', 4001, 'T'),
('CHEM2000', 3002, 'R');
select * FROM LINK;

INSERT INTO ISSUING VALUES
(92120, 1001, '2015-09-01', '2015-10-30'),
(10021, 1002, '2016-10-30', NULL),
(92120, 1002, '2015-02-21', '2016-01-01'),
(92120, 3002, '2016-03-30', NULL),
(10021, 3002, '2014-12-01', NULL);
select * FROM ISSUING;

SELECT BR_Name, DP_Name 
FROM BORROWER JOIN department ON(Dp_Code = Br_Dept);

/*show all departments and the number of courses offered by each*/
SELECT D.Dp_Code, D.Dp_Name, COUNT(C.Cr_Code) AS NumberOfCourses FROM DEPARTMENT D
LEFT JOIN COURSE C ON D.Dp_Code = C.Cr_Dept GROUP BY  D.Dp_Code, D.Dp_Name
ORDER BY D.Dp_Code;


