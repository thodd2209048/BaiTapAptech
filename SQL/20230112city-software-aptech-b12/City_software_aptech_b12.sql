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
ALTER TABLE Groups ADD CONSTRAINT fk_grp_pid FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
ALTER TABLE Groups ADD CONSTRAINT fk_grp_lid FOREIGN KEY (LeaderID) REFERENCES Employee(EmployeeID)
ALTER TABLE GroupDetail ALTER COLUMN GroupID INT NOT NULL
ALTER TABLE GroupDetail ALTER COLUMN EmployeeID INT NOT NULL
ALTER TABLE GroupDetail ADD CONSTRAINT pk_gd PRIMARY KEY (GroupID, EmployeeID)
ALTER TABLE GroupDetail ADD CONSTRAINT fk_gd_gid FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
ALTER TABLE GroupDetail ADD CONSTRAINT fk_gd_eid FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
GO

--Them du lieu cho cac bang
INSERT INTO Employee(EmployeeID, Name, Tel, Email)
	VALUES(1, 'Tho', '0999888', 'tho@yahoo.com'),
		(2, 'Ngoc', '0213435', 'ngocnguyen@gmail.com'),
		(3, 'Nam', '0938271', 'namfpt@gmail.com'),
		(4, 'Thai', '0789456123', 'thai.tq@hotmail.com')
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

INSERT INTO Project(ProjectID, ProjectName, StartDate, Cost)
	VALUES (18, 'Quan ly thong tin sinh vien', '2021-12-12', 80)
GO


INSERT INTO Groups(GroupID, GroupName, LeaderID, ProjectID)
	VALUES (1, 'Team 1', 3, 14),
		(2, 'Team 2', 1, 16),
		(3, 'Team 3', 3, 17),
		(4, 'Team 4', 2, 18)
GO

select * from GroupDetail

INSERT INTO GroupDetail(GroupID, EmployeeID, Status)
	VALUES(1, 3, 'da lam'),
		(1, 2, 'da lam'),
		(2, 1, 'da lam'),
		(2, 2, 'da lam'),
		(3, 3, 'da lam'),
		(3, 4, 'da lam'),
		(4, 4, 'dang lam'),
		(4, 2, 'dang lam')
GO

--Hien thi thong tin cua tat ca nhan vien
SELECT * FROM Employee
GO

--Liet ke danh sach nhan vien dang lam du an “Chinh phu dien tu”
SELECT e.EmployeeID, e.Name FROM Employee e
JOIN GroupDetail gd ON gd.EmployeeID = e.EmployeeID
JOIN Groups g ON g.GroupID = gd.GroupID
JOIN Project p ON p.ProjectID = g.ProjectID
WHERE ProjectName = 'Chinh phu dien tu'
GO

--Thong ke so luong nhan vien dang lam viec tai moi nhom
SELECT GroupName, Count(EmployeeID) so_thanh_vien FROM Groups g
JOIN GroupDetail gd ON gd.GroupID = g.GroupID
GROUP BY  GroupName
GO

--Liet ke thong tin ca nhan cua cac truong nhom
SELECT GroupName, e.EmployeeID, Name, Tel, Email FROM Employee e
JOIN Groups g ON g.LeaderID = e.EmployeeID
GO

--Liet ke thong tin ve nhom va nhan vien dang lam cac du an co ngay bat dau lam truoc ngay 12/10/2010
SELECT gd.GroupID, EmployeeID FROM GroupDetail gd
JOIN Groups g ON g.GroupID = gd.GroupID
JOIN Project p ON p.ProjectID = g.ProjectID
WHERE StartDate < '2010-10-12' AND Status = 'dang lam'
GO

--Liet ke tat ca nhan vien du kien se duoc phan vao cac nhom lam viec
SELECT GroupID, e.EmployeeID, Name, Tel, Email FROM GroupDetail gd
JOIN Employee e ON e.EmployeeID =  gd.EmployeeID
WHERE Status = 'sap lam'
GO

--Liet ke tat ca thong tin ve nhan vien, nhom lam viec, du an cua nhung du an da hoan thanh
SELECT p.ProjectID, ProjectName, g.GroupID, GroupName, e.EmployeeID, Name, status FROM Project p
JOIN Groups g ON g.ProjectID = p.ProjectID
JOIN GroupDetail gd ON gd.GroupID = g.GroupID
JOIN Employee e ON e.EmployeeID = gd.EmployeeID
WHERE Status = 'da lam'
GO

--VIET CAU LENH KIEM TRA
--Ngay hoan thanh du an phai sau ngay bat dau du an
ALTER TABLE Project
	ADD CHECK (EndDate > StartDate)
GO

--Truong ten nhan vien khong duoc null
ALTER TABLE Employee
	ALTER COLUMN Name VARCHAR(100) NOT NULL
GO

--Truong trang thai lam viec chi nhan mot trong 3 gia tri: inprogress, pending, done
ALTER TABLE GroupDetail
	ADD CHECK (Status IN ('chua lam', 'dang lam', 'da lam'))
GO

--Truong gia tri du an phai lon hon 10
ALTER TABLE Project
	ADD CHECK (Cost > 10)
GO

--Truong nhom lam viec phai la nhan vien
--????????????????????????
go

--Truong dien thoai cua nhan vien chi duoc nhap so va phai bat dau bang so 0
ALTER TABLE Employee
	ADD CHECK (Tel not like '%[^0123456789]%') 
	--add check (Tel Not Like '[^0]%')
GO
--mau thuan check voi du lieu dang co. tai sao???

--Tang gia them 10% cua  cac du an co tong gia tri nho hon 2000
CREATE PROCEDURE increase_ten_per
AS UPDATE Project SET Cost*=1.1 WHERE Cost < 2000
GO


--Hien thi thong tin ve du an sap duoc thuc hien
CREATE PROCEDURE sap_lam_view
AS SELECT * FROM Project WHERE StartDate > GetDate()
GO

--Hien thi tat ca cac thong tin lien quan ve cac du an da hoan thanh
CREATE PROCEDURE done_project
AS SELECT * FROM Project WHERE EndDate <= GetDate()
GO

--Tao chi muc duy nhat ten la IX_Group tren 2 truong GroupID va EmployeeID cua bang GroupDetail
CREATE UNIQUE INDEX gd_gid_eid
ON GroupDetail(GroupID, EmployeeID)
GO

--Tao chi muc ten la IX_Project tren truong ProjectName cua bang Project gom cac truong StartDate va EndDate
CREATE INDEX IX_Project 
ON Project(ProjectName)
GO

--Liet ke thong tin ve nhan vien, nhom lam viec co du an dang thuc hien
CREATE VIEW group_employee_inprocess
AS SELECT * FROM GroupDetail WHERE Status = 'dang lam'
GO

--Tao khung nhin chua cac du lieu sau: ten Nhan vien, ten Nhom, ten  Du an va trang thai lam viec cua Nhan vien.
CREATE VIEW employee_inprocess
AS SELECT Name, GroupName, ProjectName, Status 
FROM GroupDetail gd
JOIN Employee e ON e.EmployeeID = gd.EmployeeID
JOIN Groups g ON g.GroupID = gd.GroupID
JOIN Project p ON p.ProjectID = g.ProjectID
ORDER BY e.Name OFFSET 0 ROWS
GO

--Dam bao rang khi xoa mot Group thi tat ca nhung ban ghi co lien quan trong bang GroupDetail cung se bi xoa theo.
ALTER TABLE GroupDetail
DROP fk_gd_gid
GO

ALTER TABLE GroupDetail
ADD CONSTRAINT fk_gd_gid FOREIGN KEY (GroupID) REFERENCES Groups(GroupID) ON DELETE CASCADE
GO

--Khong cho phep chen 2 nhom co cung ten vao trong bang Group.
ALTER TABLE Groups
ADD CONSTRAINT GroupName_Unique UNIQUE(GroupName)
GO


















