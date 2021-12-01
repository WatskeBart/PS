Unblock-File #Verwijderd de downloaded status van een gedownload script

#If Else statement (als dit, dan dat)
$mijnservice = Get-Service -Name W32Time #Plaats de service W32Time in de variabele $mijnservice
If ($mijnservice.Status -eq 'Running') {
    Write-Host "Mijn service is gestart"
} else {
    Write-Host "Mijn service draait niet"
} #Als de service gestart is geef dan een melding dat deze gestart is en anders een melding dat deze niet gestart is

#Switch contstruct (keuze menu)
$choice = Read-Host -Prompt "Kies 1, 2 of 3: "
Switch ($choice) {
    1 { Write-Host "item 1" }
    2 { Write-Host "item 2" }
    3 { Write-Host "item 3" }
    Default { Write-Host "ongeldige optie" }
}