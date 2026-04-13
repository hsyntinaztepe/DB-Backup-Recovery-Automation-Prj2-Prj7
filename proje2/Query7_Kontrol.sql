-- DB geri geldi mi
SELECT name, state_desc, recovery_model_desc
FROM sys.databases
WHERE name = 'AdventureWorks2022';

-- Tablolar yerinde mi
USE AdventureWorks2022;
SELECT COUNT(*) AS ToplamTablo
FROM INFORMATION_SCHEMA.TABLES;

-- Örnek veri kontrolü
SELECT TOP 5 * FROM Person.Address;