USE AdventureWorks2022;
GO

BACKUP DATABASE AdventureWorks2022
TO DISK = 'C:\Backups\AW_Full_Manuel.bak'
WITH FORMAT, INIT,
     NAME = 'Manuel Tam Yedek',
     STATS = 10;