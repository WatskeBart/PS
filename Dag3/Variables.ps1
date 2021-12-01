$var1 = [string]$null #Geef de variabele $var1 een lege waarde
$var2 = "iets" #Geef de variabele $var2 de waarde 'iets'

#Voorbeeld van If Else statement om te kijken of de variabele een waarde bevat.
if ($var1) { write-host "Var1 heeft een waarde" } else { write-host "Var1 heeft geen waarde" } #Geef een melding of de variabele $var1 een waarde heeft
if ($var2) { write-host "Var2 heeft een waarde" } else { write-host "Var1 heeft geen waarde" } #Geef een melding of de variabele $var2 een waarde heeft

#Dubbele quotes "" variabele gebruiken in een stuk tekst
$var3 = "deze tekst"
Write-Host "De variabele var3 heeft de waarde: $var3"
#Enkele quotes '' variabele als tekst weergeven
Write-Host 'De variabele var3 wordt nu niet vertaald: $var3'

$var3.GetType() #Laat het type variabele zien, bijvoorbeeld String, Int32, Double, Bool etc.

[double]$var4 = 10.5 #Voorbeeld van het type Double (getal met decimalen)
$var4 #Laat waarde zien van variabele $var4
$var5 = $var4.ToString() #Zet de waarde van $var4 als type String in een nieuwe variabele $var5
$var5.GetType() #Laat zien dat de waarde nu van het type String is

$mijndatum = Get-Date #Stop de huidige datum tijd in een variabele $mijndatum
