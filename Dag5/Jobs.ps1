Start-Job -Name MijnJob -ScriptBlock { Dir } #Voer de opdracht uit zoals in het ScriptBlock staat, als een achtergrond Job met de naam MijnJob

Invoke-Command -ScriptBlock { Get-Service } -ComputerName PC1 -AsJob #Hetzelfde als bovenstaand, maar dan op een remote machine

Get-Job #Weergeven van alle Jobs

Get-Job -Name MijnJob #Laat alleen MijnJob zien

#Voorbeeld van een loop als een Job
Start-Job -Name MijnJob -ScriptBlock {For ($i = 1; $i -lt 100; $i++){ <#Loop van 1 t/m 100#>
    Sleep 0.5 <#Wacht een halve seconde tussen iedere herhaling in de loop#>
}
Write-Host "Job is klaar" <#Geef de tekst "Job is klaar" weer als de Job is afgerond#>
}

Receive-Job -Name MijnJob #Haal de eventuele output op van jouw Job, in dit geval "Job is klaar"
#Wanneer je nu het commando Get-Job uitvoerd, zie je in de kolom HasMoreData False staan. Dit geeft aan dat de output als eerder is