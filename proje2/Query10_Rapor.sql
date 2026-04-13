USE msdb;

SELECT 
    database_name AS VeritabaniAdi,
    backup_start_date AS BaslangicZamani,
    backup_finish_date AS BitisZamani,
    DATEDIFF(SECOND, backup_start_date, backup_finish_date) AS SureSaniye,
    CASE type 
        WHEN 'D' THEN 'Tam Yedek'
        WHEN 'I' THEN 'Fark Yedek'
        WHEN 'L' THEN 'Log Yedek'
    END AS YedekTuru,
    CAST(backup_size/1024/1024 AS INT) AS BoyutMB
FROM backupset
WHERE database_name = 'AdventureWorks2022'
ORDER BY backup_start_date DESC;