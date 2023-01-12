IF EXISTS (SELECT * FROM SYS.DATABASES WHERE NAME = 'CitySoftware')
	DROP DATABASE CitySoftware
GO

CREATE DATABASE CitySoftware
GO

USE CitySoftware
GO

CREATE TABLE Employee(
	EmployeeID INT,
	Name VARCHAR(100),
	Tel CHAR(11),
	Email VARCHAR(30)
)
GO

CREATE TABLE Groups(
	GroupID int,
	GroupName varchar(30),
	LeaderID int,
	ProjectID int
)
GO

CREATE TABLE Project(
	ProjectID INT,
	ProjectName VARCHAR(30),
	StartDate DATETIME,
	EndDate DATETIME,
	Period INT,
	Cost MONEY
)
GO

CREATE TABLE GroupDetail(
	GroupID INT,
	EmployeeID INT,
	Status CHAR(20)
)
GO

--Xac dinh thuoc tinh khoa (khoa chinh, khoa ngoai) va viet cau lenh thay doi cac truong voi thuoc tinh khoa vua xac dinh.
ALTER TABLE Employee ALTER COLUMN EmployeeID INT NOT NULL
ALTER TABLE Employee ADD CONSTRAINT pk PRIMARY KEY (EmployeeID)
ALTER TABLE Groups ALTER COLUMN GroupID INT NOT NULL
ALTER TABLE Groups ADD CONSTRAINT pk_grp PRIMARY KEY (GroupID)
ALTER TABLE Project ALTER COLUMN ProjectID INT NOT NULL
ALTER TABLE Project ADD CONSTRAINT pk_prt PRIMARY KEY (ProjectID)
ALTER TABLE Groups ADD CONSTRAINT fk_grp_pid FOREIGN KEY (GroupID) REFERENCES Project(ProjectID)
ALTER TABLE Groups ADD CONSTRAINT fk_grp_lid FOREIGN KEY (LeaderID) REFERENCES Employee(EmployeeID)
ALTER TABLE GroupDetail ALTER COLUMN GroupID INT NOT NULL
ALTER TABLE GroupDetail ALTER COLUMN EmployeeID INT NOT NULL
ALTER TABLE GroupDetail ADD CONSTRAINT pk_gd PRIMARY KEY (GroupID, EmployeeID)
ALTER TABLE GroupDetail ADD CONSTRAINT fk_gd_gid FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
ALTER TABLE GroupDetail ADD CONSTRAINT fk_gd_eid FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
GO
--Them du lieu cho cac bang
INSERT INTO Employee(EmployeeID, Name, Tel, Email)
	VALUES(1, 'Tho', '999888', 'tho@yahoo.com'),
		(2, 'Ngoc', '213435', 'ngocnguyen@gmail.com'),
		(3, 'Nam', '938271', 'namfpt@gmail.com'),
		(4, 'Thai', '789456123', 'thai.tq@hotmail.com')
GO

ALTER TABLE Project DROP COLUMN Period
GO

CREATE VIEW project_view AS
SELECT ProjectID, ProjectName, StartDate, EndDate, DATEDIFF(MONTH, StartDate, EndDate) Period , Cost FROM Project
GO

INSERT INTO Project(ProjectID, ProjectName, StartDate, EndDate, Cost)
	VALUES(14, 'Chinh phu dien tu', '2005-03-28 03:03:48', '2021-06-04 03:06:53', 3000),
		(16, 'Theo doi COVID', '2019-05-05 05:05:26', '2019-06-17 05:06:34', 200),
		(17, 'Quan ly CSDL thi dai hoc', '2020-12-04 11:12:43', '2022-11-11 10:11:55', 120)
GO


