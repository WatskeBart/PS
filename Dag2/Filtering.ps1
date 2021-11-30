Get-Service | Where-Object -Filter {$PSItem.Status -eq 'Running'} #Filter alle service op Status 'Running'

(Get-Service | Where-Object -Filter {$PSItem.Status -eq 'Running'}).count #Het aantal serivces met de Status 'Running'

Get-Service | ? {$_.Status -eq 'Running'} #Dezelfde filtering maar verkorte versie

$mijnservices = Get-Service #Zet alle services in een variabele $mijnservices

$mijnservices | ? {$_.Status -eq 'Running' -and $_.StartType -eq 'Automatic'} #Laat alle services zien met de Status 'Running' en de StartType 'Automatic'

# $PSItem. is hetzelfde als $_.