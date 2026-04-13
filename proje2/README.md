# BLM4522 – Proje 2: Veritabanı Yedekleme ve Felaketten Kurtarma Planı

## Kullanılan Platform
- Microsoft SQL Server 2022
- SQL Server Management Studio (SSMS)
- Veritabanı: AdventureWorks2022

## Query Listesi ve Açıklamaları

| Dosya | Açıklama |
|-------|----------|
| Query1_RecoveryModel.sql | Recovery model FULL yapma ve kontrol |
| Query2_FullBackup.sql | Tam yedekleme (Full Backup) |
| Query3_DiffBackup.sql | Fark yedekleme (Differential Backup) |
| Query4_LogBackup.sql | Artık yedekleme (Log Backup) |
| Query5_Felaket.sql | Felaket simülasyonu – tüm DB siliniyor |
| Query6_Restore.sql | Full + Diff + Log ile DB geri yükleme |
| Query7_Kontrol.sql | Restore sonrası doğrulama |
| Query8_PointInTime.sql | Point-in-Time restore için veri bozma |
| Query8b_PointInTime_Restore.sql | Belirli bir zamana geri dönme |
| Query8c_PointInTime_Kontrol.sql | Point-in-Time restore doğrulama |
| Query9_Dogrulama.sql | Yedek dosyasının geçerliliğini test etme |
| Query10_Rapor.sql | Tüm yedek geçmişini raporlama |

## Yedekleme Stratejisi

- **Full Backup:** Veritabanının tamamı – haftalık alınır
- **Differential Backup:** Full'dan sonra değişenler – günlük alınır  
- **Log Backup:** Transaction logları – saatlik alınır

## Felaket Senaryoları

1. **Tüm DB silindi** → Full + Diff + Log restore ile kurtarıldı
2. **Veriler bozuldu** → Point-in-Time restore ile bozulmadan önceki ana dönüldü

## Yedek Dosyaları Konumu
```
C:\Backup\AdventureWorks\
├── AW_Full.bak
├── AW_Diff.bak
├── AW_Log1.bak
├── AW_Log2.bak
└── AW_Log3.bak
```
