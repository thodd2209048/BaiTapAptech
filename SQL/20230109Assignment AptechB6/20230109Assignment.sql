IF EXISTS (SELECT * FROM sys.databases WHERE NAME='Assignment')
	DROP DATABASE Assignment
GO

CREATE DATABASE Assignment
GO

USE Assignment
GO

CREATE TABLE KhachHang(
	ID char(8) PRIMARY KEY,
	TenKH varchar(50) NOT NULL,
	DiaChi varchar(100),
	DienThoai varchar(15)
)
GO

CREATE TABLE DonHang(
	MaDonHang varchar(10) PRIMARY KEY ,
	NgayDatHang date NOT NULL,
	IDKhachHang char(8) FOREIGN KEY REFERENCES KhachHang(ID)
)
GO

CREATE TABLE HangHoa (
	MaHang varchar(10) PRIMARY KEY,
	TenHang varchar(50) NOT NULL,
	MoTa varchar(100) NOT NULL,
	DonVi varchar (15) NOT NULL,
	Gia int NOT NULL,
)
GO

ALTER TABLE HangHoa
	ALTER COLUMN Gia money NOT NULL
GO

EXEC SP_HELP DonHang
GO

ALTER TABLE DonHang
	ALTER COLUMN IDKhachHang char(8) NOT NULL
GO

ALTER TABLE DonHang
	DROP CONSTRAINT fk_idkh 
GO

CREATE TABLE ChiTietDonHang (
	MaDonHang varchar(10) REFERENCES DonHang(MaDonHang),
	MaHang varchar(10) REFERENCES HangHoa(MaHang),
	SoLuong int NOT NULL,
	Gia money NOT NULL
	CONSTRAINT pk PRIMARY KEY (MaDonHang, MaHang)
)

--Them du lieu vao bang
INSERT INTO HangHoa(MaHang, TenHang, MoTa, DonVi, Gia)
	VALUES('A02', 'Chuot Logitech Lift', 'Moi', 'Chiec', 1100),
		('B23', 'Laptop Lenovo', 'Moi', 'Chiec', 15000)
GO

INSERT INTO KhachHang(ID, TenKH, DiaChi, DienThoai)
	VALUES('001', 'Tho', 'Hai Phong', '999-000'),
		('002', 'Mai', 'Ha Noi', '888773')
GO
INSERT INTO KhachHang(ID, TenKH, DiaChi, DienThoai)
	VALUES('003', 'Nguyen Van An', 'Can Tho', '1121212')
GO


INSERT INTO DonHang(MaDonHang, NgayDatHang, IDKhachHang)
	VALUES('0001', '2023-01-10', '001'),
		('0002', '2022-12-01', '001')
GO
INSERT INTO DonHang(MaDonHang, NgayDatHang, IDKhachHang)
	VALUES('0005', '2022-01-15', '003'),
		('0006', '2022-12-01', '003')
GO


INSERT INTO ChiTietDonHang(MaDonHang, MaHang, SoLuong, Gia)
	VALUES('0001', 'A02', 1, 1500),
		('0002', 'B23', 1 , 10000)
GO
INSERT INTO ChiTietDonHang(MaDonHang, MaHang, SoLuong, Gia)
	VALUES('0005', 'A02', 1, 1400),
		('0005', 'B23', 1 , 10000),
		('0006', 'B23', 1 , 10000)
GO

--Danh sach khach hang da mua hang
SELECT ID, TenKH FROM KhachHang k
	INNER JOIN DonHang dh ON k.ID = dh.IDKhachHang
	GROUP BY ID, TenKH
GO

--Liet ke san pham cua cua hang
SELECT * FROM HangHoa
GO

--Liet ke danh sach cac don hang
SELECT * FROM DonHang
GO 

--Liet ke danh sach khach hang theo thu thu alphabet
SELECT * FROM KhachHang
	ORDER BY TenKH
GO

--Liet ke danh sach san pham cua cua hang theo thu thu gia giam dan
SELECT * FROM HangHoa
	ORDER BY Gia DESC
GO

-- Liet ke cac san pham ma khach hang Nguyen Van An da mua.
SELECT TenHang FROM HangHoa h
	INNER JOIN ChiTietDonHang ctdh ON h.MaHang = ctdh.MaHang
	INNER JOIN DonHang dh ON dh.MaDonHang = ctdh.MaDonHang
	INNER JOIN KhachHang kh ON kh.ID = dh.IDKhachHang
	GROUP BY TenHang
	ORDER BY TenHang
GO

--