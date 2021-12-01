Unblock-File #Verwijderd de downloaded status van een gedownload script



#Switch contstruct (keuze menu)
$choice = Read-Host -Prompt "Kies 1, 2 of 3: "
Switch ($choice) {
    1 { Write-Host "item 1" }
    2 { Write-Host "item 2" }
    3 { Write-Host "item 3" }
    Default { Write-Host "ongeldige optie" }
}