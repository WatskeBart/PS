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

#Implicit Remoting, is het laden van remote commands op jouw lokale machine

$computers = New-PSSession -ComputerName PC1, PC2 #Start een PS sessie op de machines PC1 en PC2
Invoke-Command -Session $computers -ScriptBlock {
    Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" <#Gebruik de Class Win32_LogicalDisk gefilterd op DriveType 3 en haal deze info op de machines $computers#>
} | ConvertTo-Html -Property PSComputerName,DeviceID,FreeSpace,Size | Out-File vrijeruimte.html #Converteer de output naar HTML en laat alleen bepaalde Properties zien, en exporteer deze naar een HTML bestand met Out-File


