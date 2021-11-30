Get-PSProvider #Overzicht van beschikbare PSProviders

Get-PSDrive #Overzicht van beschikbare PSDrives

Get-Help about_FileSystem_Provider #Informatie over de PSProvider 'FileSystem'

New-PSDrive -Name WinDir -Root C:Windows -PSProvider FileSystem #Aanmaken van WinDir als PSProvider

Get-ChildItem WinDir: #Ga naar de PSProvider WinDir (C:\Windows)
#of
cd WinDir:

Set-Location HKCU: #Ga naar de registry HKEY Current User

New-Item -Name 'TestKey' #Maak een nieuwe map in het register met de naam TestKey

New-ItemProperty -Path HKCU:\TestKey\ -Name 'TestKey' -Value 'TESTWAARDE' #Geef de sleutel TestKey de waarde 'TESTWAARDE'