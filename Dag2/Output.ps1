Get-Service | Out-File ./alleservices.txt #Schrijf alle informatie van Get-Service naar een tekstbestand genaamd 'alleservices.txt'

Get-Service > ./alleservices2.txt #Verkorte variant van bovenstaande

Get-Service | Export-Csv ./alleservices3.csv #Schrijf alle informatie van Get-Service naar een CSV (Comma Seperated Value) bestand

Get-Service | Export-Csv ./alleservices3.csv -NoTypeInformation #Zelfde als bovenstaand, maar zonder de eerste regel (onnodige informatie)

$import = Import-Csv ./alleservices.txt #Zet alle info uit het CSV bestand in een variabele $import

Get-Service | Export-Clixml ./alleservices4.xml #Schrijf naar XML

Get-Service | ConvertTo-Json | Out-File ./alleservices5.json #Converteer en schrijf naar JSON

Get-Service | ConvertTo-Html | Out-File ./alleservices6.html #Converteer en schrijf naar HTML