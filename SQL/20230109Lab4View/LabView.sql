CREATE DATABASE Lab11
GO

USE Lab11
GO

CREATE VIEW ProductList
AS
 SELECT ProductID, Name FROM AdventureWorks2019.Production.Product
GO

SELECT * FROM ProductListGO

USE AdventureWorks2019
GO

EXEC sp_help 'Sales.Customer'
GO

SELECT * FROM Sales.Customer
GO

CREATE VIEW KH2018
AS SELECT FirstName, MiddleName, LastName, ssoh.OrderDate FROM Person.Person pp
	INNER JOIN Sales.Customer sc ON pp.BusinessEntityID = sc.PersonID
	INNER JOIN Sales.SalesOrderHeader ssoh ON ssoh.CustomerID = sc.CustomerID
	GROUP BY FirstName, MiddleName, LastName
WHERE YEAR(ssoh.OrderDate) = 2014
GO

Drop view KH2018
GO

SELECT * FROM KH2018
GO
