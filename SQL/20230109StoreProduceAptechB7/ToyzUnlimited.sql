IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'ToyzUnlimited')
	DROP DATABASE ToyzUnlimited
GO

CREATE DATABASE ToyzUnlimited
GO

USE ToyzUnlimited
GO

CREATE TABLE Product (
	ProductCode varchar(5) PRIMARY KEY,
	Name varchar(30),
	Category varchar(30),
	Manufacturer varchar(40),
	AgeRange varchar(15),
	UnitPrice money,
	Netweight int,
	QtyOnHand int
)
GO

INSERT INTO Product (ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand)
	VALUES (11, 'Cau truot tre em', 'Do boi, ho boi','Hoan Thanh', '3-5', 1150, 10000, 93),
			(12, 'Xe truot Scooter', 'Xe scooter', 'NSX', '3-10', 460, 3000, 102),
			(13, 'Do choi cau ca', 'Do choi hoc tap', 'NSX', '3-10', 300, 500, 200),
			(14, 'Dong ho LED dien tu', 'Do choi hoc tap', 'Alokids', '3-10',22, 100, 53),
			(15, 'Bo do choi nau an', 'Do choi nhap vai', 'Do choi cao cap', '2-10', 400, 500, 146),
			(16, 'Bo do choi rut go', 'Do choi hoc tap', 'Go Duc Thanh', '2-15',45, 400, 1348),
			(17, 'Do choi hai tac', 'Do choi nha tam', 'NSX', '3-10', 34, 100, 230),
			(18, 'Robot khung long', 'Khac', 'NSX', '3-10', 129, 100, 100),
			(19, 'Do choi sung ban nuoc', 'Do choi nha tam', 'NSX', '3-10', 36, 100, 214),
			(20, 'Do choi sang tao', 'Do choi xay dung', 'NSX', '7-10', 68, 100, 417)
GO

INSERT INTO Product (ProductCode, Name, Category, Manufacturer, AgeRange, UnitPrice, Netweight, QtyOnHand)
	VALUES (1,'Magic','Game','NNC','3-5',1200, 50, 43),
       (2,'Fish', 'Cooking','ASF','5-10',230, 40, 22),
	   (4,'House','Lego', 'LG','7-15',500, 300, 35),
	   (5,'Kingdom','Broadgame', 'UUH','7-15',100, 100, 54),
	   (6,'Bunny','Bear', 'LG','7-15',687, 400, 76),
	   (7,'Teddy bear','Bear', 'LG','3-10',500, 300, 98),
	   (8,'Barbie','Toy', 'WEW','5-10',2100, 600, 33),
	   (9,'Robot','Lego', 'LG','7-15',765, 885, 22),
	   (10,'Cake','Lego', 'LG','7-15',554, 456, 76)
GO

SELECT * FROM Product
GO

CREATE PROCEDURE HeavyToys @FindWeight int
AS
SELECT * FROM Product
WHERE Netweight >= @FindWeight
GO

EXEC HeavyToys @FindWeight = 500
GO

CREATE PROCEDURE PriceIncrease
AS
	UPDATE Product
	SET UnitPrice += 10
	SELECT * FROM Product
GO

EXEC PriceIncrease
GO

CREATE PROCEDURE QtyOnHand 
AS
	UPDATE Product
	SET QtyOnHand -=5
	SELECT * FROM Product
GO

EXEC QtyOnHand
GO

--Viet cac cau lenh xem dinh nghia cuacac thu tuc tren dung 3 cach sau: 

EXEC sp_helptext QtyOnHand
GO

SELECT * FROM sys.sql_modules
GO



