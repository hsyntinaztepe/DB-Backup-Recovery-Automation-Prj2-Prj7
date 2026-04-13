USE master;

-- Full backup geçerli mi
RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AdventureWorks\AW_Full.bak';

-- Backup detayları
RESTORE HEADERONLY
FROM DISK = 'C:\Backup\AdventureWorks\AW_Full.bak';

-- Backup içindeki dosya listesi
RESTORE FILELISTONLY
FROM DISK = 'C:\Backup\AdventureWorks\AW_Full.bak';