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
	MaDonHang varchar PRIMARY KEY AUTO_INCREMENT,
	IDKhachHang char
)
GO