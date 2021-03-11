/* Considerations:
Security for BULK insert from a pipeline may be a bit fiddly, depending on which style of 
authentication you are using and where the data file is located in relation to the SQL Server
See - https://docs.microsoft.com/en-us/sql/relational-databases/import-export/import-bulk-data-by-using-bulk-insert-or-openrowset-bulk-sql-server?view=sql-server-2017#security-considerations
*/

TRUNCATE TABLE dbo.Hello;
GO

BULK INSERT dbo.hello
FROM '${staticdata}\Hello.dat'
WITH 
  (
    FIRSTROW=1,
    DATAFILETYPE = 'char',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
  );
 
 SELECT count(*) as [rows in dbo.hello] FROM dbo.hello;

-- add into config file: flyway.placeholders.staticdata=C:\Git\FlywayStaticData\data

-- Or to specify in a migration command line (overrides config):
-- flyway "-placeholders.staticdata=C:\Git\FlywayStaticData\data" migrate

-- Placeholder flyway.workingFolder coming in the next version!