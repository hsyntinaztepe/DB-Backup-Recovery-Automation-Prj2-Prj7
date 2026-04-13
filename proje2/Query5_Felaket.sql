USE master;

-- Felaket öncesi zamanı not al
SELECT GETDATE() AS FelaketOncesiZaman;

-- Bağlantıları kes
ALTER DATABASE AdventureWorks2022 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- Tüm DB'yi düşür
DROP DATABASE AdventureWorks2022;

-- Silindi mi kontrol et (boş gelmeli)
SELECT name FROM sys.databases 
WHERE name = 'AdventureWorks2022';