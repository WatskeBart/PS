Get-Service | Where-Object -Filter {$PSItem.Status -eq 'Running'} #Filter alle service op Status 'Running'

(Get-Service | Where-Object -Filter {$PSItem.Status -eq 'Running'}).count #Het aantal serivces met de Status 'Running'

Get-Service | ? {$_.Status -eq 'Running'} #Dezelfde filtering maar verkorte versie

$mijnservices = Get-Service #Stop alle services in een variabele $mijnservices

$mijnservices | ? {$_.Status -eq 'Running' -and $_.StartType -eq 'Automatic'}