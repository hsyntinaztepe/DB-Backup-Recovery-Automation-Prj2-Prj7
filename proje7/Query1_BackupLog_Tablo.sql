USE AdventureWorks2022;
GO

CREATE TABLE BackupLog (
    LogID INT IDENTITY PRIMARY KEY,
    BackupDate DATETIME DEFAULT GETDATE(),
    FilePath NVARCHAR(500),
    Status NVARCHAR(20),
    FileSizeMB FLOAT,
    DurationSec INT,
    ErrorMsg NVARCHAR(1000)
);