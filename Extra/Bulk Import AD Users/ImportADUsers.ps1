## Importeer gebruikers vanuit een CSV bestand.
## Zie voorbeeld CSV bestand (Gebruikers.csv)
## Start het script met parameters -CSVFile -UserDomain -OUPath, en de bijbehorende waarden of start het script zonder parameters en deze zullen dan interactief gevraagd worden.

#Bepaalde parameters verplichten voor de werking van het script.
param (
	[Parameter(Mandatory=$true)][string]$CSVFile,
	[Parameter(Mandatory=$true)][string]$UserDomain,
	[Parameter(Mandatory=$true)][string]$OUPath
)

#Controleer of het opgegeven CSV pad geldig is.
$CheckCSV = Test-Path $CSVFile

#Waarschuwing weergeven wanneer het CSV pad ongeldig is.
If (-not $CheckCSV) {Write-Host -BackgroundColor Black -ForegroundColor Yellow 'Controleer het pad naar het CSV bestand en probeer het opnieuw!'; exit}

#Controleer of het opgegeven OU pad geldig is.
[string] $Path = $OUPath
try {
    $ou_exists = [adsi]::Exists("LDAP://$Path")
} catch {
    Throw("Het opgegeven OU pad is ongeldig.`n$_")
}

if (-not $ou_exists) {
    Throw('Het opgegeven OU pad bestaat niet..')
}

#Samenvatting weergeven van de ingegeven waarden.
write-host 'CSV bestand is: ' $CSVFile
write-host 'User Domain is: ' $UserDomain
write-host 'OU pad is: ' $OUPath

#Bevestigen van de ingegeven waarden om verder te gaan met het script.
$confirmation = Read-Host "Kloppen deze gegevens? Typ 'correct' om door te gaan (zonder aanhalingstekens)"
if ($confirmation -cne 'correct') {
    exit
}

### DIT VERWIJDEREN NADAT HET BOVENSTAANDE GETEST IS
pause
exit
### VERWIJDEREN VERWIJDEREN VERWIJDEREN

#Importeer de AD module
Import-Module activedirectory

#Zet alle gebruikers uit het CSV bestand in de variabele $ADUsers
$ADUsers = Import-csv $CSVFile

#Herhaal alle onderstaande stappen voor iedere gebruiker in de variabele $ADUsers
foreach ($User in $ADUsers)
{
		
	$Username 	= $User.username
	$Password 	= $User.password
	$Firstname 	= $User.firstname
	$Lastname 	= $User.lastname
    $email      = $User.email
    $telephone  = $User.telephone
    $company    = $User.company
    $department = $User.department
    $Password	= $User.Password


	#Controleer of gebruiker al bestaat
	if (Get-ADUser -F {SamAccountName -eq $Username})
	{
		 #Waarschuwing tonen als de gebruiker bestaat
		 Write-Warning "De gebruiker met gebruikersnaam $Username bestaat al."
	}
	else
	{		
        #Accounts worden aangemaakt in het OU zoals aangegeven in de variable $OUPath
		New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@$UserDomain" `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -DisplayName "$Lastname, $Firstname" `
            -Path $OUPath `
            -Company $company `
            -OfficePhone $telephone `
            -EmailAddress $email `
            -Department $department `
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force) -ChangePasswordAtLogon $True
            
	}
}