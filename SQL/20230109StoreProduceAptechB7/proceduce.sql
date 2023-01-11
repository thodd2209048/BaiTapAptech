USE AdventureWorks2019
GO

CREATE PROCEDURE Display_Customers
AS
SELECT CustomerID, AccountNumber, rowguid, ModifiedDate
from Sales.Customer
GO

EXECUTE Display_Customers
GO

EXECUTE xp_fileexist 'd:\mytest.txt'
GO

EXECUTE sys.sp_who
GO