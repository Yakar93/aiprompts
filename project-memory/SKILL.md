---
name: project-memory
description: |
  Bu skill, oturum başladığında PLAN.md dosyasını ve JOURNAL.md'nin son 40 satırını okuyarak mevcut durumu Türkçe olarak özetler.
allowed-tools:
  - Read
---

## Talimatlar

1. `PLAN.md` dosyasının tam yolunu (`C:/whisper/memory/PLAN.md`) oku ve içeriğini bir değişkene kaydet.  
2. `JOURNAL.md` dosyasını aynı konumda aç, son 40 satırı (veya tüm dosyayı eğer daha azsa) al.  
3. Okunan bilgileri şu formatta bir mesaj olarak Bionic'e gönder:

   Şu anki durum: <PLAN içeriği>
   Son Günlük Girişleri:
   <JOURNAL son 40 satır>

4. Her tamamlanan adımda:  
- `PLAN.md` dosyasını güncelle (örnek: “Adım X tamamlandı” ekle).  
- `JOURNAL.md`'ye bir satır ekle:

   `YYYY-MM-DD | TITLE | KEYWORDS (Türkçe, English) | RESULT`

Bu skill, Bionic'in oturum başlangıcında otomatik olarak çalıştırılamasa da, `@project-memory` komutuyla manuel olarak tetiklenebilir.
