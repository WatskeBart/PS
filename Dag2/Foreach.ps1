$mijnservices = Get-Service #Zet alle services in de variabele $mijnservices

ForEach ($service in $mijnservices) {
    Write-Host $service
} #Voor iedere service in de variabele $mijnservices, laat de default parameter (-Name) zien dmv Write-Host