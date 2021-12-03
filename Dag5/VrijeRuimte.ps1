###Opdracht Dag 5
#Check alle NTFS disk op vrije ruimte
#Geef een output in het blauw bij genoeg vrije ruimte
#Geef een output in het geel bij vrije ruimte minder dan 20GB
#Geef een output in het geel bij vrije ruimte minder dan 10GB
#Zorg dat in de output de driveletters in oplopende volgorde worden weergegeven

Clear-Host

$disks = Get-Volume | Where-Object { $_.FileSystemType -eq "NTFS" -and $_.DriveLetter -ne $null } | Sort-Object -Property DriveLetter

foreach ($disk in $disks) {
    if ($disk.SizeRemaining -le 10GB) {
        Write-Host -BackgroundColor Red "Schijfruimte kritiek op: $($disk.DriveLetter) Vrije ruimte: $([math]::Round($disk.SizeRemaining / 1GB))GB"
    }
    elseif ($disk.SizeRemaining -le 20GB) {
        Write-Host -BackgroundColor Yellow "Niet genoeg ruimte op: $($disk.DriveLetter) Vrije ruimte: $([math]::Round($disk.SizeRemaining / 1GB))GB"
    }
    elseif ($disk.SizeRemaining -ge 20GB) {
        Write-Host -BackgroundColor Blue "Genoeg ruimte op: $($disk.DriveLetter) Vrije ruimte: $([math]::Round($disk.SizeRemaining / 1GB))GB"
    }
}