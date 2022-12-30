IF EXISTS (SELECT * FROM  sys.databases WHERE Name='BookDream')
	DROP DATABASE BookDream
GO

CREATE DATABASE BookDream
GO

USE BookDream
GO

CREATE Table Book (
	BookCode int PRIMARY KEY,
	BookTitle varchar(100) NOT NULL,
	Author varchar(50) NOT NULL,
	Edition int,
	BookPrice money,
	Copies int
)
GO


CREATE TABLE Member (
	MemberCode int PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Address varchar(100) NOT NULL,
	PhoneNumber int NULL
)
GO


CREATE TABLE IssueDetails (
	BookCode int ,
	MemberCode int ,
	IssueDate datetime,
	ReturnDate datetime,
	CONSTRAINT IssueDetails_fk_BookCode FOREIGN KEY (BookCode) REFERENCES Book (BookCode),
	CONSTRAINT IssueDetails_fk_MemberCode FOREIGN KEY (MemberCode) REFERENCES Member (MemberCode)
)
GO



--Xoa bo cac Rang buoc Khoa ngoai cua bang IssueDetails
ALTER TABLE IssueDetails
	DROP CONSTRAINT IssueDetails_fk_Bookcode, IssueDetails_fk_MemberCode
GO

--Xoa bo Rang buoc Khoa chinh cua bang Member va Book


--Them moi cac Rang buoc Khoa ngoai cho bang IssueDetails
ALTER TABLE IssueDetails
	ADD CONSTRAINT IssueDetails_fk_Bookcode FOREIGN KEY (BookCode) REFERENCES Book (BookCode)
GO

ALTER TABLE IssueDetails
	ADD CONSTRAINT IssueDetails_fk_MemberCode FOREIGN KEY (MemberCode) REFERENCES Member (MemberCode)
GO

--Bo sung them Rang buoc gia ban sach > 0 va < 200
ALTER TABLE Book
	ADD CONSTRAINT Book_chk_BookPrice1 CHECK (BookPrice > 0)

ALTER TABLE Book
	ADD CONSTRAINT Book_chk_BookPrice2 CHECK (BookPrice < 200)
GO

--Bo sung them Rang buoc duy nhat cho PhoneNumber cua bang Member
ALTER TABLE Member
	ADD CONSTRAINT Member_unique UNIQUE (PhoneNumber)
GO

--Bo sung them rang buoc NOT NULL cho BookCode, MemberCode trong bang IssueDetails
ALTER TABLE IssueDetails
	ALTER COLUMN BookCode int NOT NULL
GO

ALTER TABLE IssueDetails
	ALTER COLUMN MemberCode int NOT NULL
GO


--Tao khoa chinh gom 2 cot BookCode, MemberCode cho bang IssueDetails
ALTER TABLE IssueDetails 
	ADD Constraint IssueDetail_pk PRIMARY KEY (BookCode, MemberCode)
GO



EXECUTE sp_databases
GO
EXEC sp_help 'Book'
GO
Select * from Book
GO
SELECT * FROM Member
GO

SELECT * FROM IssueDetails
GO

--Chen du lieu hop ly cho cac bang(Su dung SQL)
INSERT INTO Book (BookCode, BookTitle, Author, Edition, BookPrice, Copies)
	VALUES (1, 'Sup do', 'Jared Diamond', 1, 20, 1)
GO

INSERT INTO Member (MemberCode, Name, Address, PhoneNumber)
	VALUES (1, 'Do Duc Tho', 'Cau Giay', 0988)
GO

INSERT INTO IssueDetails (BookCode, MemberCode, IssueDate)
	VALUES (1, 1, '2022-12-30 09:00:00')
GO

