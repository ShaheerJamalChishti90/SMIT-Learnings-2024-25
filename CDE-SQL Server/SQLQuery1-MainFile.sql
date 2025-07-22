SELECT @@VERSION;
SELECT name FROM sys.databases;

-- Change the SA password (do this immediately!)
ALTER LOGIN sa WITH PASSWORD = 'shaheersql';

-- Create a backup admin account
CREATE LOGIN [shaheersql] WITH PASSWORD = 'shaheersql2';
ALTER SERVER ROLE sysadmin ADD MEMBER [shaheersql];

-- Enable Agent XPs if needed
USE master;
GO
sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'Agent XPs', 1;
GO
RECONFIGURE;
GO

CREATE DATABASE MyFirstDB;
GO
USE MyFirstDB;
GO
CREATE TABLE TestTable (ID INT, Name VARCHAR(50));
GO

DROP DATABASE MyFirstDB;
