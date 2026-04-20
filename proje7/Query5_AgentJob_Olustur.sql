USE msdb;
GO

-- Job oluştur
EXEC sp_add_job @job_name = N'AW_Otomatik_Yedekleme';

-- Step ekle
EXEC sp_add_jobstep
    @job_name = N'AW_Otomatik_Yedekleme',
    @step_name = N'Tam Yedek Al',
    @subsystem = N'TSQL',
    @database_name = N'AdventureWorks2022',
    @command = N'EXEC sp_AutoBackup @BackupType = ''FULL''';

-- Zamanlama: Her gün 02:00
EXEC sp_add_schedule
    @schedule_name = N'HerGunSaat2',
    @freq_type = 4,
    @freq_interval = 1,
    @active_start_time = 020000;

-- Job'a bağla
EXEC sp_attach_schedule
    @job_name = N'AW_Otomatik_Yedekleme',
    @schedule_name = N'HerGunSaat2';

EXEC sp_add_jobserver
    @job_name = N'AW_Otomatik_Yedekleme';