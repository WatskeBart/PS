###Opdracht Dag 5
#Check alle NTFS disk op vrije ruimte
#Geef een output in het blauw bij genoeg vrije ruimte
#Geef een output in het geel bij vrije ruimte minder dan 20GB
#Geef een output in het geel bij vrije ruimte minder dan 10GB
#Zorg dat in de output de driveletters in oplopende volgorde worden weergegeven

$disks = Get-Volume | Where-Object { $_.FileSystemType -eq "NTFS" -and $_.DriveLetter -ne "" } | Sort-Object -Property DriveLetter

foreach ($disk in $disks) {
    If ($disk.SizeRemaining -ge 20GB) { Write-Host -BackgroundColor Blue "Genoeg ruimte op: $($disk.DriveLetter), namelijk: $($disk.SizeRemaining)" }
    elseif ($disk.SizeRemaining -le 10GB) { Write-Host -BackgroundColor Red "Schijfruimte kritiek op: $($disk.DriveLetter), namelijk: $($disk.SizeRemaining)" }
    elseif ($disk.SizeRemaining -le 20GB) { Write-Host -BackgroundColor Yellow "Niet genoeg ruimte op: $($disk.DriveLetter), namelijk: $($disk.SizeRemaining)" }
}