/*
** Custom T-SQL Here
*/

SET NOCOUNT ON
GO

USE master
GO

IF EXISTS (
  SELECT *
  FROM sysdatabases
  WHERE name = N'HelloWorld'
)
  DROP DATABASE HelloWorld
GO

CREATE DATABASE HelloWorld
GO
