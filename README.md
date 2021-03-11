# FlywayStaticData

This is a demo of a simple approach to reloading static data tables in SQL Server with Flyway

* migrations\afterMigrate__staticDataAhoy.sql  - a simple inline method in TSQL
* migrations\afterMigrate__staticDataHello.sql - a bulk load method in TSQL referencing data\Hello.dat
* migrations\afterMigrate__staticDataThere - three files showing a bulk load method using a combination of TSQL, a script migration to call bcp.exe, and a final TSQL file
