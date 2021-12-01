function EasyView { process { $_; Start-Sleep -seconds 1.5}} #Aanmaken van een functie waardoor iedere regel met een vertraging van 1.5 seconde wordt weergegeven

Get-ChildItem C:\temp | EasyView #Laat de inhoud van C:\Temp zien en pipe deze naar de functie EasyView

#Gebruik CTRL+C om het commando te stoppen indien dit te lang duurt