/*
** Example Restore
** <https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms>
** <https://github.com/microsoft/sql-server-samples/tree/master/samples/databases>
** <https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak>
** <https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak>
** <https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2017.bak>
*/

SET NOCOUNT ON
GO

USE master
GO

PRINT 'Executing `restore.sql` ...'

/*
  AdventureWorks2017
*/
IF DB_ID('AdventureWorks2017') IS NOT NULL
  PRINT 'AdventureWorks2017 exists'
ELSE
  BEGIN 
    PRINT 'Restoring AdventureWorks2017 ...'

    RESTORE DATABASE AdventureWorks2017
    FROM DISK = N'/var/opt/mssql/backup/AdventureWorks2017.bak'
    --FROM URL = 'https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak'
    WITH 
      MOVE N'AdventureWorks2017'
        TO N'/var/opt/mssql/data/AdventureWorks2017.mdf',
      MOVE N'AdventureWorks2017_log'
        TO N'/var/opt/mssql/data/AdventureWorks2017_log.mdf',
      FILE = 1,
      NOUNLOAD,
      STATS = 5
      ;
    
    PRINT 'AdventureWorks2017 restored!'
  END
GO

PRINT '`restore.sql` fin.'