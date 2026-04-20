USE AdventureWorks2022;
GO

CREATE PROCEDURE sp_AutoBackup
    @BackupType NVARCHAR(10) = 'FULL'
AS
BEGIN
    DECLARE @path NVARCHAR(500)
    DECLARE @date NVARCHAR(50)
    DECLARE @start DATETIME = GETDATE()
    DECLARE @size FLOAT

    SET @date = REPLACE(REPLACE(CONVERT(NVARCHAR, GETDATE(), 120), ':', '-'), ' ', '_')
    SET @path = 'C:\Backups\AW_' + @BackupType + '_' + @date + '.bak'

    BEGIN TRY
        IF @BackupType = 'FULL'
            BACKUP DATABASE AdventureWorks2022
            TO DISK = @path
            WITH FORMAT, STATS = 10;
        ELSE
            BACKUP DATABASE AdventureWorks2022
            TO DISK = @path
            WITH DIFFERENTIAL, STATS = 10;

        SELECT @size = backup_size / 1024.0 / 1024.0
        FROM msdb.dbo.backupset
        WHERE database_name = 'AdventureWorks2022'
        ORDER BY backup_finish_date DESC
        OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

        INSERT INTO BackupLog (FilePath, Status, FileSizeMB, DurationSec)
        VALUES (@path, 'BAŞARILI', @size, DATEDIFF(SECOND, @start, GETDATE()));

        PRINT 'Yedekleme başarılı: ' + @path;
    END TRY
    BEGIN CATCH
        INSERT INTO BackupLog (FilePath, Status, DurationSec, ErrorMsg)
        VALUES (@path, 'HATA', DATEDIFF(SECOND, @start, GETDATE()), ERROR_MESSAGE());

        PRINT 'HATA: ' + ERROR_MESSAGE();
    END CATCH
END;
GO