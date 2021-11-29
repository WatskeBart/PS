$mijnservices = Get-Service #Stop alle services in een variabele

$mijnservices[0] #Laat de eerste services in de variabele lijst zien

$mijnservices[0] | get-member #Laat alle beschikbare members zien van de eerste service

$mijnservices[0].DisplayName #Laat de DisplayName zien van de eerste service, waarbij DisplayName een Property (member) is van de service

$mijnservices | where {$_.Status -eq 'running'} #Laat alle services zien waar de status 'running' is

$mijnservices | Sort-Object -Property Status -Descending #Sorteer alle services op de Property status aflopend

$mijnservices | Group-Object -Property Status #Groepeer alle services op Status

$mijnservices | Select-Object -First 5 #Laat de eerste 5 services zien

$mijnservices | Select-Object -Property Status, DisplayName #Laat alleen de Status en DisplayName zien van de services