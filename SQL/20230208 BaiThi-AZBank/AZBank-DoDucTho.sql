--Create database named AZBank.

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'AZBank')
    DROP DATABASE AZBank
GO

CREATE DATABASE AZBank
GO

USE AZBank
GO

--In the AZBank database, create tables with constraints as design above.

CREATE TABLE Customer (
	CustomerId int PRIMARY KEY,
	Name nvarchar(50),
	City nvarchar(50),
	Country nvarchar(50),
	Phone nvarchar(15),
	Email nvarchar(50)
)
GO


CREATE TABLE CustomerAccount (
	AccountNumber char(9) PRIMARY KEY,
	CustomerId int NOT NULL,
	Balance money NOT NULL,
	MinAccount money
)
GO

ALTER TABLE CustomerAccount ADD CONSTRAINT FK_cusID FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
GO

CREATE TABLE CustomerTransaction (
	TransactionId int PRIMARY KEY,
	AccountNumber char(9),
	TransactionDate smalldatetime,
	Amount money,
	DepositorWithdraw bit
)
GO

ALTER TABLE CustomerTransaction ADD CONSTRAINT FK_accNo FOREIGN KEY (AccountNumber) REFERENCES CustomerAccount(AccountNumber)
GO

--Insert into each table at least 3 records.
INSERT INTO Customer (CustomerId, Name, City, Country, Phone, Email)
VALUES
(1, 'Nguyen Anh', 'Hanoi', 'Viet Nam', '+84 123 456 789', 'anhng@email.com'),
(2, 'Tran Phuong Thao', 'Hanoi', 'Viet Nam', '+84 987 654 321', 'tpthao@email.com'),
(3, 'Mai Xuan Duc', 'Ho Chi Minh City', 'Viet Nam', '+84 111 222 333', 'maixuanduc@email.com');
GO

INSERT INTO CustomerAccount (AccountNumber, CustomerId, Balance, MinAccount)
VALUES ('A00000001', 1, '$1000.00', '$100.00'),
	('A00000002', 2, '$2000.00', '$200.00'),
	('A00000003', 3, '$3000.00', '$300.00')
GO

INSERT INTO CustomerTransaction (TransactionId, AccountNumber, TransactionDate, Amount, DepositorWithdraw)
VALUES (1, 'A00000001', '2022-12-01 10:00:00', '$100.00', 1),
(2, 'A00000002', '2022-12-02 11:00:00', '$200.00', 0),
(3, 'A00000003', '2022-12-03 12:00:00', '$300.00', 1),
(4, 'A00000001', '2022-12-04 13:00:00', '$400.00', 0),
(5, 'A00000002', '2022-12-05 14:00:00', '$500.00', 1)
GO

--Write a query to get all customers from Customer table who live in ‘Hanoi’.
SELECT * FROM Customer WHERE City ='Hanoi'
GO

--Write a query to get account information of the customers (Name, Phone, Email, AccountNumber, Balance).
SELECT Name, Phone, Email, AccountNumber, Balance 
FROM Customer c
JOIN CustomerAccount ca ON c.CustomerId = ca.CustomerId
WHERE city = 'Hanoi'
GO

--A-Z bank has a business rule that each transaction (withdrawal or deposit) won’t be
--over $1000000 (One million USDs). Create a CHECK constraint on Amount column
--of CustomerTransaction table to check that each transaction amount is greater than
--0 and less than or equal $1000000.

ALTER TABLE CustomerTransaction
ADD CONSTRAINT chk_amount_transaction CHECK (Amount > 0 AND Amount <= 1000000)
GO

--Since the A-Z Bank usually searches for customers by their names, make a non-
--clustered index on column Name of Customer table.

CREATE NONCLUSTERED INDEX idx_customer_name
ON Customer (Name)
GO

--Create a view named vCustomerTransactions that display Name,
--AccountNumber, TransactionDate, Amount, and DepositorWithdraw from Customer,
--CustomerAccount and CustomerTransaction tables.

CREATE VIEW vCustomerTransactions AS
SELECT Name, ca.AccountNumber, TransactionDate, Amount, DepositorWithdraw
FROM Customer c
JOIN CustomerAccount ca ON c.CustomerId = ca.CustomerId
JOIN CustomerTransaction ct ON ca.AccountNumber = ct.AccountNumber;
GO

--Create a stored procedure named spAddCustomer with Customer Id, Customer
--Name, Country, Phone and Email as input parameters to insert data into Customer
--table. Using this stored procedure to insert some records into Customer table.

CREATE PROCEDURE spAddCustomer (@CustomerID int, @Name nvarchar(50), @Country nvarchar(50), @Phone nvarchar(15), @Email nvarchar(50))
AS
    INSERT INTO Customer (CustomerID, Name, Country, Phone, Email)
    VALUES (@CustomerID, @Name, @Country, @Phone, @Email)
GO

EXEC spAddCustomer 11, 'Do Hong Hanh', 'Vietnam', '+848881212', 'honghanh.do@gmail.com'
GO

EXEC spAddCustomer 12, 'Tran Tien Thanh', 'Vietnam', '+848855512', 'tienthanh-hn@gmail.com'
GO

--.Create a stored procedure named spGetTransactions which accepts
--AccountNumber, FromDate, ToDate as input parameters and displays transaction
--detail of specified account including transaction date, amount, transaction type
--(depositor or withdraw).

CREATE PROCEDURE spGetTransactions (@AccountNumber char(9), @FromDate smalldatetime, @ToDate smalldatetime)
AS
	SELECT TransactionDate, Amount, DepositorWithdraw
	FROM CustomerTransaction
	WHERE AccountNumber = @AccountNumber AND TransactionDate BETWEEN @FromDate AND @ToDate
GO
