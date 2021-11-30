Get-PSProvider #Overzicht van beschikbare PSProviders

Get-PSDrive #Overzicht van beschikbare PSDrives

Get-Help about_FileSystem_Provider #Informatie over de PSProvider 'FileSystem'

New-PSDrive -Name WinDir -Root C:Windows -PSProvider FileSystem #Aanmaken van WinDir als PSProvider

Get-ChildItem WinDir: #Ga naar de PSProvider WinDir (C:\Windows)
#of
cd WinDir:

## Bewerken van het register via PSDrive
Set-Location HKCU: #Ga naar de registry HKEY Current User

New-Item -Name 'TestKey' #Maak een nieuwe map in het register met de naam TestKey

New-ItemProperty -Path HKCU:\TestKey\ -Name 'TestKey' -Value 'TESTWAARDE' #Geef de sleutel TestKey de waarde 'TESTWAARDE'

## Bewerken van gebruikers in Active Directory via een nieuwe PSDrive 
New-PSDrive -Name AdatumUsers -Root "CN=Users,DC=AdatumDC=com" -PSProvider ActiveDirectory #Maak een nieuwe PSDrive aan met de naam 'AdatumUsers' gekoppeld aan de OU users

Set-Location AdatumUsers: #Ga naar de nieuwe PSDrive

Get-ChildItem #Overzicht van aanwezige gebruikers en groepen

New-Item -ItemType user -Path . -Name 'TestGebruiker' #Maak een gebruiker aan met de naam 'TestGebruiker'