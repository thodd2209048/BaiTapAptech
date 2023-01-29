IF EXISTS (SELECT name FROM sys.databases WHERE name = 'B15_ComputerZ73')
    DROP DATABASE B15_ComputerZ73
GO

CREATE DATABASE B15_ComputerZ73
GO

USE B15_ComputerZ73
GO


CREATE TABLE production (
	production_code varchar(15) PRIMARY KEY,
	product_date date NOT NULL,
	production_type_id varchar(10) NOT NULL,
	supervisor_id varchar(10) NOT NULL
);
GO

CREATE TABLE staff(
	staff_id varchar(10) PRIMARY KEY,
	staff_name varchar(30) NOT NULL
);
GO

CREATE TABLE production_type (
	production_type_id varchar(10) PRIMARY KEY,
	production_type_name varchar(100) NOT NULL
)
GO

ALTER TABLE production ADD CONSTRAINT FK_svisor FOREIGN KEY (supervisor_id) REFERENCES staff(staff_id)
GO

ALTER TABLE production ADD CONSTRAINT FK_pdttype FOREIGN KEY (production_type_id) REFERENCES production_type(production_type_id)
GO

INSERT INTO staff (staff_id, staff_name)
VALUES 
('987688', 'Nguyen Van A'),
('987689', 'Nguyen Van B'),
('987690', 'Nguyen Van C'),
('987681', 'Nguyen Van D'),
('987682', 'Nguyen Van E');
GO


INSERT INTO production_type (production_type_id, production_type_name)
VALUES 
('Z37F', 'Máy tính sách tay Z38'),
('Z37E', 'Máy tính sách tay Z37'),
('Z37G', 'Máy tính sách tay Z39'),
('Z37H', 'Máy tính sách tay Z40'),
('Z37I', 'Máy tính sách tay Z41')
GO

INSERT INTO production (production_code, product_date, production_type_id, supervisor_id)
VALUES 
('Z37 111111', '2009-12-12', 'Z37E', '987688'),
('Z37 111112', '2010-01-13', 'Z37F', '987689'),
('Z37 111113', '2010-02-14', 'Z37G', '987690'),
('Z37 111114', '2010-03-15', 'Z37H', '987681'),
('Z37 111115', '2010-04-16', 'Z37I', '987682'),
('Z37 111RRR', '2010-05-12', 'Z37F', '987688')
GO

--Liet ke danh sach loai san pham cua cong ty.
SELECT * FROM production_type
GO

--Liet ke danh sach san pham cua cong ty.
SELECT * FROM production
GO

--Liet ke danh sach nguoi chiu trach nhiem cua cong ty.
SELECT * FROM staff
GO

--Liet ke danh sach loai san pham cua cong ty theo thu tu tang dan cua ten
SELECT * FROM production_type ORDER BY production_type_name
GO

--Liet ke danh sach nguoi chiu trach nhiem cua cong ty theo thu tu tang dan cua ten.
SELECT * FROM staff ORDER BY staff_name
GO

--Liet ke cac san pham cua loai san pham co m. so la Z37E.
SELECT * FROM production WHERE production_type_id = 'Z37E'
GO

--Liet ke cac san pham Nguyen Van An chiu trach nhiem theo thu tu giam dan cua ma
SELECT * FROM production
JOIN staff ON production.supervisor_id = staff.staff_id
WHERE staff_name = 'Nguyen Van A'
ORDER BY production_code DESC
GO
select * from production
go
--So san pham cua tung loai san pham.
SELECT production_type_id, COUNT(production_code) AS 'number of product' FROM production GROUP BY production_type_id
GO

--So loai san pham trung binh theo loai san pham.
--Khong hieu cau hoi

--Hien thi toan bo thong tin ve san pham va loai san pham.
SELECT production_code, product_date, supervisor_id, p.production_type_id, production_type_name
FROM production p 
JOIN production_type pt ON p.production_type_id = pt.production_type_id
GO

--Hien thi toan bo thong tin ve nguoi chiu trach nhiem, loai san pham va san pham.
SELECT * FROM production p
JOIN production_type pt ON p.production_type_id = pt.production_type_id
JOIN staff s ON s.staff_id = p.supervisor_id
GO

--Viet cau lenh de thay doi truong ngay san xuat la truoc hoac bang ngay hien tai.
ALTER TABLE production ADD CONSTRAINT date_small_than_today CHECK (product_date < GetDate())
GO


--Viet cau lenh de xac dinh cac truong khoa chinh va khoa ngoai cua cac bang.
--Viet tu dau roi

--Viet cau lenh de them truong phien ban cua san pham.
ALTER TABLE production ADD product_version varchar(10)
GO

--Dat chi muc (index) cho cot ten nguoi chiu trach nhiem
CREATE INDEX idx_supervisorname
ON staff(staff_name)
GO

--View_SanPham: Hien thi cac thong tin Ma san pham, Ngay san xuat, Loai san pham
CREATE VIEW View_SanPham AS
SELECT production_code, product_date, production_type_name
FROM production p
JOIN production_type pt ON p.production_type_id = pt.production_type_id
GO

--View_SanPham_NCTN: Hien thi M. san pham, Ngay san xuat, Nguoi chiu trach nhiem
CREATE VIEW View_SanPham_NCTN AS
SELECT production_code, product_date, staff_name
FROM production p
JOIN staff s ON p.supervisor_id = s.staff_id
GO

--View_Top_SanPham: Hien thi 5 san pham moi nhat (ma san pham, loai san pham, ngay san xuat)
CREATE VIEW View_Top_SanPham AS
SELECT TOP 5 production_code, product_date, production_type_name
FROM View_SanPham
ORDER BY product_date DESC;
GO

--Viet cac Store Procedure sau: SP_Them_LoaiSP: Them moi mot loai san pham
CREATE PROCEDURE SP_Them_LoaiSP @production_type_id varchar(10), @production_type_name varchar(100)
AS 
INSERT INTO production_type (production_type_id, production_type_name)
VALUES (@production_type_id, @production_type_name)
GO

--SP_Them_NCTN: Them moi nguoi chiu trach nhiem
CREATE PROCEDURE SP_Them_NCTN @staff_id varchar(10), @staff_name varchar(30)
AS
INSERT INTO staff (staff_id, staff_name)
VALUES (@staff_id, @staff_name)
GO

--SP_Them_SanPham: Them moi mot san pham
CREATE PROCEDURE SP_Them_SanPham 
(@production_code varchar(15),@product_date date,@production_type_id varchar(10),@supervisor_id varchar(10))
AS
INSERT INTO production (production_code, product_date, production_type_id, supervisor_id)
VALUES (@production_code, @product_date, @production_type_id, @supervisor_id)
GO

--SP_Xoa_SanPham: Xoa mot san pham theo ma san pham
CREATE PROCEDURE SP_Xoa_SanPham @production_code varchar(15)
AS
DELETE FROM production WHERE production_code = @production_code
GO

--SP_Xoa_SanPham_TheoLoai: Xoa cac san pham cua mot loai nao do
CREATE PROCEDURE SP_Xoa_SanPham_TheoLoai @production_type_id varchar(10)
AS
DELETE FROM production WHERE production_type_id = @production_type_id
GO










