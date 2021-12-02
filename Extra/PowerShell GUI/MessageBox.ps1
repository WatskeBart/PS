Add-Type -AssemblyName PresentationCore, PresentationFramework #Toevoegen van de juiste Assemblies
$msgBoxInput = [System.Windows.MessageBox]::Show('Maak een keuze', 'Keuze venster', 'YesNoCancel', 'Question') #Opmaken van het venster

#Switch statement om bij een bepaalde keuze een opdracht uit te voeren.
switch ($msgBoxInput) {

  'Yes' {

    Write-Host "Je hebt ja gekozen"

  }

  'No' {

    Write-Host "Je hebt nee gekozen"

  }

  'Cancel' {

    Write-Host "Je hebt annuleren gekozen"

  }

}