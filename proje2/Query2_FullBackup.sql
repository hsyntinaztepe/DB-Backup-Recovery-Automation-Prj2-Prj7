USE master;

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Backup\AdventureWorks\AW_Full.bak'
WITH FORMAT, INIT,
     NAME = 'AW Full Backup',
     DESCRIPTION = 'Tam yedekleme',
     STATS = 10;