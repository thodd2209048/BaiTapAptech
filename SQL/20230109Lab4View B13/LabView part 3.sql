IF EXISTS (SELECT * FROM sys.databases WHERE name = 'B13_Student')
    DROP DATABASE B13_Student
GO

CREATE DATABASE B13_Student
GO

USE B13_Student
GO

CREATE TABLE Class (
	ClassCode varchar(10) PRIMARY KEY,
	HeadTeacher varchar(30),
	Room varchar(30),
	TimeSlot char CHECK(TimeSlot IN ('G', 'I', 'L', 'M')),
	CloseDate date
);
GO

CREATE TABLE Student (
	RollNo varchar(10) PRIMARY KEY,
	ClassCode varchar(10) NOT NULL,
	FullName varchar(30) NOT NULL,
	Male bit NOT NULL,
	BirthDate date NOT NULL,
	Address varchar(30) NOT NULL,
	Province char(2) NOT NULL,
	Email varchar(30) NOT NULL
)
GO

ALTER TABLE Student
	ADD CONSTRAINT FK_ClassCode FOREIGN KEY (ClassCode) REFERENCES Class(ClassCode)
GO

CREATE TABLE Subject (
  SubjectCode varchar(10) PRIMARY KEY,
  SubjectName varchar(40) NOT NULL,
  WMark bit NOT NULL,
  PMark bit NOT NULL,
  WTest_per int NOT NULL,
  PTest_per int NOT NULL
)
GO

CREATE TABLE Mark (
	RollNo varchar(10) NOT NULL,
	SubjectCode varchar(10) NOT NULL,
	WMark float NOT NULL,
	PMark float NOT NULL,
	Mark float NOT NULL,
)
GO


ALTER TABLE Mark
ADD CONSTRAINT PK_Mark PRIMARY KEY (RollNo, SubjectCode),
	CONSTRAINT FK_RollNo FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
	CONSTRAINT FK_SubCode FOREIGN KEY (SubjectCode) REFERENCES Subject(SubjectCode)
GO

--Chen it nhat 5 ban ghi cho tung bang o tren.
INSERT INTO Class (ClassCode, HeadTeacher, Room, TimeSlot, CloseDate)
VALUES
('101', 'Anna Brown', 'A101', 'I', '2022-12-31'),
('102', 'Robert Smith', 'B102', 'L', '2022-12-31'),
('103', 'Michael Wilson', 'C103', 'M', '2022-12-31'),
('104', 'Elizabeth Davis', 'D104', 'G', '2022-12-31'),
('105', 'William Anderson', 'E105', 'I', '2022-12-31');
GO


INSERT INTO Student (RollNo, ClassCode, FullName, Male, BirthDate, Address, Province, Email)
VALUES
('S001', '101', 'Emily Brown', 0, '1999-06-01', '12 Main St', 'ON', 'emily.brown@email.com'),
('S002', '102', 'Michael Smith', 1, '1998-05-02', '34 Park Ave', 'ON', 'michael.smith@email.com'),
('S003', '104', 'Sarah Johnson', 0, '1997-04-03', '56 Queen St', 'BC', 'sarah.johnson@email.com'),
('S004', '104', 'William Davis', 1, '1996-03-04', '78 King St', 'BC', 'william.davis@email.com'),
('S005', '105', 'Amanda Wilson', 0, '1995-02-05', '90 Oak St', 'AB', 'amanda.wilson@email.com');
GO

INSERT INTO Subject (SubjectCode, SubjectName, WMark, PMark, WTest_per, PTest_per)
VALUES
('MA101', 'Calculus', 1, 1, 1, 2),
('CS201', 'Data Structures', 1, 1, 1, 2),
('PHY301', 'Classical Mechanics', 1, 1, 1, 1),
('CHE401', 'Organic Chemistry', 1, 1, 2, 1),
('BIO501', 'Ecology', 1, 1, 1, 1);
GO

INSERT INTO Mark (RollNo, SubjectCode, WMark, PMark)
VALUES
('S001', 'MA101', 7.5, 8.0),
('S002', 'CS201', 8.0, 8.5),
('S003', 'PHY301', 9.0, 9.5),
('S001', 'CHE401', 7.0, 7.5),
('S005', 'BIO501', 6.5, 7.0);
GO

--Tao mot khung nhin chua danh sach cac sinh vien da co it nhat 2 bai thi (2 mon hoc khac nhau).
CREATE VIEW StudentsWithMultipleExams AS
SELECT s.RollNo, FullName, COUNT(SubjectCode) AS Number_of_Exams
FROM Student s
JOIN Mark m ON s.RollNo = m.RollNo
GROUP BY s.RollNo, FullName
HAVING COUNT(SubjectCode) >=2
GO

--Tao mot khung nhin chua danh sach tat ca cac sinh vien da bi truot it nhat la mot mon.
CREATE VIEW StudentsFailExam AS
SELECT s.RollNo, FullName, WMark, PMark
FROM Student s
JOIN Mark m ON s.RollNo = m.RollNo
WHERE WMark <= 7 OR PMark<= 7
GO

--Tao mot khung nhin chua danh sach cac sinh vien dang hoc o TimeSlot G.
CREATE VIEW StudentsWithTimeG AS
SELECT s.RollNo, FullName, TimeSlot
FROM Student s
JOIN Class c ON c.ClassCode = s.ClassCode
WHERE TimeSlot='G'
GO

--Tao mot khung nhin chua danh sach cac giao vien co it nhat 3 hoc sinh thi truot o bat cu mon nao.
CREATE VIEW TecherWithThreeFailedStudent AS
SELECT HeadTeacher, COUNT(DISTINCT s.RollNo) AS Number_of_fail_student
FROM Class c
JOIN Student s ON s.ClassCode = c.ClassCode
JOIN Mark m ON m.RollNo = s.RollNo
WHERE WMark < 8 OR PMark < 8
GROUP BY HeadTeacher
HAVING COUNT(DISTINCT s.RollNo)>=3 
GO

--Tao mot khung nhin chua danh sach cac sinh vien thi truot mon EPC cua tung lop. Khung nhin
--nay phai chua cac cot: Ten sinh vien, Ten lop, Ten Giao vien, Diem thi mon EPC.
CREATE VIEW List_of_student_fail_MA101 AS
SELECT s.FullName, s.ClassCode, HeadTeacher, m.WMark, m.PMark, (m.WMark*WTest_per+m.PMark*PTest_per)/(WTest_per+PTest_per) as Mark
FROM Class c
JOIN Student s ON s.ClassCode = c.ClassCode
JOIN Mark m ON m.RollNo = s.RollNo
JOIN Subject sjt ON sjt.SubjectCode = m.SubjectCode
WHERE m.WMark<8 OR m.WMark<8
GO

