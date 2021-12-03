<#
.SYNOPSIS
    Dit script importeert alle gebruikers uit een CSV bestand in Active Directory

.DESCRIPTION
    Dit script is ontwikkeld om makkelijk grote hoeveelheden gebruikers te importeren in Active Directory.
    Er is tevens een voorbeeld bestand (Gebruikers.csv) welke als sjabloon gebruikt kan worden.

.PARAMETER -CSVFile
    Ingeven van het pad naar het CSV bestand

.PARAMETER -UserDomain
    Ingeven van het UserDomain

.PARAMETER -OUPath
    Ingeven van de gewenste OU

.EXAMPLE
    ImportADUsers.ps1 -CSVFile "C:\Gebruikers.csv" -UserDomain "mijndomein.com" -OUPath "CN=Users,DC=mijndomeinn,DC=com"

.EXAMPLE
    ImportADUsers.ps1
    Wanneer je het script start zonder parameters, zullen de verplichte parameters interactief gevraagd worden.

.NOTES
    Auteur: WatskeBart
    Laatst bijgewerkt: 2021-12-02
    Versie 1.0 - Initiele versie

#>

#Bepaalde parameters verplichten voor de werking van het script.
param (
    [Parameter(Mandatory = $true)][string]$CSVFile,
    [Parameter(Mandatory = $true)][string]$UserDomain,
    [Parameter(Mandatory = $true)][string]$OUPath
)

#Controleer of het opgegeven CSV pad geldig is.
$CheckCSV = Test-Path $CSVFile

#Waarschuwing weergeven wanneer het CSV pad ongeldig is.
If (-not $CheckCSV) { Write-Host -BackgroundColor Black -ForegroundColor Yellow 'Controleer het pad naar het CSV bestand en probeer het opnieuw!'; exit }

#Controleer of het opgegeven OU pad geldig is.
[string] $Path = $OUPath
try {
    $ou_exists = [adsi]::Exists("LDAP://$Path")
}
catch {
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
$confirmation = Read-Host "Kloppen deze gegevens? Typ 'correct' om door te gaan (zonder aanhalingstekens en hoofdlettergevoelig)"
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
foreach ($User in $ADUsers) {
		
    $Username = $User.username
    $Password = $User.password
    $Firstname = $User.firstname
    $Lastname = $User.lastname
    $email = $User.email
    $telephone = $User.telephone
    $company = $User.company
    $department = $User.department


    #Controleer of gebruiker al bestaat
    if (Get-ADUser -F { SamAccountName -eq $Username }) {
        #Waarschuwing tonen als de gebruiker bestaat
        Write-Warning "De gebruiker met gebruikersnaam $Username bestaat al."
    }
    else {		
        #Accounts worden aangemaakt in het OU zoals aangegeven in de variable $OUPath
        $ADdata = @{
            SamAccountName = $Username
            UserPrincipalName = "$Username@$UserDomain"
            Name = "$Firstname $Lastname"
            GivenName = $Firstname
            Surname = $Lastname
            Enabled = $True
            DisplayName = "$Lastname, $Firstname"
            Path = $OUPath
            Company = $company
            OfficePhone = $telephone
            EmailAddress = $email
            Department = $department
            AccountPassword = (convertto-securestring $Password -AsPlainText -Force)
            ChangePasswordAtLogon = $True
        }
        New-ADUser @ADdata
            
    }
}