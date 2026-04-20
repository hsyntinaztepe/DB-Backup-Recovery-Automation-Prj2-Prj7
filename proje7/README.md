# BLM4522 – Proje 7: Veritabanı Yedekleme ve Otomasyon Çalışması

## Kullanılan Platform
- Microsoft SQL Server 2022 Developer Edition
- SQL Server Management Studio (SSMS)
- Veritabanı: AdventureWorks2022

## Query Listesi ve Açıklamaları

| Dosya | Açıklama |
|-------|----------|
| Query1_BackupLog_Tablo.sql | BackupLog tablosunu oluşturma |
| Query2_Manuel_FullBackup.sql | Manuel tam yedek alma |
| Query3_AutoBackup_Procedure.sql | sp_AutoBackup prosedürünü oluşturma |
| Query4_Procedure_Test.sql | Full ve Differential prosedür testi |
| Query5_AgentJob_Olustur.sql | SQL Server Agent Job ve zamanlama kurulumu |
| Query6_AgentJob_Calistir.sql | Job'u manuel tetikleme |
| Query7_Job_Gecmis_Kontrol.sql | Job çalışma geçmişini sorgulama |
| Query8_Raporlama.sql | Günlük özet, son 10 yedek, msdb raporu |
| Query9_Dogrulama.sql | RESTORE VERIFYONLY ile yedek doğrulama |
| Query10_BackupLog_Goruntule.sql | BackupLog tablosunun tamamını görüntüleme |
| Query11_VerifyOnly_Dogrula.sql | Son yedek dosyasını doğrulama |

## Otomasyon Stratejisi

- **sp_AutoBackup:** `@BackupType` parametresiyle Full veya Differential yedek alır, sonucu `BackupLog` tablosuna kaydeder
- **SQL Server Agent Job:** Her gün saat 02:00'de otomatik Full yedek çalıştırır
- **BackupLog Tablosu:** Her yedekleme için tarih, dosya yolu, durum, boyut ve hata mesajı kaydeder

## Test Senaryoları

1. **Normal yedekleme** → Full ve Differential prosedür çalıştırıldı, BackupLog'a BAŞARILI kaydı düştü
2. **Hata senaryosu** → `C:\Backups` klasörü silindi, prosedür çalıştırıldı, BackupLog'a HATA kaydı düştü
3. **Agent Job testi** → Job manuel tetiklendi, sysjobhistory tablosundan BAŞARILI sonucu doğrulandı

## Yedek Dosyaları Konumu
```
C:\Backups\
├── AW_Full_Manuel.bak
├── AW_FULL_2026-04-20_12-19-29.bak
├── AW_DIFF_2026-04-20_12-19-30.bak
└── AW_FULL_2026-04-20_12-22-13.bak
```

## BackupLog Tablosu Yapısı

| Sütun | Tür | Açıklama |
|-------|-----|----------|
| LogID | INT IDENTITY | Otomatik artan birincil anahtar |
| BackupDate | DATETIME | Yedekleme tarihi ve saati |
| FilePath | NVARCHAR(500) | Yedek dosyasının tam yolu |
| Status | NVARCHAR(20) | BAŞARILI veya HATA |
| FileSizeMB | FLOAT | Yedek boyutu (MB) |
| DurationSec | INT | İşlem süresi (saniye) |
| ErrorMsg | NVARCHAR(1000) | Hata açıklaması (varsa) |
