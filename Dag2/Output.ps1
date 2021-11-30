Get-Service | Out-File ./alleservices.txt #Schrijf alle informatie van Get-Service naar een tekstbestand genaamd 'alleservices.txt'

Get-Service > ./alleservices2.txt #Verkorte variant van bovenstaande

Get-Service | Export-Csv ./alleservices3.csv #Schrijf alle informatie van Get-Service naar een CSV (Comma Seperated Value) bestand

Get-Service | Export-Csv ./alleservices3.csv -NoTypeInformation #Zelfde als bovenstaand, maar zonder de eerste regel (onnodige informatie)