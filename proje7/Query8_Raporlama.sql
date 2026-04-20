USE AdventureWorks2022;
GO

-- Günlük özet rapor
SELECT
    CONVERT(DATE, BackupDate) AS Tarih,
    COUNT(*) AS ToplamYedek,
    SUM(CASE WHEN Status = 'BAŞARILI' THEN 1 ELSE 0 END) AS Basarili,
    SUM(CASE WHEN Status = 'HATA' THEN 1 ELSE 0 END) AS Hatali,
    AVG(FileSizeMB) AS OrtBoyutMB,
    AVG(DurationSec) AS OrtSureSaniye
FROM BackupLog
GROUP BY CONVERT(DATE, BackupDate)
ORDER BY Tarih DESC;

-- Son 10 yedek
SELECT TOP 10 * FROM BackupLog ORDER BY BackupDate DESC;

-- Tüm yedekleme geçmişi (msdb'den)
SELECT TOP 10
    database_name,
    backup_start_date,
    backup_finish_date,
    backup_size / 1024 / 1024 AS SizeMB,
    CASE type
        WHEN 'D' THEN 'Tam Yedek'
        WHEN 'I' THEN 'Diferansiyel'
        WHEN 'L' THEN 'Log Yedeği'
    END AS YedekTipi
FROM msdb.dbo.backupset
WHERE database_name = 'AdventureWorks2022'
ORDER BY backup_finish_date DESC;