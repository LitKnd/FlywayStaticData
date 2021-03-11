TRUNCATE TABLE dbo.Hello;
GO

BULK INSERT dbo.hello
FROM '${staticdata}\Hello.dat'
WITH 
  (
    FIRSTROW=1,
    DATAFILETYPE = 'char',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\r\n'
  );
 
 SELECT count(*) as [rows in dbo.hello] FROM dbo.hello;

-- add into config file: flyway.placeholders.staticdata=C:\Git\FlywayStaticData\data

-- Or to specify in a migration command line (overrides config):
-- flyway "-placeholders.staticdata=C:\Git\FlywayStaticData\data" migrate

-- Placeholder flyway.workingFolder coming in the next version!