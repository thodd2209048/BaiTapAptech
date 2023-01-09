IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'Aptech')
	DROP DATABASE Aptech
GO

CREATE DATABASE Aptech
GO

USE Aptech
GO

CREATE TABLE Classes (
	ClassName char(6) 
)