IF EXISTS (SELECT * FROM sys.databases WHERE name='LabSelect')
	DROP DATABASE LabSelect
GO

CREATE DATABASE LabSelect
GO

USE LabSelect
GO

CREATE TABLE PhongBan(
	MaPB varchar(7) PRIMARY KEY,
	TenPB nvarchar(50)
)
GO

DROP TABLE NhanVien
GO

CREATE TABLE NhanVien (
	MaNV varchar(7) PRIMARY KEY,
	TenNV nvarchar(50),
	NgaySinh Date NOT NULL CHECK (NgaySinh < getDate()),
	SoCMND char(9) CHECK (SoCMND like '%[0-9]%'),
	GioiTinh char(1) CHECK (GioiTinh like '[MF]'),
	DiaChi nvarchar(100),
	NgayVaoLam date NOT NULL,
	MaPB varchar(7),
	CONSTRAINT fk_MaBP FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB),
	CONSTRAINT ngvl_ngs CHECK (YEAR(NgayVaoLam) > YEAR(NgaySinh)+20)
)
GO

INSERT INTO PhongBan (MaPB, TenPB)
	VALUES ('Sale', 'Sale'),
		('GD', 'Giam Doc'),
		('HC', 'Hanh chinh'),
		('AN', 'An ninh'),
		('SX', 'San xuat')
GO

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB)
	VALUES (1, 'Thao', '2001-01-01', 100000000, 'F', 'Ha Noi', '2022-01-01', 'Sale')
GO

INSERT INTO NhanVien (MaNV, TenNV, NgaySinh, SoCMND, GioiTinh, DiaChi, NgayVaoLam, MaPB)
	VALUES (2, 'Mai', '1997-03-03', 100000000, 'F', 'Ha Noi', '2022-01-01', 'Sale')
GO

CREATE TABLE LuongDA (
	MaDA varchar(8),
	MaNV varchar(7) FOREIGN KEY references NhanVien(MaNV),
	NgayNhan date NOT NULL Default(getDate()),
	SoTien money CHECK (SoTien > 0),
	CONSTRAINT pk PRIMARY KEY (MaDA, MaNV)
)
GO

