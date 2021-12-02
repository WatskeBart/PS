Enable-PSRemoting #PSRemoting inschakelen

Enter-PSSession #PS sessie starten

Invoke-Command -ScriptBlock {
    Param($c, $r) <#Deze variabelen worden aangemaakt in -ArgumentList (positioneel)#>
    New-PSDrive -Name Z
    -Credential $c
    -PSProvider FileSystem
    -Root $r
}
-ComputerName PC1, PC2
-ArgumentList (Get-Credential), 'Path' #Deze waarden worden meegegeven in het scriptblock als variabele $c (Get-Credential) en $r ('Path')

$ps = "Windows Powershell" #Instellen van variabele $ps
Invoke-Command -ComputerName PC1 -ScriptBlock {Get-WinEvent -LogName $Using:ps} #Voer commando uit op remote machine en gebruik een lokale variabele ($ps) in het ScriptBlock