# BLM4522 – Ağ Tabanlı Paralel Dağıtım Sistemleri

Bu repo, BLM4522 dersi kapsamında hazırlanan proje çalışmalarını içermektedir.  
Projeler **AdventureWorks2022** örnek veritabanı kullanılarak gerçekleştirilmiştir.

https://learn.microsoft.com/tr-tr/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms

---

## 📁 Proje Dizinleri

### [📂 proje2](./proje2)
**Veritabanı Yedekleme ve Felaketten Kurtarma Planı**

AdventureWorks2022 veritabanı üzerinde kapsamlı bir yedekleme stratejisi oluşturulmuş ve felaketten kurtarma senaryoları uygulanmıştır.

- Full, Differential ve Transaction Log yedeklemeleri
- Felaket simülasyonu (DROP DATABASE) ve geri yükleme
- Point-in-Time Restore ile belirli bir zamana geri dönme
- RESTORE VERIFYONLY ile yedek doğrulama
- msdb üzerinden yedekleme geçmişi raporlama

---

### [📂 proje7](./proje7)
**Veritabanı Yedekleme ve Otomasyon Çalışması**

Yedekleme işlemleri T-SQL ile otomatikleştirilmiş, SQL Server Agent ile zamanlanmış ve sonuçlar raporlanmıştır.

- `BackupLog` tablosu ile yedekleme geçmişi takibi
- `sp_AutoBackup` stored procedure (Full / Differential)
- SQL Server Agent Job ile günlük 02:00 otomatik yedekleme
- Hata senaryosu testi ve log kaydı
- Günlük özet ve msdb raporlama sorguları

---

## 🛠️ Kullanılan Teknolojiler

| Araç | Versiyon |
|------|----------|
| SQL Server | 2022 Developer Edition |
| SSMS | 20 |
| Veritabanı | AdventureWorks2022 |

---

## 📄 Rapor

Projelere ait detaylı rapor `BLM4522_21290360_HuseyinTinaztepe_VizeRaporu.pdf` dosyasında bulunmaktadır.
