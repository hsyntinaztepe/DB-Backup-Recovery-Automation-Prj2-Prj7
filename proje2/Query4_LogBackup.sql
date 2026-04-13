USE master;

BACKUP LOG AdventureWorks2022
TO DISK = 'C:\Backup\AdventureWorks\AW_Log1.bak'
WITH NAME = 'AW Log Backup 1',
     STATS = 10;