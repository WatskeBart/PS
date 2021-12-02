#Voorbeeld van Write-Progress
for ($i = 1; $i -le 100; $i++ ) #Zet variabele $i op 1 en tel er iedere herhaling 1 bij op tot en met 100 (-le 100)
{
    Write-Progress -Activity "Search in Progress" -Status "$i% Complete:" -PercentComplete $i 
    Start-Sleep -Milliseconds 250
}

#Voorbeeld van Write-Progress met subtaken (sub loops)
foreach ( $i in 1..2 ) {
    Write-Progress -Id 0 "Step $i"
    foreach ( $j in 1..2 ) {
      Write-Progress -Id 1 -ParentId 0 "Step $i - Substep $j"
      foreach ( $k in 1..5 ) {
        Write-Progress -Id 2  -ParentId 1 "Step $i - Substep $j - iteration $k"; start-sleep -m 150
      }
    }
  }