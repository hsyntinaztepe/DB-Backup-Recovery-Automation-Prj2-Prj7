-- Job çalıştı mı?
USE msdb;
GO

SELECT 
    j.name AS JobAdi,
    h.run_date AS Tarih,
    h.run_time AS Saat,
    CASE h.run_status
        WHEN 0 THEN 'HATA'
        WHEN 1 THEN 'BAŞARILI'
        WHEN 3 THEN 'İPTAL'
    END AS Durum,
    h.message AS Mesaj
FROM sysjobs j
JOIN sysjobhistory h ON j.job_id = h.job_id
WHERE j.name = 'AW_Otomatik_Yedekleme'
ORDER BY h.run_date DESC, h.run_time DESC;