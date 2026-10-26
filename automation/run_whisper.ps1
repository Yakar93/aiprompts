# Run Whisper Automation
# Bu script en yeni ses dosyasını bulur, ffmpeg ile 16kHz mono WAV'e çevirir ve Whisper CLI ile SRT üretir.
# Windows PowerShell ortamında çalıştırılmalıdır.

$docPath = Join-Path $env:USERPROFILE "Documents"
$downloadPath = Join-Path $env:USERPROFILE "Downloads"

# Aranacak uzantılar (case‑insensitive)
$extensions = @('*.m4a','*.mp3','*.wav','*.ogg','*.opus')

# En yeni ses dosyasını bul
$newest = Get-ChildItem -Path $docPath,$downloadPath -Recurse -File -Include $extensions |
    Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $newest) {
    Write-Host "Ses dosyası bulunamadı."
    exit 1
}

# ffmpeg tam yolunu al (where.exe kullanır)
$ffmpegPath = (where.exe ffmpeg).Trim()
if (-not $ffmpegPath) {
    Write-Host "ffmpeg bulunamadı."
    exit 1
}

$outWav = "C:\whisper\test.wav"
# -y: var olan dosyayı üzerine yaz
& $ffmpegPath -y -i $newest.FullName -ar 16000 -ac 1 $outWav

# Whisper‑CLI çalıştır
$whisperExe = "C:\whisper\Release\whisper-cli.exe"
$modelPath   = "C:\whisper\models\ggml-small.bin"
& $whisperExe -m $modelPath -l tr -osrt -of C:\whisper\test -f $outWav

Write-Host "Tamamlandı. SRT dosyası: C:\whisper\test.srt"