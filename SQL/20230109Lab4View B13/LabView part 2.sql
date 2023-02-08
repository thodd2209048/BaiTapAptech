--part2 cua buoi 13

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'B16_Book')
    DROP DATABASE B16_Book
GO

CREATE DATABASE B16_Book
GO

USE B16_Book
GO

CREATE TABLE customer (
	CustomerID int PRIMARY KEY IDENTITY(1,1),
	CustomerName varchar(50) NOT NULL,
	Address varchar(100),
	Phone varchar(12)
)
GO

CREATE TABLE book (
	BookCode int PRIMARY KEY,
	Category varchar(50) NOT NULL,
	Author varchar(50) NOT NULL,
	Publisher varchar(50) NOT NULL,
	Title varchar(100) NOT NULL,
	Price int NOT NULL,
	InStore int NOT NULL
)
GO

CREATE TABLE BookSold (
	BookSoldID int PRIMARY KEY,
	CustomerID int NOT NULL,
	BookCode int NOT NULL,
	Date datetime NOT NULL,
	Price int NOT NULL,
	Amount int NOT NULL
)
GO

ALTER TABLE BookSold
ADD CONSTRAINT FK_cusID FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
	CONSTRAINT FK_bookcode FOREIGN KEY (BookCode) REFERENCES Book (BookCode)
GO

INSERT INTO Book (BookCode, Category, Author, Publisher, Title, Price, InStore)
VALUES 
(1, 'Van hoc', 'Nguyen Van An', 'Nha xuat ban Van Hoa', 'Cuon sach ve tinh yeu', 10000, 10),
(2, 'Kinh te', 'Tran Thi Binh', 'Nha xuat ban Tri Tue', 'Ban ve quan ly tai chinh', 12000, 5),
(3, 'Ky nang song', 'Le Duc Cong', 'Nha xuat ban Van Hoa', 'Tang cuong tam ly', 11000, 8),
(4, 'Thieu nhi', 'Hoang Thi Diu', 'Nha xuat ban Van Hoa', 'Cau chuyen cho tre', 9000, 15),
(5, 'Khoa hoc', 'Phan Thanh Binh', 'Nha xuat ban Ha Noi', 'Co che hoat dong cua con nguoi', 13000, 10);
GO

INSERT INTO Customer (CustomerName, Address, Phone) 
VALUES
('Ngo Van Chien', 'Ha Noi, Viet Nam', '0123456789'),
('Tran Thi Le', 'TP Ho Chi Minh, Viet Nam', '0123456780'),
('Dang Chau', 'Da Nang, Viet Nam', '0123456781'),
('Pham Danh Thu', 'Hai Phong, Viet Nam', '0123456782'),
('Hoang Minh Quan', 'Nha Trang, Viet Nam', '0123456783');
GO

INSERT INTO BookSold (BookSoldID, CustomerID, BookCode, Date, Price, Amount)
VALUES (1, 6, 5, '2023-01-01', 1000, 2),
(2, 6, 2, '2023-01-02', 500, 1),
(3, 7, 3, '2023-01-03', 800, 3),
(4, 8, 5, '2023-01-04', 600, 2),
(5, 10, 5, '2023-01-05', 400, 1),
(6, 9, 2, '2023-01-06', 900, 3),
(7, 8, 3, '2023-01-07', 700, 2),
(8, 8, 1, '2023-01-08', 500, 1),
(9, 6, 5, '2023-01-09', 800, 3),
(10, 6, 2, '2023-01-10', 700, 2);
GO

--Tao mot khung nhin chua danh sach cac cuon sach (BookCode, Title, Price) kem theo so luong da ban duoc cua moi cuon sach.
CREATE VIEW BookSoldList AS
SELECT b.BookCode, Title, b.Price, SUM(bs.Amount) AS 'Total Sold'
FROM Book b
JOIN BookSold bs ON b.BookCode = bs.BookCode
GROUP BY b.BookCode, Title, b.Price
GO


--Tao mot khung nhin chua danh sach cac khach hang (CustomerID, CustomerName, Address) kem theo so luong cac cuon sach ma khach hang do da mua.
CREATE VIEW CustomerBookPurchase AS
SELECT c.CustomerID, CustomerName, Address, SUM(bs.Amount) AS 'Total buy'
FROM Customer c
JOIN BookSold bs ON c.CustomerID = bs.CustomerID
GROUP BY c.CustomerID, CustomerName, Address
GO

CREATE VIEW CustomerBookHistory AS
SELECT 
  c.CustomerID, 
  c.CustomerName, 
  c.Address, 
  b.Title
FROM Customer c
JOIN BookSold bs ON c.CustomerID = bs.CustomerID
JOIN Book b ON bs.BookCode = b.BookCode
WHERE bs.Date BETWEEN DATEADD(month, -1, GETDATE()) AND GETDATE();
GO

--Tao mot khung nhin chua danh sach cac khach hang (CustomerID, CustomerName, Address) da mua sach vao thang truoc, 
--kem theo ten cac cuon sach ma khach hang da mua.
CREATE VIEW CustomerLastmonth AS
SELECT
	c.CustomerID,
	CustomerName,
	Address,
	Title
FROM Customer c
JOIN BookSold bs ON bs.CustomerID = c.CustomerID
JOIN Book b ON b.BookCode = bs.BookCode
WHERE bs.Date BETWEEN DateAdd(month, -1, GetDate()) AND GetDate();
GO

--Tao mot khung nhin chua danh sach cac khach hang kem theo tong tien ma moi khach hang da chi cho viec mua sach.
CREATE VIEW CustomerExpenditure AS
SELECT c.CustomerID, CustomerName, SUM(bs.Amount * bs.Price ) AS 'Total expenditure'
FROM Customer c
JOIN BookSold bs ON c.CustomerID = bs.CustomerID
GROUP BY c.CustomerID, CustomerName
GO