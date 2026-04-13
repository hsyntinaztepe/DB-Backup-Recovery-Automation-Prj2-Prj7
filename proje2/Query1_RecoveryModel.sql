USE master;

-- Recovery model FULL yap
ALTER DATABASE AdventureWorks2022 SET RECOVERY FULL;
ALTER DATABASE AdventureWorks2022 SET MULTI_USER;

-- Kontrol et
SELECT name, recovery_model_desc, user_access_desc
FROM sys.databases 
WHERE name = 'AdventureWorks2022';