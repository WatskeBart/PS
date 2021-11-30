New-Item -Type Directory -Path "C:\testfolder" #Maak map aan
$acl = Get-Acl "c:\testfolder" #Haal huidige ACL op van de map en zet in variabele
$ar = New-Object System.Security.AccessControl.FileSystemAccessRule("accountnaam", "FullControl", "Allow") #Variable met de te zetten rechten
$acl.SetAccessRule($ar) #Zet rechten op de variabele
Set-Acl -Path "c:\testfolder" -AclObject $acl #Plaats ACL op de map
