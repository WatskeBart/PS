Unblock-File #Verwijderd de downloaded status van een gedownload script

#If Else statement (als dit, dan dat)
$mijnservice = Get-Service -Name W32Time #Plaats de service W32Time in de variabele $mijnservice
If ($mijnservice.Status -eq 'Running') {
    Write-Host "Mijn service is gestart"
} else {
    Write-Host "Mijn service draait niet"
} #Als de service gestart is geef dan een melding dat deze gestart is en anders een melding dat deze niet gestart is

#Switch contstruct (keuze menu)
$choice = Read-Host -Prompt "Kies 1, 2 of 3: " #Plaats de keuze in de variabele $choice
Switch ($choice) {
    1 { Write-Host "item 1" }
    2 { Write-Host "item 2" }
    3 { Write-Host "item 3" }
    Default { Write-Host "ongeldige optie" }
}

#Loop door nummers 1 t/m 10 en geeft een melding bij iedere iteratie
For($i=1;$i -le 10; $i++){
    Write-Host "Wij zijn bij stap $i"
}

#Voorbeeld van Continue (sla een iteratie over, in dit voorbeeld stap 6)
For($i=1;$i -le 10; $i++){
    If ($i -eq 6) {Continue}
    Write-Host "Wij zijn bij stap $i"
}

#Voorbeeld van Break (stop de loop bij stap 7)
For($i=1;$i -le 10; $i++){
    If ($i -eq 7) {Break}
    Write-Host "Wij zijn bij stap $i"
}

#Voorbeeld Out-GridView
$mijnservices = Get-Service #Plaats alle services in de variabele $mijnservices
$selectservice = $mijnservices | Out-GridView -PassThru #Open de inhoud van de variabele $mijnservices in een GUI tabel en plaats de gekozen service terug in de variabele $selectservice
$selectservice #Toon de waarde van variabele $selectservice

#Breakpoints in een script
Set-PSBreakpoint -Line 2 -Script "MijnScript.ps1" #Zet een breakpoint (pauze) op regel 2 van MijnScript.ps1
Set-PSBreakpoint -Command "Set-ADUser" -Script MijnScript.ps1 #Zet een breakpoint (pauze) op het eerste cmdlet "Set-ADUser" van MijnScript.ps1

Get-Service -ErrorAction Stop #Stop het uitvoeren van het commando zodra er een error optreedt

$ErrorActionPreference = 'Stop' #Zet dit bovenin je script om het script te stoppen, zodra er een error optreedt