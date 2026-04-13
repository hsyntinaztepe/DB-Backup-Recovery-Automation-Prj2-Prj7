USE master;

ALTER DATABASE AdventureWorks2022 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Full.bak'
WITH NORECOVERY, REPLACE, STATS = 10;

RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Diff.bak'
WITH NORECOVERY, STATS = 10;

RESTORE LOG AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Log1.bak'
WITH NORECOVERY, STATS = 10;

RESTORE LOG AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Log2.bak'
WITH NORECOVERY, STATS = 10;

-- Bozulmadan önceki zamana dön (kendi zamanını yaz)
RESTORE LOG AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Log3.bak'
WITH RECOVERY, STOPAT = '2026-04-13 22:10:00';

ALTER DATABASE AdventureWorks2022 SET MULTI_USER;