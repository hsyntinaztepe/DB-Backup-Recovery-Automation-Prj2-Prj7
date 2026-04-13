-- Önce birkaç veri değiştir
USE AdventureWorks2022;
UPDATE Person.Address 
SET ModifiedDate = GETDATE() 
WHERE AddressID BETWEEN 1 AND 100;

-- Differential backup al
USE master;
BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Backup\AdventureWorks\AW_Diff.bak'
WITH DIFFERENTIAL,
     NAME = 'AW Differential Backup',
     STATS = 10;