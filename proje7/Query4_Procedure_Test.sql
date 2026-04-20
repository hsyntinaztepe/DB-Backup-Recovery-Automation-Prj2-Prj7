-- Tam yedek testi
EXEC sp_AutoBackup @BackupType = 'FULL';

-- Diferansiyel yedek testi
EXEC sp_AutoBackup @BackupType = 'DIFF';

-- Log tablosunu kontrol et
SELECT * FROM BackupLog;