IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'B10Subquery')
	DROP DATABASE B10Subquery
GO

CREATE DATABASE B10Subquery
GO

USE B10Subquery
GO

CREATE TABLE Student(
	SID INT PRIMARY KEY,
	S_FName VARCHAR(20) NOT NULL,
	S_LName VARCHAR(30) NOT NULL
)
GO

CREATE TABLE Course(
	CID INT PRIMARY KEY,
	C_Name VARCHAR(30) NOT NULL,
)
GO

CREATE TABLE Course_Grades(
	CGID INT PRIMARY KEY,
	Semester CHAR(4) NOT NULL,
	CID_CG	INT NOT NULL,
	SID_CG INT NOT NULL,
	Grade CHAR(2) NOT NULL,
	CONSTRAINT CID_CG_FK FOREIGN KEY (CID_CG) REFERENCES Course(CID) ON DELETE CASCADE,
	CONSTRAINT SID_CG_FK FOREIGN KEY (SID_CG) REFERENCES Student(SID) ON DELETE CASCADE
)
GO

INSERT INTO Student (SID, S_FName, S_LName) VALUES (12345, 'Chris', 'Rock');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (23456, 'Chris', 'Farley');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (34567, 'David', 'Spade');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (45678, 'Liz', 'Lemon');
INSERT INTO Student (SID, S_FName, S_LName) VALUES (56789, 'Jack', 'Donaghy');
GO

INSERT INTO Course (CID, C_Name) VALUES (101001, 'Intro to Computers');
INSERT INTO Course (CID, C_Name) VALUES (101002, 'Programming');
INSERT INTO Course (CID, C_Name) VALUES (101003, 'Databases');
INSERT INTO Course (CID, C_Name) VALUES (101004, 'Websites');
INSERT INTO Course (CID, C_Name) VALUES (101005, 'IS Management');
GO

INSERT INTO Course_Grades (CGID, Semester, CID_CG, SID_CG, Grade) VALUES (2010101,
'SP10', 101005, 34567, 'D+');
INSERT INTO Course_Grades (CGID, Semester, CID_CG, SID_CG, Grade) VALUES (2010308,
'FA10', 101005, 34567, 'A-');
INSERT INTO Course_Grades (CGID, Semester, CID_CG, SID_CG, Grade) VALUES (2010309,
'FA10', 101001, 45678, 'B+');
INSERT INTO Course_Grades (CGID, Semester, CID_CG, SID_CG, Grade) VALUES (2011308,
'FA11', 101003, 23456, 'B-');
INSERT INTO Course_Grades (CGID, Semester, CID_CG, SID_CG, Grade) VALUES (2012206,
'SU12', 101002, 56789, 'A+');
GO

ALTER TABLE Student
ALTER COLUMN S_FName VARCHAR(30) NOT NULL;
GO

ALTER TABLE Course
ADD Faculty_LName VARCHAR(30) DEFAULT 'TBD' NOT NULL;
GO

UPDATE Course
SET Faculty_LName= 'Potter', C_Name= 'Intro to Wizardry'
WHERE CID = 101001;
go

EXEC sp_rename 'Course.C_Name', 'Course_Name'
GO

DELETE FROM Course
	WHERE CID = 101004
GO

DELETE FROM Course
	WHERE Course_Name = 'Websites'
GO

--Khong xoa duoc table Student
DROP TABLE Student
GO

--Khong xoa duoc table Student
TRUNCATE TABLE Course
GO

ALTER TABLE Course_Grades DROP CONSTRAINT CID_CG_fk
GO

ALTER TABLE Course_Grades 
	ADD CONSTRAINT CID_CG_FK FOREIGN KEY (CID_CG) REFERENCES Course(CID) ON DELETE CASCADE
GO


--Lay ra sinh vien co diem cao nhat
SELECT S_FName, S_LName, Grade
FROM (
SELECT S_FName, S_LName, Grade
FROM Student s
INNER JOIN Course_Grades cg ON s.SID = cg.SID_CG
) b1
INNER JOIN (
SELECT MIN(Grade) Min_Grade
FROM Course_Grades C
)b2 ON b1.Grade = b2.Min_Grade

GO

SELECT * FROM Student s
INNER JOIN Course_Grades cg ON s.SID = cg.SID_CG
WHERE Grade = (SELECT MIN(Grade) FROM Course_Grades)
GO

SELECT S_FName, S_LName, Semester, Grade, Faculty_LName 
FROM Student
JOIN Course_Grades ON SID = SID_CG
JOIN Course ON CID = CID_CG
GO

SELECT S_FName, S_LName
FROM Student
JOIN Course_Grades ON SID = SID_CG
JOIN Course ON CID = CID_CG
WHERE Faculty_LName = 'iYer'
GO

SELECT S_FName, S_LName, Grade
FROM Student
JOIN Course_Grades ON SID = SID_CG
WHERE Grade >= 'C'
GO

-- Hien thi diem trung binh cua sinh vien(chua hoan thanh)
SELECT S_FName, S_LName, AVG(Grade)
FROM Student
JOIN (
	SELECT AVG(Grade)
	FROM Course_Grades
	GROUP BY SID_CG
	)
GO

SELECT S_FName, S_LName,  IntGrade
	FROM Course_Grades
GO



