Get-Service | Out-File alleservices-TXT.txt #Schrijf alle informatie van Get-Service naar een tekstbestand genaamd 'alleservices.txt'

Get-Service > alleservices-TXT2.txt #Verkorte variant van bovenstaande. Gebruik >> om info toe te voegen aan een bestaand bestand (append)

Get-Service | Export-Csv alleservices-CSV.csv #Schrijf alle informatie van Get-Service naar een CSV (Comma Seperated Value) bestand

Get-Service | Export-Csv alleservices-CSV2.csv -NoTypeInformation #Zelfde als bovenstaand, maar zonder de eerste regel (onnodige informatie)

$import = Import-Csv alleservices-TXT3.txt #Zet alle info uit het CSV bestand in een variabele $import

Get-Service | Export-Clixml alleservices-XML.xml #Schrijf naar XML

Get-Service | ConvertTo-Json | Out-File alleservices-JSON.json #Converteer en schrijf naar JSON

Get-Service | ConvertTo-Html | Out-File alleservices-HTML.html #Converteer en schrijf naar HTML