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
$mijndatum.DayOfWeek #Laat de dag van de week zien
$DTG = (Get-Date).ToUniversalTime().ToString(‘ddHHmm_yy_MMM’) #Zet de huidige tijd om naar UTC (Zulu) en zet deze in de variabele $DTG met de datumtijdgroep opmaak

$mijntekst = "Dit is mijn tekst. Fun fun fun!" #Zet tekst in een variabele
$mijntekst.Split() #Splits de tekst in de variabele op (wanneer je niets ingeeft splits PS op spaties)
$mijntekst.Split(".") #Splits de tekst in de variabele op gescheiden op de . (punt)

$mijnarray = "dit", "dat", "zus", "zo" #Stop deze woorden in een variabele als een array (lijst)
$mijnarray += "jassie kapot?" #Waarde toevoegen aan bestaande array
$mijnarray[2] #Laat de 3e waarde van de array zien (een array begint met tellen vanaf 0)
$mijnarray | Get-Member #Laat zien welke Methods en Properties de array beschikbaar heeft
$mijnarray.ToUpper() #Verander alle waarde in de array naar hoofdletters