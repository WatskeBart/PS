$mijnservices = Get-Service #Stop alle services in een variabele
$mijnservices[0] #Laat de eerste services in de variabele lijst zien
$mijnservices[0] | get-member #Laat alle beschikbare members zien van de eerste service
$mijnservices[0].DisplayName #Laat de DisplayName zien van de eerste service, waarbij DisplayName een Property (member) is van de service