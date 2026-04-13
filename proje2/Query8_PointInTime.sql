-- Önce yeni bir log backup al
USE master;
BACKUP LOG AdventureWorks2022
TO DISK = 'C:\Backup\AdventureWorks\AW_Log2.bak'
WITH NAME = 'AW Log Backup 2',
     STATS = 10;

-- Şimdi bazı verileri boz
USE AdventureWorks2022;
UPDATE Person.Address 
SET AddressLine1 = 'BOZUK ADRES ' + CAST(AddressID AS NVARCHAR)
WHERE AddressID BETWEEN 1 AND 10;

-- Bozuldu mu kontrol et
SELECT AddressID, AddressLine1 
FROM Person.Address 
WHERE AddressID BETWEEN 1 AND 10;

-- Felaket sonrası log backup al
USE master;
BACKUP LOG AdventureWorks2022
TO DISK = 'C:\Backup\AdventureWorks\AW_Log3.bak'
WITH NAME = 'Felaket Sonrasi Log',
     STATS = 10;