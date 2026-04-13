USE master;

-- Tüm DB'yi geri yükle
RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Full.bak'
WITH NORECOVERY, REPLACE, STATS = 10;

-- Differential backup'ı uygula
RESTORE DATABASE AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Diff.bak'
WITH NORECOVERY, STATS = 10;

-- Log backup'ı uygula ve DB'yi aç
RESTORE LOG AdventureWorks2022
FROM DISK = 'C:\Backup\AdventureWorks\AW_Log1.bak'
WITH RECOVERY, STATS = 10;