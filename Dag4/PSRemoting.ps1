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
-ArgumentList (Get-Credential), 'Path'

