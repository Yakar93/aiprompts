# Whisper Otomasyon Talimatları

Bu klasördeki **run_whisper.ps1** betiği, aşağıdaki adımları otomatik olarak yapar:

1. **Documents** ve **Downloads** klasörlerinizdeki (`*.m4a|*.mp3|*.wav|*.ogg|*.opus`) en yeni ses dosyasını bulur.
2. `ffmpeg` (sistemde kurulu olması gerekir) ile 16 kHz mono WAV (`C:\whisper\test.wav`) üretir.
3. `whisper-cli.exe` (model: `ggml-small.bin`) kullanarak Türkçe SRT dosyasını (`C:\whisper\test.srt`) oluşturur.

## Nasıl Çalıştırılır?
```powershell
# PowerShell'i yönetici olarak açın ve klasöre gidin
default> cd C:\path\to\workspace\automation
# İlk kez çalıştırıyorsanız, script'in çalışmasına izin verin
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
.
./run_whisper.ps1
```

## Windows Görev Zamanlayıcı (Task Scheduler) ile Otomatik Çalıştırma
1. **Görev Zamanlayıcı** → *Yeni Görev Oluştur* → *Genel* sekmesinde bir isim verin (ör. `WhisperAutomation`).
2. **Tetikleyiciler** → *Yeni* → Günlük, istediğiniz saati seçin.
3. **Eylemler** → *Yeni* → **Program/Script** alanına:
   ```
   powershell.exe
   ```
   **Argüman ekle (opsiyonel)** kısmına:
   ```
   -ExecutionPolicy Bypass -File "C:\path\to\workspace\automation\run_whisper.ps1"
   ```
4. *Koşullar* sekmesinde “Bilgisayar uyku modundayken çalıştır” gibi tercihleriniz varsa işaretleyin.
5. **Tamam** → Görevi kaydedin.

Bu şekilde, belirlediğiniz zaman dilimlerinde script otomatik olarak çalışacak ve `C:\whisper\test.srt` dosyası güncellenecektir. Yeni bir SRT oluştuğunda e‑posta veya başka bir uyarı eklemek isterseniz, script'i genişletebiliriz.
